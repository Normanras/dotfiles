local M = {}

-- Function to get visual selection
local function get_visual_selection()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])

    -- Handle partial line selections
    if #lines == 1 then
        lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
    else
        lines[1] = string.sub(lines[1], start_pos[3])
        lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    end

    return table.concat(lines, '\n')
end

-- Function to create carbon 50<
function M.create_screenshot()
    -- Get the visual selection
    local code = get_visual_selection()
    if code == "" then
        vim.notify("No text selected", vim.log.levels.ERROR)
        return
    end

    -- Get file extension for language detection
    local file_extension = vim.fn.expand('%:e')

    -- Get download directory
    local download_dir = vim.fn.expand('~/Downloads')
    local timestamp = os.date("%Y%m%d_%H%M%S")
    local output_file = string.format("%s/carbon_%s.png", download_dir, timestamp)

    -- Prepare the curl command
    local carbon_url = "https://carbonara.solopov.dev/api/cook"
    local json_data = string.format([[{
        "code": %s,
        "theme": "one-dark",
        "language": "%s",
        "dropShadow": true,
        "windowControls": true,
    }]], vim.fn.json_encode(code), file_extension)

    -- Create temporary file for JSON data
    local temp_json = os.tmpname()
    local f = io.open(temp_json, "w")
    f:write(json_data)
    f:close()

    -- Execute curl command
    local cmd = string.format(
			'curl -L %s -X POST -H "Content-Type: application/json" --data %s --output %s',
				carbon_url,
        json_data,
        output_file
    )
		vim.print(cmd)
-- [[--
-- curl -L https://carbonara.solopov.dev/api/cook \
-- -X POST \
-- -H 'Content-Type: application/json' \
-- -d '{
--       "code": "export default const sum = (a, b) => a + b",
--       "backgroundColor": "#1F816D"
--     }' \
-- > code.png
-- 		--]]
    -- Run the command asynchronously
    vim.fn.jobstart(cmd, {
        on_exit = function(_, exit_code)
            -- Clean up temp file
            -- os.remove(temp_json)
						os.rename(temp_json, '~/Downloads/temp_json.json')

            if exit_code == 0 then
                vim.notify(
                    string.format("Screenshot saved to %s", output_file),
                    vim.log.levels.INFO
                )
            else
                vim.notify(
                    "Failed to create screenshot",
                    vim.log.levels.ERROR
                )
            end
        end
    })
end

-- Set up the plugin
function M.setup()
    -- Create user command
    vim.api.nvim_create_user_command(
        'CodeShot',
        function()
            M.create_screenshot()
        end,
        { range = true }
    )
end

return M


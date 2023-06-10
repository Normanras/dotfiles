-----------------------------------------------------------
-- startify configuration file
-----------------------------------------------------------
return {
  "goolord/alpha-nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
      local alpha = require'alpha'
	local startify = require'alpha.themes.startify'

       startify.section.header.val = {
	  "                                                                                           ",
	  " █████   █████                        ██████   █████                                   ███ ",
	  "░░███   ░░███                        ░░██████ ░░███                                   ░███ ",
	  " ░███    ░███   ██████  █████ ████    ░███░███ ░███   ██████  ████████  █████████████ ░███ ",
	  " ░███████████  ███░░███░░███ ░███     ░███░░███░███  ███░░███░░███░░███░░███░░███░░███░███ ",
	  " ░███░░░░░███ ░███████  ░███ ░███     ░███ ░░██████ ░███ ░███ ░███ ░░░  ░███ ░███ ░███░███ ",
	  " ░███    ░███ ░███░░░   ░███ ░███     ░███  ░░█████ ░███ ░███ ░███      ░███ ░███ ░███░░░  ",
	  " █████   █████░░██████  ░░███████     █████  ░░█████░░██████  █████     █████░███ ████████ ",
	  "░░░░░   ░░░░░  ░░░░░░    ░░░░░███    ░░░░░    ░░░░░  ░░░░░░  ░░░░░     ░░░░░ ░░░ ░░░░░░░░  ",
	  "                         ███ ░███                                                          ",
	  "                        ░░██████                                                           ",
	  "                         ░░░░░░                                                            ",
	  }


     --[[ startify.section.mru.val = {
	{ type = "text",
	  val =  findtodos,
	  opts = {
	    position = "left",
	    hl = {{"hl_group", 0, -2}}
	  }
	}
      }--]]
      startify.section.mru_cwd.val = { { type = "padding", val = 0 } }

      -- Devicons - Not sure what this doe
      startify.nvim_web_devicons.enabled = false
      startify.nvim_web_devicons.highlight = false
      startify.nvim_web_devicons.highlight = 'Number'

      -- Top Menu
      startify.section.top_buttons.val = {
	  startify.button('e', ' New file', ':ene <BAR> startinsert<CR>'),
	  startify.button('f', ' Find file', ':Telescope file_browser<CR>'),
	  startify.button('s', '⋅Find Word', ':Telescope live_grep<CR>'),
	  startify.button('t', '& Todo List', ':TodoTrouble keywords=TODO<CR>'),
	  startify.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
	  startify.button('u', ' Show plugins', ':Lazy<CR>'),
	  startify.button('q', ' Quit', ':qa<CR>'),
	}

      -- Bottom Menu
      startify.section.bottom_buttons.val = {
      -- Show Empty Space
      }

--[[      local function footer()
        local version = vim.version()
	local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
	local datetime = os.date('%Y/%m/%d %H:%M:%S')
	return print_version .. ' ' .. datetime
      end
      --]]

     startify.section.footer.val = {

     }
      alpha.setup(startify.config)
    end
  }

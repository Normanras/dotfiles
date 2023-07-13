-- For Neovim >= 0.7.0
return {
	 "gregorias/nvim-mapper",
    	before = "telescope.nvim",
	config = function()
		Mapper = require("nvim-mapper")
		local M = Mapper.map
		local default_opts = {noremap=true, silent=true}

	-- Sidebar Plugin
	  M('n', '<leader>n', ':SidebarNvimToggle<CR>', default_opts,
	  "Sidebar Toggle", "sidebar-toggle", "Open or Close Sidebar"
	  )
	  M('n', '<leader>q', ':SidebarNvimUpdate<CR>', default_opts,
	  "Sidebar Update", "sidebar-update", "Refresh the Sidebar"
	  )

	  -- Telescope Options
	  M('n', '<leader>ff', ':Telescope find_files<CR>', default_opts,
	  "Find Files", "find-files", "Find Files in Telescope pop-up"
	  )
	  M('n', '<leader>fg', ':Telescope live_grep<CR>', default_opts,
	  "Live Grep", "live-grep", "Grep Files in Telescope pop-up"
	  )
	  M('n', '<leader>fb', ':Telescope buffers<CR>', default_opts,
	  "Buffers", "buffers", "See Buffers in Telescope pop-up"
	  )
	  M('n', '<leader>fe', ":Telescope file_browser<CR>", default_opts,
	  "Telescope Files", "telescope-file-browser", "Find files and directories in telescope"
	  )
	  M('n', '<leader>fk', ":Telescope keymaps<CR>", default_opts,
	  "Telescope Keymaps", "telescope-keymaps", "Easily find Keymaps using Telescope")

	-- Macros for Todo Trouble
	  M('n', '<C-t>', "@t<CR>", default_opts,
	  "Add Todo", "todo_todo", "Add To-do/Task to the beginning of the line"
	  )

	  M('n', '<C-s>', "@s<CR>", default_opts,
	  "Add Solutions Engineering", "todo_seng", "Add Solutions Engineering to the beginning of the line"
	  )

	  M('n', '<C-f>', "@f<CR>", default_opts,
	  "Add Feature", "add_feat", "Add Feature Request tag to the beginning of the line. "
	  )

	  M( 'n', '<C-x>', "@c<CR>", default_opts,
	  "Replace with Complete", "add_complete", "Replace tag with Complete tag at beginning of the line."
	  )

	  M('n', '<C-r>', "@w<CR>", default_opts,
	  "Add Warning/Error", "add_error", "Add Warning/Error tag at the beginning of the line."
	  )

	  M('n', '<leader>ce', ":TodoTrouble keywords=TODO<CR>", default_opts,
	  "Show Todo Tags", "show_todos", "Show Todo Tags."
	  )

	  M('n', '<leader>cf', ":TodoTrouble keywords=FEAT<CR>", default_opts,
	  "Show Feature Tags", "show_features", "Show Feature Requests."
	  )

	  M('n', '<leader>cq', ":TodoTrouble keywords=ERROR, WARN<CR>", default_opts,
	  "Show Warning Tags", "show_warnings", "Show Errors Tags."
	  )

	-- Formatting Keymaps
	  M('n', '<leader>b', ":! black %<CR>", default_opts,
	  "Black Formatting", "black_current_file", "Use Black Formatting on Current File."
	  )
	  M('n', '<leader>m', ":! markdownlint -f %<CR>", default_opts,
	  "Markdownlint", "md_lint_format", "Use mdlint Formatting on Current File."
	  )
	  M('n', '<leader>r30', ":resize 30<CR>", default_opts,
	  "Resize30", "resize_30", "Resize Window to #30"
	  )
	end,
	}



return {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = {
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope-live-grep-args.nvim',
      },

      config = function ()
	  local g = vim.g
	  local fb_actions = require "telescope".extensions.file_browser.actions
	  local themes = {
	    popup_list = {
	      theme = 'popup_list',
	      border = true,
	      preview = false,
	      prompt_title = false,
	      results_title = false,
	      sorting_strategy = 'ascending',
	      layout_strategy = 'center',
	      borderchars = {
		prompt  = { '─', '│', '─', '│', '┌', '┐', '┤', '└' },
		results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
		preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
	      },
	    },
	    popup_extended = {
	      theme = 'popup_extended',
	      prompt_title = false,
	      results_title = false,
	      layout_strategy = 'center',
	      layout_config = {
		width = 0.7,
		height = 0.3,
		mirror = true,
		preview_cutoff = 1,
	      },
	      borderchars = {
		prompt  = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
		results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
		preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
	      },
	    },
	    command_pane = {
	      theme = 'command_pane',
	      preview = false,
	      prompt_title = false,
	      results_title = false,
	      sorting_strategy = 'descending',
	      layout_strategy = 'bottom_pane',
	      layout_config = {
		height = 13,
		preview_cutoff = 1,
		prompt_position = 'bottom'
	      },
	    },
	    ivy_plus = {
	      theme = 'ivy_plus',
	      preview = false,
	      prompt_title = false,
	      results_title = false,
	      layout_strategy = 'bottom_pane',
	      layout_config = {
		height = 13,
		preview_cutoff = 120,
		prompt_position = 'bottom'
	      },
	      borderchars = {
		prompt  = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		results = { '─', '│', '─', '│', '┌', '┬', '┴', '└' },
		preview = { '─', '│', ' ', ' ', '─', '┐', '│', ' ' },
	      },
	    },
	  }
	  local telescope_installer = require('telescope').setup({
	    defaults = {
	      border = true,
	      prompt_title = false,
	      results_title = false,
	      color_devicons = false,
	      layout_strategy = 'horizontal',
	      borderchars = {
		prompt  = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
	      },
	      layout_config = {
		bottom_pane = {
		  height = 20,
		  preview_cutoff = 120,
		  prompt_position = 'top'
		},
		center = {
		  height = 0.4,
		  preview_cutoff = 40,
		  prompt_position = 'top',
		  width = 0.7
		},
		horizontal = {
		  prompt_position = 'top',
		  preview_cutoff = 40,
		  height = 0.9,
		  width = 0.8
		}
	      },
	      sorting_strategy = 'ascending',
	      prompt_prefix = ' ',
	      selection_caret = ' → ',
	      entry_prefix = '   ',
	      file_ignore_patterns = {'node_modules'},
	      path_display = { 'truncate' },
	      results_title = false,
	      prompt_title =false,
	      preview = {
		treesitter = {
		  enable = {
		    'css', 'dockerfile', 'elixir', 'erlang', 'fish',
		    'html', 'http', 'javascript', 'json', 'lua', 'php',
		    'python', 'regex', 'ruby', 'rust', 'scss', 'svelte',
		    'typescript', 'vue', 'yaml', 'markdown', 'bash', 'c',
		    'cmake', 'comment', 'cpp', 'dart', 'go', 'jsdoc',
		    'json5', 'jsonc', 'llvm', 'make', 'ninja', 'prisma',
		    'proto', 'pug', 'swift', 'todotxt', 'toml', 'tsx',
		  }
		}
	      },
	      mappings = {
		i = {
		  ['<esc>'] = require('telescope.actions').close,
		},
	      }
	    },
	    extensions = {
	      file_browser = {
		mappings = {
		  ["i"] = {
		    ["<C-c>"] = fb_actions.create,
		    ["<C-y>"] = fb_actions.copy,
		    ["<C-r>"] = fb_actions.rename,
		    ["<C-w>"] = fb_actions.goto_cwd,
		    ["<C-o>"] = fb_actions.open,
		    ["<C-d>"] = fb_actions.remove
		  },
		},
	      },
	      fzf = {
		fuzzy = true,                    -- false will only do exact matching
		override_generic_sorter = true,  -- override the generic sorter
		override_file_sorter = true,     -- override the file sorter
		case_mode = 'smart_case',        -- other options: 'ignore_case' or 'respect_case'
	      }
	    }
	  })
      require("telescope").load_extension "file_browser"
      require("telescope").load_extension "mapper"
      require("telescope").load_extension "live_grep_args"
      require("telescope").load_extension "fzf"
    end

	}}


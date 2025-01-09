return {
----------------------------------------------------------------
-- LSP and Autocomplete Plugins
-- They should be pulled first!
-----------------------------------------------------------------

{'williamboman/mason.nvim',
  config = function() require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }
  })
    end,
  },
    { 'williamboman/mason-lspconfig.nvim',
      config = function() require("mason-lspconfig").setup{} end,
    },
    { 'neovim/nvim-lspconfig' },
	{
	'hinell/lsp-timeout.nvim',
	dependencies={ "neovim/nvim-lspconfig" }
    },
    {
    'L3MON4D3/LuaSnip', version = "2.*",
      build = "make install_jsregexp",
      dependencies = { "friendly-snippets" },
      config = function()
		require("luasnip").setup({
		  history = true,
		  delete_check_events = "TextChanged",
		})
		require("luasnip").filetype_extend("liquid", {"html","css","javascript"})
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").load({
		  })
		-- require("luasnip.extras.filetype_functions").extend_load_ft({
		-- 	liquid = {"html", "css", "javascript" },
		--  })
      end,
  },


------------------------------------------------------------
-- General Functionality
------------------------------------------------------------

	-- Todo Manager
	{
    "Dan7h3x/LazyDo",
    branch = "main",
    keys = {
			{
			"<F2>","<ESC><CMD>LazyDoToggle<CR>",
			mode = {"n","i"},
			},
    },
    event = "VeryLazy",
		opts = {},
	},

	-- Neovim statusline
	{
		'nvim-lualine/lualine.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function() require('lualine').setup({
	 		options = {
				theme = 'nord',
				-- always_divide_middle = false,
			},
			sections = {
				lualine_x = { {
					function()
						return require("lazydo").get_lualine_stats()
					end,
					cond = function()
						return require("lazydo")._initialized
					end,
				},
					{"fileformat", symbols = { unix = " " }, "filetype" },
			},
			},
		})
		end,
	},

	-- A file explorer that lets you edit your filesystem like a normal Neovim buffer.
	{
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},

	-- vim plugin for asynchronous synchronisation of remote files and local files using rsync
  { 'kenn7/vim-arsync',
	dependencies={'prabirshrestha/async.vim'},
  },
	--The goal of nvim-ufo is to make Neovim's fold look modern and keep high performance.
  {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'},

	-- Open telescope and show files in the same directory as the current buffer.
  { 'MaximilianLloyd/adjacent.nvim' },

	--You can use this plugin to run HTTP requests directly in your favorite text editor.
  { 'BlackLight/nvim-http' },

	-- Vim plugin for compiling, uploading, and debugging arduino sketches.
	-- It uses arduino-cli when available (recommended), and falls back to
	-- using the Arduino IDE's commandline interface (new in 1.5.x).
  { 'stevearc/vim-arduino'},

	-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
	-- :DiffviewFileHistory %
  { 'sindrets/diffview.nvim' },

	-- numb.nvim is a Neovim plugin that peeks lines of the buffer in non-obtrusive way.
  {
    'nacro90/numb.nvim',
    config = function() require('numb').setup{
      show_cursorline = false,
      show_numbers = false, -- Enable 'number' for the window while peeking
      hide_relativenumbers = false, -- Enable turning off 'relativenumber' for the window while peeking
      number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
      centered_peeking = true,
    }
    end,
  },

-- Nvim Tree File Manager on the Left
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons"},
  config = function()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
	view = {
	  width = 30,
	},
	renderer = {
	  group_empty = true,
	},
	filters = {
	  dotfiles = true,
	},
	diagnostics = {
	  enable = true,
	},
      })
  end,
},

  -- Tmux Navigation
  {
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end
  },
	-- Toggle an f-string when cursor is inside quoted string.
  {
  "roobert/f-string-toggle.nvim",
    config = function()
      require("f-string-toggle").setup{
	key_binding = "<leader>g"
      }
    end,
  },

  -- Snippets
  'rafamadriz/friendly-snippets',

  -- Rename and Work with Buffer & Tabs
  {'romgrk/barbar.nvim',
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },


  -- Trouble Shows Errors with Files.
  {
    "folke/trouble.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("trouble").setup {
      }
    end
  },

	-- Which Key - pop-up that shows keymaps.
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  },

-- Top Right Notify Pop Up
	 {
	"rcarriga/nvim-notify",
	   config = function ()
	     require("notify").setup {
	      }
	      -- vim.api.nvim_notify = require('notify')
		  vim.notify = require('notify')
	    end
	  },
	-- Custom Terminal within Neovim
  {'akinsho/toggleterm.nvim', version = "*", opts = {
	direction = 'float',
  }},


------------------------------------------------------------
-- echasnovski's Minis get a section of their own...
------------------------------------------------------------

{ 'echasnovski/mini.pick', version = '*',
	config = function()
			require('mini.pick').setup()
		end
	},
{
    'echasnovski/mini.comment', version = '*',
    config = function()
      require('mini.comment').setup()
    end
  },
  {
    'echasnovski/mini.move',
    config = function()
      require('mini.move').setup({
      mappings = {
				 left  = '<S-left>',
				 right = '<S-right>',
				 down  = '<S-down>',
				 up    = '<S-up>',

				 line_left  = '<S-left>',
				 line_right = '<S-right>',
				 line_down  = '<S-down>',
				 line_up    = '<S-up>',
      }
      })
    end
  },
  {
  'echasnovski/mini.trailspace',
    config = function()
      require('mini.trailspace').setup()
    end
  },
  {
  'echasnovski/mini.surround', version = '*',
    config = function()
      require('mini.surround').setup()
    end
  },
  {
    'echasnovski/mini.pairs', branch = 'stable',
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'echasnovski/mini.fuzzy', branch = 'stable',
    config = function()
      require('mini.fuzzy').setup()
    end
  },
  {
	'echasnovski/mini.hipatterns', version = false,
	-- event = "BufReadPre",
	config = function()
	  local hipatterns = require('mini.hipatterns')
	  hipatterns.setup({
		  highlighters = {
			hex_color = hipatterns.gen_highlighter.hex_color(),
			hsl_color = {
			  pattern = "hsl%(%d+,? %d+,? %d+%)",
			  group = function(_, match)
				local utils = require("solarized-osaka.hsl")
				local nh, ns, nl = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
				local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
				local hex_color = utils.hslToHex(h, s, l)
				return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
			  end,
			},
		  },
		})
	  end
  },

-----------------------------------------------------------
-- Markdown Plugins
------------------------------------------------------------

  --  {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd app && npm install",
  --   ft = "markdown",
  --   lazy = true,
  --   keys = { { "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
  --   init = function()
  --  vim.g.mkdp_filetypes = { "markdown" }
  --     vim.g.mkdp_auto_close = true
  --     vim.g.mkdp_open_to_the_world = false
  --     vim.g.mkdp_open_ip = "127.0.0.1"
  --     vim.g.mkdp_port = "8888"
  --     vim.g.mkdp_browser = ""
  --     vim.g.mkdp_echo_preview_url = true
  --     vim.g.mkdp_page_title = "${name}"
  --   end,
  -- },
  { "jbyuki/venn.nvim" },

  -- DAP (Debug adaptor Protocol)
  'mfussenegger/nvim-dap',

 -- {
 --   'mfussenegger/nvim-dap-python',
 --   config = function()
 --     require('dap-python').setup(
 --     '~/.virtualenvs/debugpy/bin/python'
 --     )
 --    end
 --  },
  {
	'rcarriga/nvim-dap-ui', dependencies = {"mfussenegger/nvim-dap"}
  },

---------------------------------------------------------
-- Text, Icons, Symbols
----------------------------------------------------------

  -- {
  --   'simrat39/symbols-outline.nvim',
  --   config = function()
  --     require('symbols-outline').setup()
  --   end
  -- },
  {
  "j-hui/fidget.nvim",
  opts = {
    -- options
	},
  },
  'lukas-reineke/indent-blankline.nvim',
  'karb94/neoscroll.nvim',

  -- Allow Popups for Telescope etc
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',

  -- Todo & Comments for Organization
  {
    'folke/todo-comments.nvim',
      dependencies = "nvim-lua/plenary.nvim",
        config = function()
          require("todo-comments").setup {
               keywords = {
                  FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                  -- signs = false, -- configure signs for some keywords individually
                  },
                  DONE = { icon = " ", color = "info" },
    IN_PROG = { icon = "󰇘", color = "default" },
                  FEAT = { icon = " ", color = "warning", alt = { "NEED", "REQUEST" } },
                  WARN = { icon = " ", color = "error", alt = { "WARNING", "ERROR" } },
                  TODO = { icon = " ", color = "hint", alt = { "TASK", "TBD" } },
                  RISK = { icon = " ", color = "hint", alt = { "RISK" } },
                  GOAL = { icon = " ", color = "test", alt = { "GOAL", "KPI"} },
                },
                highlight = {
                  comments_only = false,
                },
                colors = {
                  error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                  warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
                  info = { "DiagnosticInfo", "#2563EB" },
                  hint = { "DiagnosticHint", "#10B981" },
                  default = { "Identifier", "#7C3AED" },
                  test = { "Identifier", "#FF00FF" }
                },
     }
      end
  },
  -- Various telescopes
  'nvim-telescope/telescope-file-browser.nvim',

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },

-----------------------------------------------------------
-- Various Color Schemes, Dashboard, etc
-----------------------------------------------------------


	{'jaredgorski/spacecamp'},
  {
	"eldritch-theme/eldritch.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
  },
  { 'rktjmp/lush.nvim' },
  -- { 'normanras/link.nvim' },
  -- { dir = '/Users/normrasmussen/Documents/Projects/link-two/', lazy = true},
  {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
  'Mofiqul/dracula.nvim',
  'rose-pine/neovim',
  'EdenEast/nightfox.nvim',
  'rebelot/kanagawa.nvim',
  'catppuccin/nvim',
  'sainnhe/sonokai',
  {
  "oxfist/night-owl.nvim",
	  lazy = false, -- make sure we load this during startup if it is your main colorscheme
	  priority = 1000, -- make sure to load this before all the other start plugins
	  config = function()
		-- load the colorscheme here
		vim.cmd.colorscheme("night-owl")
	  end,
  },
	  {
   "philosofonusus/morta.nvim",
    name = 'morta',
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'morta'
    end,
  },
  {
    "folke/tokyonight.nvim",
	  lazy = false, -- make sure we load this during startup if it is your main colorscheme
	  priority = 1000, -- make sure to load this before all the other start plugins
	  config = function()
		-- load the colorscheme here
	   --  vim.cmd([[colorscheme tokyonight]])
	  end,
  },
  { 'bluz71/vim-nightfly-colors', name = "nightfly", lazy = true, priority = 1000 },
  'Bekaboo/deadcolumn.nvim',

  -- UI Improvements and Changes
	-- This is a Neovim plugin to autocorrect common misspellings and typos. If you type teh, neovim will automatically correct it to the.
{
  "https://git.sr.ht/~swaits/thethethe.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = { },
},
  'HiPhish/rainbow-delimiters.nvim',
  {
    "wookayin/semshi",
    ft = "python",
    build = ":UpdateRemotePlugins",
    config = function()
      vim.api.nvim_set_hl(0, "semshiLocal", { ctermfg=209, fg="#80aa9e" } )
      vim.api.nvim_set_hl(0, "semshiGlobal", { ctermfg=214, fg="#d3869b" } )
      vim.api.nvim_set_hl(0, "semshiImported", { ctermfg=214, fg="#8bba7f", cterm=bold, gui=bold } )
      vim.api.nvim_set_hl(0, "semshiParameter", { ctermfg=75,  fg="#8bba7f" } )
      vim.api.nvim_set_hl(0, "semshiParameterUnused", { ctermfg=117, fg="#34381b", cterm=underline, gui=underline} )
      vim.api.nvim_set_hl(0, "semshiFree", { ctermfg=218, fg="#e9b143"} )
      vim.api.nvim_set_hl(0, "semshiBuiltin", { ctermfg=207, fg="#f2594b"} )
      vim.api.nvim_set_hl(0, "semshiAttribute", { ctermfg=49,  fg="#3b4439"} )
      vim.api.nvim_set_hl(0, "semshiSelf", { ctermfg=249, fg="#db4740"} )
      vim.api.nvim_set_hl(0, "semshiUnresolved", { ctermfg=226, fg="#f28534", cterm=underline, gui=underline} )
      vim.api.nvim_set_hl(0, "semshiSelected", { ctermfg=231, fg="#ffffff", ctermbg=161, bg="#4c3432"} )
      vim.api.nvim_set_hl(0, "semshiErrorSign", { ctermfg=231, fg="#ffffff", ctermbg=160, bg="#402120"} )
      vim.api.nvim_set_hl(0, "semshiErrorChar", { ctermfg=231, fg="#ffffff", ctermbg=160, bg="#402120"} )
      vim.cmd([[sign define semshiError text=E> texthl=semshiErrorSign]])
    end
  },

-- Wakatime Tracking
  'wakatime/vim-wakatime',

----------------------------------------------
--- Custom Plugins and Tests
----------------------------------------------
  -- {
  --   dir = '/Users/normrasmussen/Documents/Projects/tasksPlugin.nvim/',
  --   dev = true,
  --   name = "Mkdn Tasks (DEV)",
  -- },
  -- {
  --   dir = '/Users/normrasmussen/Documents/Projects/pulse.nvim',
  --   dev = true,
  -- },
}


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
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").load({
			paths = {
  "~/.dotfiles/nvim/.config/nvim/lua/custom_snippets/" }
		  })
      end,
  },

  {"ellisonleao/glow.nvim", config = function() require("glow").setup() end },

    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'lukas-reineke/cmp-under-comparator',

  {
    'asiryk/auto-hlsearch.nvim',
    version = "1.1.0",
    config = function() require("auto-hlsearch").setup{} end,
  },

------------------------------------------------------------
-- General Functionality
------------------------------------------------------------

  { 'MaximilianLloyd/adjacent.nvim' },
  'BlackLight/nvim-http',
  { 'stevearc/vim-arduino'},
  { 'sindrets/diffview.nvim' },
  { 'skwee357/nvim-prose' },
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
  {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function() require('lualine').setup({
    options = {
	  theme = 'material',
	  always_divide_middle = false,
	},
	sections = {
	  lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
	},
})
  end,
},

-- Nvim Tree File Manager on the Left
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
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
--  'pacha/vem-tabline',
  {'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },


  -- Trouble Shows Errors with Files.
  {
    "folke/trouble.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("trouble").setup {
      }
    end
  },

-- Which Key
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  },
-- Styler - for per filetype colorschemes
 {
 "folke/styler.nvim",
 config = function()
   require("styler").setup({
 	themes = {
 	  -- md = { colorscheme = "kanagawa" },
 	  -- python = { colorscheme = "catppuccin" },
 	  -- javascript = { colorscheme = "dracula" },
 	  -- html = { colorscheme = "tokyonight" },
 	},
 })
 end,
  },
  "hrsh7th/nvim-cmp",       -- optional, for completion
  "ggandor/lightspeed.nvim",

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

  {'akinsho/toggleterm.nvim', version = "*", opts = {
	direction = 'float',
  }},

------------------------------------------------------------
-- echasnovski's Minis get a section of their own...
------------------------------------------------------------

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

-----------------------------------------------------------
-- Markdown Plugins
------------------------------------------------------------

   {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    lazy = true,
    keys = { { "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
    init = function()
	  vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_close = true
      vim.g.mkdp_open_to_the_world = false
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8888"
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = true
      vim.g.mkdp_page_title = "${name}"
    end,
  },
  { "jbyuki/venn.nvim" },
 --[[
  { 'toppair/peek.nvim',
      build = 'deno task --quiet build:fast',
      config = function()
	require('peek').setup()
      end
    },
    ]]--
  -- DAP (Debug adaptor Protocol)
  'mfussenegger/nvim-dap',

 {
   'mfussenegger/nvim-dap-python',
   config = function()
     require('dap-python').setup(
     '~/.virtualenvs/debugpy/bin/python'
     )
    end
  },
 -- Sidebar
--  {
--    'sidebar-nvim/sidebar.nvim',
--    config = function()
--      require("sidebar-nvim").setup({
--       side = "right",
--       sections = {
--    "git",
--    "symbols",
--    "diagnostics",
--      },
--  todos = {
--    initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
--  },
--  diagnostics = {
--    icon = "",
--  },
--   })
--   end
-- },
--
{
  'rcarriga/nvim-dap-ui', dependencies = {"mfussenegger/nvim-dap"}
},

---------------------------------------------------------
-- Text, Icons, Symbols
----------------------------------------------------------

  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
  "j-hui/fidget.nvim",
  tag = "legacy",
  event = "LspAttach",
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
                  SENG = { icon = " ", color = "test", alt = { "SOLUTIONS", "SE", "WORKAROUND" } },
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

  -- ColorSchemes
  {
	'norcalli/nvim-colorizer.lua',
	config = function()
          require("colorizer").setup {
		'*';
	  }
	end,
  },
  'Mofiqul/dracula.nvim',
  -- 'ray-x/starry.nvim',
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
  {
        "dustypomerleau/tol.nvim",
        lazy = false, -- load the colorscheme at startup
        priority = 1000, -- load colorscheme first
        config = true,
    },

  -- UI Improvements and Changes
{
  "https://git.sr.ht/~swaits/thethethe.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = { },
},
  'HiPhish/rainbow-delimiters.nvim',
  -- {
  --   "wookayin/semshi",
  --   ft = "python",
  --   build = ":UpdateRemotePlugins",
  --   config = function()
  --     vim.api.nvim_set_hl(0, "semshiLocal", { ctermfg=209, fg="#80aa9e" } )
  --     vim.api.nvim_set_hl(0, "semshiGlobal", { ctermfg=214, fg="#d3869b" } )
  --     vim.api.nvim_set_hl(0, "semshiImported", { ctermfg=214, fg="#8bba7f", cterm=bold, gui=bold } )
  --     vim.api.nvim_set_hl(0, "semshiParameter", { ctermfg=75,  fg="#8bba7f" } )
  --     vim.api.nvim_set_hl(0, "semshiParameterUnused", { ctermfg=117, fg="#34381b", cterm=underline, gui=underline} )
  --     vim.api.nvim_set_hl(0, "semshiFree", { ctermfg=218, fg="#e9b143"} )
  --     vim.api.nvim_set_hl(0, "semshiBuiltin", { ctermfg=207, fg="#f2594b"} )
  --     vim.api.nvim_set_hl(0, "semshiAttribute", { ctermfg=49,  fg="#3b4439"} )
  --     vim.api.nvim_set_hl(0, "semshiSelf", { ctermfg=249, fg="#db4740"} )
  --     vim.api.nvim_set_hl(0, "semshiUnresolved", { ctermfg=226, fg="#f28534", cterm=underline, gui=underline} )
  --     vim.api.nvim_set_hl(0, "semshiSelected", { ctermfg=231, fg="#ffffff", ctermbg=161, bg="#4c3432"} )
  --     vim.api.nvim_set_hl(0, "semshiErrorSign", { ctermfg=231, fg="#ffffff", ctermbg=160, bg="#402120"} )
  --     vim.api.nvim_set_hl(0, "semshiErrorChar", { ctermfg=231, fg="#ffffff", ctermbg=160, bg="#402120"} )
  --     vim.cmd([[sign define semshiError text=E> texthl=semshiErrorSign]])
  --   end
  -- },

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


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

  -- Manage all your Keymaps!
  {
    "gregorias/nvim-mapper",
    config = function() require("nvim-mapper").setup{} end,
    before = "telescope.nvim"
  },

  {
    'L3MON4D3/LuaSnip', version = "1.2.1",
      dependencies = { "friendly-snippets" },
  },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
  {
    'asiryk/auto-hlsearch.nvim',
    version = "1.1.0",
    config = function() require("auto-hlsearch").setup{} end,
  },

------------------------------------------------------------
-- General Functionality
------------------------------------------------------------

  {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function() require('lualine').setup{
    options = { theme = 'palenight' }
  } end,
},
  -- Tmux Navigation
  {
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end
  },

  -- Snippets
  'rafamadriz/friendly-snippets',

  -- Rename and Work with Buffer & Tabs
--  'pacha/vem-tabline',
  {'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- Nvim Tree File Manager on the Left
  'nvim-tree/nvim-tree.lua',

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
  "hrsh7th/nvim-cmp",       -- optional, for completion

-- Top Right Notify Pop Up
  'rcarriga/nvim-notify',

-- echasnovski Mini Modules (Selected)
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

  -- DAP (Debug adaptor Protocol)
  'mfussenegger/nvim-dap',

 -- Sidebar
 {
   'sidebar-nvim/sidebar.nvim',
   config = function()
     require("sidebar-nvim").setup({
      side = "right",
      sections = {
   "git",
   "symbols",
   "diagnostics",
   "files",
   "todos",
     },
 todos = {
   initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
 },
 diagnostics = {
   icon = "",
 },
  })
  end
},

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

  'lukas-reineke/indent-blankline.nvim',
  'folke/lsp-colors.nvim',
  'karb94/neoscroll.nvim',

  -- Allow Popups for Telescope etc
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',

  -- Various telescopes
  'nvim-telescope/telescope-file-browser.nvim',

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },

-----------------------------------------------------------
-- Various Color Schemes, Dashboard, etc
-----------------------------------------------------------

 {'ray-x/starry.nvim', setup=function()
 end},
  'EdenEast/nightfox.nvim',
  'catppuccin/nvim',
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
    end,
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = true, priority = 1000 },
  'Bekaboo/deadcolumn.nvim',
  {
    'feline-nvim/feline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

-- Wakatime Tracking
  'wakatime/vim-wakatime'
  }

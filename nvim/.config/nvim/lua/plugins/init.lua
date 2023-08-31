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
    'L3MON4D3/LuaSnip', version = "2.0.0",
      build = "make install_jsregexp",
      dependencies = { "friendly-snippets" },
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
  { 'stevearc/vim-arduino'},
  { 'sindrets/diffview.nvim' },
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
  config = function() require('lualine').setup{
    options = { theme = 'palenight' }
  } end,
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
    require("nvim-tree").setup {}
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
  "hrsh7th/nvim-cmp",       -- optional, for completion

-- Top Right Notify Pop Up
  'rcarriga/nvim-notify',
  {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}},

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
    config = function()
      vim.g.mkdp_auto_close = true
      vim.g.mkdp_open_to_the_world = false
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8888"
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = true
      vim.g.mkdp_page_title = "${name}"
    end,
  },
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
  'Mofiqul/dracula.nvim',
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

 {'ray-x/starry.nvim', setup=function()
 end},
  'rose-pine/neovim',
  'EdenEast/nightfox.nvim',
  'catppuccin/nvim',
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
     --  vim.cmd([[colorscheme tokyonight]])
    end,
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = true, priority = 1000 },
  'Bekaboo/deadcolumn.nvim',
  -- {
  --   'm4xshen/smartcolumn.nvim',
  --       config = function()
  --         require("smartcolumn").setup{
  --    config = {
  --     colorcolumn = "100",
  --     disabled_filetypes = { "help" },
  --     custom_colorcolumn = {},
  --   },
  -- }
  --     end
  -- },
  {
    'feline-nvim/feline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  -- Plugin that causes your code to crumble >:)
  -- 'eandrju/cellular-automaton.nvim',

-- Wakatime Tracking
  'wakatime/vim-wakatime'
  }

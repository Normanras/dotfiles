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
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'lukas-reineke/cmp-under-comparator',

------------------------------------------------------------
-- General Functionality
------------------------------------------------------------

  { 'MaximilianLloyd/adjacent.nvim' },
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
  'karb94/neoscroll.nvim',

  -- Allow Popups for Telescope etc
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',

  -- Various telescopes
  'nvim-telescope/telescope-file-browser.nvim',

-----------------------------------------------------------
-- Various Color Schemes, Dashboard, etc
-----------------------------------------------------------

  'Mofiqul/dracula.nvim',
  'Bekaboo/deadcolumn.nvim',

-- Wakatime Tracking
  'wakatime/vim-wakatime',

----------------------------------------------
--- Custom Plugins and Tests
----------------------------------------------
}


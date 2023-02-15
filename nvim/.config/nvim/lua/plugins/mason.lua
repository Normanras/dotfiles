return {
    -- Easy Way to install Language Servers
  { 'williamboman/mason.nvim',
  },
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  config = function()
    require("mason").setup()
      local lsp_installer = require("mason-lspconfig").setup({
	automatic_instalsation = true,
	ui = {
	    icons = {
		server_installed = "✓",
		server_pending = "➜",
		server_uninstalled = "✗"
	    }
	}
    })
  end

}

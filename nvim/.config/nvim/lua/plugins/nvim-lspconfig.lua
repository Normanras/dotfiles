return {
   'neovim/nvim-lspconfig',
   config = function()
      -- Setup language servers.
	local lspconfig = require('lspconfig')
	local configs = require('lspconfig.configs')
	lspconfig.pylsp.setup{
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
	    settings = {
	      pylsp = {
			configurationSources = {"pylint"},
			plugins = {
		  pylint = { enabled = true },
		    }
		  }
		}
	      }
	}
      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
	  -- Enable completion triggered by <c-x><c-o>
	  vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

	  -- Buffer local mappings.
	  -- See `:help vim.lsp.*` for documentation on any of the below functions
	  local opts = { buffer = ev.buf }
	  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	  vim.keymap.set('n', '<space>wl', function()
	    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	  end, opts)
	  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
	  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
	  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
	  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	  vim.keymap.set('n', '<space>f', function()
	    vim.lsp.buf.format { async = true }
	  end, opts)
	end,
      })

	 local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	if not configs.ls_emmet then
	  configs.ls_emmet = {
		default_config = {
		  cmd = { 'ls_emmet', '--stdio' };
		  filetypes = {
			'html',
			'liquid',
			'css',
			'scss',
			'javascriptreact',
			'typescriptreact',
			'haml',
			'xml',
			'xsl',
			'pug',
			'slim',
			'sass',
			'stylus',
			'less',
			'sss',
			'handlebars',
		  };
		  root_dir = function(fname)
			return vim.loop.cwd()
		  end;
		  settings = {};
		};
	  }
	end
	lspconfig.ls_emmet.setup { capabilities = capabilities }
	  end
}

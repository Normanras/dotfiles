return {
   'neovim/nvim-lspconfig',
   config = function()
	-- Setup language servers.
		local lspconfig = require('lspconfig')
		local configs = require('lspconfig.configs')
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		lspconfig.emmet_ls.setup{
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "liquid" },
			init_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					},
				},
			}
		}
		lspconfig.ruff.setup{
			on_attach = on_attach,
			init_options = {
				settings = {
					args = {},
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
	end,
	}

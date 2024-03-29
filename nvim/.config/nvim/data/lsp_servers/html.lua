local lsp_config = require('plugins/nvim-lspconfig')
local on_attach = require('lsp/on_attach')

lsp_config.html.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})

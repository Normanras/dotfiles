local lsp_configs = require('plugins/nvim-lspconfig')

lsp_configs.prosemd = {
  default_config = {
    -- Update the path to prosemd-lsp
    cmd = { "/usr/local/bin/prosemd-lsp", "--stdio" },
    filetypes = { "markdown" },
    root_dir = function(fname)
      return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
    end,
    settings = {},
  }
}

-- Use your attach function here
lsp.prosemd.setup{ on_attach = on_attach }

return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
 'nvim-lua/plenary.nvim',
      },
      config = function ()
	local null_ls = require'null-ls'
	  null_ls.setup({
	    debug = true,
	    sources = {
	      null_ls.builtins.completion.spell,
	      null_ls.builtins.diagnostics.codespell,
	      null_ls.builtins.diagnostics.markdownlint.with({ extra_args = { "--disable", "MD013", "MD024", "--" }
	      ,}),
	      null_ls.builtins.diagnostics.ruff,
	      null_ls.builtins.diagnostics.pylama,
	 --     null_ls.builtins.diagnostics.pylint,
	 --     null_ls.builtins.diagnostics.pycodestyle.with({ extra_args = { "--max-line-length=150" }}),
	      null_ls.builtins.formatting.black.with({ extra_args = { "--fast" }}),
	    },
	  })
      end
}

return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
      config = function ()
	require("mason-null-ls").setup({
	    ensure_installed = nil,
	    automatic_installation = true,
      })
	local null_ls = require'null-ls'
	  null_ls.setup({
	    debug = true,
	    sources = {
	      null_ls.builtins.diagnostics.markdownlint.with({
				  extra_args = { "--disable", "MD024", "MD013", "--" }}),
	      null_ls.builtins.formatting.black,
	      null_ls.builtins.completion.luasnip,
	      null_ls.builtins.code_actions.gitsigns,
		  null_ls.builtins.diagnostics.pylint.with({
			diagnostics_postprocess = function(diagnostic)
			  diagnostic.code = diagnostic.message_id
			end,
		  }),
	    },
	  })
    end
}

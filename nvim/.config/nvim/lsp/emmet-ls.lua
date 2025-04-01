return {
  cmd = { 'emmet-ls', '--stdio' },
	root_markers = { './', },
	filetypes = { "astro", "css", "eruby", "html", "liquid", "htmldjango", "javascriptreact", "javascript", "js", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue", "htmlangular" },
	capabilities = capabilities,
	settings = {
		init_options = {
      html = {
        options = {
          ["bem.enabled"] = true,
        },
      },
    }
	}
}

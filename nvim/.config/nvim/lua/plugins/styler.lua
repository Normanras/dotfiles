return {
  "folke/styler.nvim",
  config = function()
    require("styler").setup({
      themes = {
        markdown = { colorscheme = "tokyonight-storm" },
	python = { colorscheme = "dracula" },
	html = { colorscheme = "carbonfox" },
        help = { colorscheme = "catppuccin-mocha", background = "dark" },
	css = { colorscheme = "carbonfox" }
      },
    })
  end,
}

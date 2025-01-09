return {
      'lukas-reineke/headlines.nvim',
	  dependencies = "nvim-treesitter/nvim-treesitter",
	  config = function()
	  require("headlines").setup {
	  markdown = {
        query = vim.treesitter.query.parse(
            "markdown",
            [[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @headline)

                (thematic_break) @dash

                (fenced_code_block) @codeblock

                (block_quote_marker) @quote
                (block_quote (paragraph (inline (block_continuation) @quote)))
		  ]]
        ),
		headline_highlights = {
				'Headline1',
				'Headline2',
				'Headline3',
				'Headline4',
				'Headline5',
				'Headline6',
			},
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = false,
	},
  }
	  vim.api.nvim_set_hl(0, 'Headline1', { fg = '#ffffff', bg = '#6272A4', italic = false })
      vim.api.nvim_set_hl(0, 'Headline2', { fg = '#000000', bg = '#8BE9FD', italic = false })
      vim.api.nvim_set_hl(0, 'Headline3', { fg = '#000000', bg = '#BD93F9', italic = false })
      vim.api.nvim_set_hl(0, 'Headline4', { fg = '#000000', bg = '#FFB86C', italic = false })
      vim.api.nvim_set_hl(0, 'Headline5', { fg = '#000000', bg = '#FF79C6', italic = false })
      vim.api.nvim_set_hl(0, 'Headline6', { fg = '#000000', bg = '#FF5555', italic = false })
      vim.api.nvim_set_hl(0, 'CodeBlock', { bg = '#222221' })
  end
}

return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = {
					'rafamadriz/friendly-snippets',
		      'L3MON4D3/LuaSnip',
			},
  version = 'v0.*',

  opts = {
    highlight = {
      use_nvim_cmp_as_default = true,
			nerd_font_variant = 'normal',
		}
	},

	trigger = {
		completion = {
			keyword_regex = '[%w_\\-]',
			blocked_trigger_characters = { ' ', '\n', '\t' },
			show_on_insert_on_trigger_character = true,
    	}
		},
	 sources = {
		providers = {
			{
				{ 'blink.cmp.sources.lsp' },
				{ 'blink.cmp.sources.path' },
				{ 'blink.cmp.sources.snippets', score_offset = -3 },
			},
			{ { 'blink.cmp.sources.buffer' } },
		}
	},
}

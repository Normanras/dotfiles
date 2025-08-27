return {
  'saghen/blink.cmp',
	version = '1.*',
	---@module 'blink.cmp'
  ---@type blink.cmp.Config
  dependencies = {
									'rafamadriz/friendly-snippets',
									'L3MON4D3/LuaSnip', version = 'v2.*',
									},
  opts = {
		-- tree = { enabled = true },
		keymap = {
      preset = "default",
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide', 'fallback' },
				['<Tab>'] = {
					function(cmp)
						if cmp.snippet_active() then return cmp.accept()
						else return cmp.select_and_accept() end
					end,
					'snippet_forward',
					'fallback'
				},
				['<S-Tab>'] = { 'snippet_backward', 'fallback' },
				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
				['<C-p>'] = { 'select_prev', 'fallback' },
				['<C-n>'] = { 'select_next', 'fallback' },
				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },
		appearance = {
			nerd_font_variant = 'mono',
		},
		completion = {documentation = { auto_show = false },
			-- menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
			-- keyword = { range = 'prefix', regex = '[%w_\\-]'},
			-- trigger = { show_on_blocked_trigger_characters = function()
			-- 							if vim.api.nvim_get_mode().mode == 'c' then return {} end
			-- 								return { ' ', '\n', '\t' }
			-- 							end },
		},
		-- snippets = {
		--     expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
		--     active = function(filter)
		--       if filter and filter.direction then
		--         return require('luasnip').jumpable(filter.direction)
		--       end
		--       return require('luasnip').in_snippet()
		--     end,
		--     jump = function(direction) require('luasnip').jump(direction) end,
		--   },
		 sources = {
			default = {'lsp', 'path', 'snippets', 'buffer'},
      },
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	  opts_extend = { "sources.default" }
}

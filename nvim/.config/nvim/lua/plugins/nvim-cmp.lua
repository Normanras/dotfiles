return {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'f3fora/cmp-spell',
    },
    config = function ()
      local cmp_status_ok, cmp = pcall(require, 'cmp')
      if not cmp_status_ok then
	return
      end

      local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
      if not luasnip_status_ok then
	return
      end

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
	-- Load snippet support
	snippet = {
	  expand = function(args)
	    luasnip.lsp_expand(args.body)
	  end
	  },

	-- Completion settings
	completion = {
	  --completeopt = 'menu,menuone,noselect'
	  keyword_length = 2
	},

	-- Key mapping
	mapping = {
	  ['<C-n>'] = cmp.mapping.select_next_item(),
	  ['<C-p>'] = cmp.mapping.select_prev_item(),
	  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ["<C-e>"] = cmp.mapping({
	  i = cmp.mapping.abort(),
	  c = cmp.mapping.close(),
	  }),
	  ["<C-y>"] = cmp.config.disable,
	  ['<CR>'] = cmp.mapping.confirm {
	    select = false,
	  },
	  -- Tab mapping
	  ['<Tab>'] = function(fallback)
	    if cmp.visible() then
	      cmp.select_next_item()
	    elseif luasnip.expand_or_jumpable() then
	      luasnip.expand_or_jump()
	    else
	      fallback()
	    end
	  end,
	  ['<S-Tab>'] = function(fallback)
	    if cmp.visible() then
	      cmp.select_prev_item()
	    elseif luasnip.jumpable(-1) then
	      luasnip.jump(-1)
	    else
	      fallback()
	    end
	  end,
	},
	sources = {
	  { name = 'nvim-lsp', keyword_length = 1 },
	  { name = 'luasnip', keyword_length=2 },
	  { name = 'path' },
	  { name = 'nvim_lsp_signature_help' },
	  { name = 'buffer', keyword_length = 3 },
	-- { name = 'zsh' },
	},
	formatting = {
	  fields = {'menu', 'abbr', 'kind'},
	  format = function(entry, item)
	    local menu_icon = {
	      nvim_lsp = 'λ',
	      luasnip = '⋗',
	      buffer = 'Ω',
	      path = '',
	    }
	  item.menu = menu_icon[entry.source.name]
	  return item
	end,
      },
	sorting = {
	  comparators = {
		  cmp.config.compare.offset,
		  cmp.config.compare.exact,
		  cmp.config.compare.score,
		  cmp.config.compare.recently_used,
		  require("cmp-under-comparator").under,
		  cmp.config.compare.kind,
	  },
	},
  })
    end
}

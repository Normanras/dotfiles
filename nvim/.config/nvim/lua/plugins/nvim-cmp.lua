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
      'hrsh7th/cmp-calc',
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
	    require('luasnip').lsp_expand(args.body)
	  end
	  },

	-- Completion settings
	completion = {
	  --completeopt = 'menu,menuone,noselect'
	  keyword_length = 1
	},
	window = {
	  completion = {
	    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
	    col_offset = -3,
	    side_padding = 0,
	    border = 'rounded',
	    scrollbar = '+',
	  },
	  documentation = {
	    border = 'rounded',
	    scrollbar = '|',
	  }
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
	  { name = 'nvim_lsp', },
	  { name = 'luasnip', },
	  { name = 'path' },
	  { name = 'calc' },
	  { name = 'nvim_lsp_signature_help' },
	  { name = 'buffer' },
	},
	formatting = {
	  fields = {'menu', 'abbr', 'kind'},
	  format = function(entry, item)
	    local menu_icon = {
	      nvim_lsp = 'λ',
	      luasnip = '⋗',
	      buffer = 'Ω',
	      path = '',
	      calc = '󰃬',
	      nvim_lsp_signature_help = '󰷼',
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
        -- Set up lspconfig.
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require'lspconfig'.pylsp.setup {
	  capabilities = capabilities
	}
    end
}

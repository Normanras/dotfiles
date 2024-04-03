return {
    'jakewvincent/mkdnflow.nvim',
    config = function()
        require('mkdnflow').setup({
          mappings = {
            MkdnToggleToDo = {{'i', 'n'}, '<C-Space>'},
			MkdnEnter = {{'i', 'n', 'v'}, '<CR>'},
			MkdnExtendList = {{'n'}, '<leader>;'},
			MkdnNewListItemBelowInsert = {{'n', 'i'}, '<leader>l'},
            MkdnTableNextCell = false,
            MkdnTab = {{'i',}, '<Tab>'},
            MkdnSTab = {{'i'}, '<S-Tab>'},
            MkdnFollowLink = {{'n'}, '<leader>p'}
          },
	  links = {
	    name_is_source = true,
	    conceal = true,
	  },
        })
    end,
  }

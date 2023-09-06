return {
    'jakewvincent/mkdnflow.nvim',
    config = function()
        require('mkdnflow').setup({
          mappings = {
            MkdnToggleToDo = {{'i', 'n'}, '<C-Space>'},
            MkdnNewListItem = {{'i'}, '<CR>'},
            MkdnEnter = {{'n'}, '<CR>'},
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

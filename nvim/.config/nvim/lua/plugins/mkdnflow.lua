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
	  new_file_template = {
	      use_template = true,
	      template = [[
# {{ title }}
  * Date: {{ date }}
  * Customer: {{ customer }}

## Meeting Notes:]],
		placeholders = {
		  before = {
		      date = function()
			  return os.date("%A, %B %d, %Y") -- Wednesday, March 1, 2023
		      end
		  },
		  after = {
		      customer = function()
			return vim.fn.expand('%:p:h:t')
		      end
		  }
	      }
	      },
        })
    end,
  }

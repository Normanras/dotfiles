--local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
--if not status_ok then
--  return
--end

return {
    'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function ()
	  local configs = require("nvim-treesitter.configs")
		configs.setup({
	  -- require('nvim-treesitter.install').update({ with_sync = true })
      -- A list of parser names, or "all"
	  ensure_installed = {
		'bash', 'css', 'json', 'lua', 'python',
		'vim', 'yaml',
	  },
	  sync_install = true,
	  highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	  },
	  indent = { enable = true },
	})
    end
  }

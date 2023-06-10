--local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
--if not status_ok then
--  return
--end

return {
    -- Treesitter interface
    'nvim-treesitter/nvim-treesitter',
  --build = ":TSUpdate"
      config = function ()
	require('nvim-treesitter.install').update({ with_sync = true })
      -- A list of parser names, or "all"
	ensure_installed = {
	  'bash', 'css', 'html', 'javascript', 'json', 'lua', 'python',
	  'vim', 'yaml', 'typescript', 'markdown',
	}
	sync_install = true
	highlight = {
	  -- `false` will disable the whole extension
	  enable = true,
	  additional_vim_regex_highlighting = true,
	}
    end
  }

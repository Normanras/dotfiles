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
		'bash', 'css', 'html', 'javascript', 'json', 'lua', 'python',
		'vim', 'yaml', 'typescript', 'markdown',
	  },
	  sync_install = true,
	  highlight = {
		enable = true,
		disable = function(lang, bufnr)
		  return lang == api.nvim_buf_line_count(bufnr) > 5000
		end,
		additional_vim_regex_highlighting = true,
	  },
	  indent = { enable = true },
	})
    end
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,  disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,
  }

-----------------------------------------------------------
-- Keymaps of Neovim and installed plugins
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('n', '<leader>a', ':w|:luafile %<CR>', default_opts)
map('n', '<leader>aa', ':w|:luafile %<CR> |:Lazy<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)
-- Python Script that saves the file & moves Todos to my Todolist.
map('n', '<leader>sd', ':w|:! python3 ~/Documents/Northpass/Scripts/TodoMD/todo.py %<CR>', default_opts)

-- Neovim Tab Navgation via Vem-Tabline
map('n', '<leader>t', ':tabnew<CR>', default_opts)
map('n', '<leader>e', ':bnext<CR>', default_opts)
map('n', '<leader>w', ':bprev<CR>', default_opts)
map('n', '<leader>d', ':bdelete<CR>', default_opts)
map('n', '<leader>r', '<Plug>vem_move_buffer_right', default_opts)
map('n', '<leader>q', '<Plug>vem_move_buffer_left', default_opts)

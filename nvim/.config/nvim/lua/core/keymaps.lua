-----------------------------------------------------------
-- Keymaps of Neovim and installed plugins
-----------------------------------------------------------

-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Fast saving with <leader> and s
-- map('n', '<leader>s', ':w<CR>', default_opts)
-- map('n', '<leader>a', ':w|:luafile %<CR>', default_opts)
-- map('n', '<leader>aa', ':w|:luafile %<CR> |:Lazy<CR>', default_opts)
-- map('i', '<leader>s', '<C-c>:w<CR>', default_opts)
-- Python Script that saves the file & moves Todos to my Todolist.
-- map('n', '<leader>sd', ':w|:! python3 ~/Documents/Northpass/Scripts/TodoMD/todo.py %<CR>', default_opts)

-- Close and save all buffers and return to Dashboard
map('n', '<leader>ds', ':silent wa | %bd | Alpha', default_opts)

-- Save and close current buffer
map('n', '<leader>bd', ':w | bp | sp | bn | bd | Alpha', default_opts)

-- Neovim Tab Navgation via Vem-Tabline
map('n', '<leader>t', ':tabnew<CR>', default_opts)
map('n', '<leader>e', ':bnext<CR>', default_opts)
map('n', '<leader>w', ':bprev<CR>', default_opts)
map('n', '<leader>d', ':bdelete<CR>', default_opts)

-- Nvim-Tree
map('n', '<leader>v', ':NvimTreeToggle<CR>', default_opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', default_opts)
map('n', '<leader>fh', ':Telescope live_grep<CR>', default_opts)
map('n', '<leader>fg', ':Telescope live_grep_args<CR>', default_opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', default_opts)
map('n', '<leader>fe', ':Telescope file_browser<CR>', default_opts)
map('n', '<leader>fk', ':Telescope keymaps<CR>', default_opts)
map('n', '<leader>fa', ':Telescope adjacent<CR>', default_opts)
map('n', '<leader>cb', ':Telescope current_buffer_fuzzy_find<CR>', default_opts)

-- Formatting
map('n', '<leader>b', ':! black %<CR>', default_opts)
map('n', '<leader>m', ':! markdownlint -f %<CR>', default_opts)
map('n', '<leader>pj', ':!python -m json.tool<CR>', default_opts)

-- Forget what this one does below, but I think it's for CSV reformatting.
map('n', '<leader>cs', ':%s/\\s*\\([^|]\\{-}\\)\\s*|/"\1",/g', default_opts)

-- Fold all comments
map('n', '<leader>fc', ':set foldmethod=expr foldexpr=getline(v:lnum)=~"^\\s*".&commentstring[0]<CR>', default_opts)

-- Terminal
map('n', '<C-t>', ':ToggleTerm direction=float<CR>', default_opts)
map('t', '<C-n>', '<C-\\><C-n><CR>', default_opts) -- Exit Insert Mode Faster

-- Cycle through the number line options
map('n', '<leader>n', ":set relativenumber!<CR>", default_opts)

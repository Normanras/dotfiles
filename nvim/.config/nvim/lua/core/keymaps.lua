-----------------------------------------------------------
-- Keymaps of Neovim and installed plugins
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
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

-- Neovim Tab Navgation via Vem-Tabline
map('n', '<leader>t', ':tabnew<CR>', default_opts)
map('n', '<leader>e', ':bnext<CR>', default_opts)
map('n', '<leader>w', ':bprev<CR>', default_opts)
map('n', '<leader>d', ':bdelete<CR>', default_opts)
map('n', '<leader>r', '<Plug>vem_move_buffer_right', default_opts)
map('n', '<leader>q', '<Plug>vem_move_buffer_left', default_opts)

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
map('n', '<leader>cs', ':%s/\\s*\\([^|]\\{-}\\)\\s*|/"\1",/g', default_opts)

-- Fold all comments
map('n', '<leader>fc', ':set foldmethod=expr foldexpr=getline(v:lnum)=~"^\\s*".&commentstring[0]<CR>', default_opts)

-- Terminal
map('n', '<C-t>', ':ToggleTerm direction=float<CR>', default_opts)
map('t', '<C-n>', '<C-\\><C-n><CR>', default_opts) -- Exit Insert Mode Faster

------------------------------------------------
-- Old Keymaps from Nvim-Mapper (Sunsetted)
------------------------------------------------
--[[
-- Macros for Todo Trouble
M('n', '<C-t>', "@t<CR>", default_opts,
"Add Todo", "todo_todo", "Add To-do/Task to the beginning of the line"
)

M('n', '<C-s>', "@s<CR>", default_opts,
"Add Solutions Engineering", "todo_seng", "Add Solutions Engineering to the beginning of the line"
)

M('n', '<C-f>', "@f<CR>", default_opts,
"Add Feature", "add_feat", "Add Feature Request tag to the beginning of the line. "
)

M( 'n', '<C-x>', "@c<CR>", default_opts,
"Replace with Complete", "add_complete", "Replace tag with Complete tag at beginning of the line."
)

M('n', '<C-r>', "@w<CR>", default_opts,
"Add Warning/Error", "add_error", "Add Warning/Error tag at the beginning of the line."
)

M('n', '<leader>ce', ":TodoTrouble keywords=TODO<CR>", default_opts,
"Show Todo Tags", "show_todos", "Show Todo Tags."
)

M('n', '<leader>cf', ":TodoTrouble keywords=FEAT<CR>", default_opts,
"Show Feature Tags", "show_features", "Show Feature Requests."
)

M('n', '<leader>cq', ":TodoTrouble keywords=ERROR, WARN<CR>", default_opts,
"Show Warning Tags", "show_warnings", "Show Errors Tags."
)

--]]

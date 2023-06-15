-----------------------------------------------------------

-- Keymaps of Neovim and installed plugins
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('n', '<leader>a', ':w|:luafile %<CR>', default_opts)
map('n', '<leader>aa', ':w|:luafile %<CR> |:PackerSync<CR>', default_opts)
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

-----------------------------------------------------------

-- Applications and Plugins shortcuts
-----------------------------------------------------------

-----------------------------------------------------------

-- Telescope Keymaps
-----------------------------------------------------------

-- For Neovim >= 0.7.0
Mapper = require("nvim-mapper")
local M = Mapper.map
local default_opts = {noremap=true, silent=true}

-- Sidebar
M('n', '<leader>n', ':SidebarNvimToggle<CR>', default_opts,
  "Sidebar Toggle", "sidebar-toggle", "Open or Close Sidebar"
)
M('n', '<leader>q', ':SidebarNvimUpdate<CR>', default_opts,
  "Sidebar Update", "sidebar-update", "Refresh the Sidebar"
)

--[[ Sidebar Resize
M('n', '<leader>=', ':SidebarNvimResize +1<CR>', default_opts,
  "Sidebar +1", "sidebar-plus1", "Sidebar Bigger by one"
)
M('n', '<leader>-', ':SidebarNvimResize -1<CR>', default_opts,
  "Sidebar -1", "sidebar-minus1", "Sidebar Smaller by one"
)
M('n', '<leader>==', ':SidebarNvimResize +10<CR>', default_opts,
  "Sidebar +10", "sidebar-plus10", "Sidebar Bigger by 10"
)
M('n', '<leader>--', ':SidebarNvimResize -10<CR>', default_opts,
  "Sidebar -10", "sidebar-minus10", "Sidebar Smaller by 10"
)--]]

-- Lazy Git
M('n', '<leader>lg', ":LazyGit<CR>", default_opts,
  "Lazy Git", "lazy-git", "Show Lazy Git"
)

-- Markdown Preview Toggle
M('n', '<leader>P', ":MarkdownPreview<CR>", default_opts,
  "Markdown Preview", "md_preview", "Display Markdown preview in browser"
)

-- Telescope Options
M('n', '<leader>ff', ':Telescope find_files<CR>', default_opts,
  "Find Files", "find-files", "Find Files in Telescope pop-up"
)
M('n', '<leader>fg', ':Telescope live_grep<CR>', default_opts,
  "Live Grep", "live-grep", "Grep Files in Telescope pop-up"
)
M('n', '<leader>fb', ':Telescope buffers<CR>', default_opts,
  "Buffers", "buffers", "See Buffers in Telescope pop-up"
)
M('n', '<leader>fe', ":Telescope file_browser<CR>", default_opts,
  "Telescope Files", "telescope-file-browser", "Find files and directories in telescope"
)

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

M('n', '<leader>ce', ":TodoTrouble keywords=TODO<CR> | :resize +10<CR>", default_opts,
  "Show Todo Tags", "show_todos", "Show Todo Tags."
  )

M('n', '<leader>cf', ":TodoTrouble keywords=FEAT<CR>", default_opts,
  "Show Feature Tags", "show_features", "Show Feature Requests."
  )

M('n', '<leader>cq', ":TodoTrouble keywords=ERROR, WARN<CR>", default_opts,
  "Show Warning Tags", "show_warnings", "Show Errors Tags."
  )

M('n', '<leader>b', ":! black %<CR>", default_opts,
  "Black Formatting", "black_current_file", "Use Black Formatting on Current File."
)
M('n', '<leader>m', ":! markdownlint -f %<CR>", default_opts,
  "Markdownlint", "md_lint_format", "Use mdlint Formatting on Current File."
)
M('n', '<leader>r30', ":resize 30<CR>", default_opts,
  "Resize30", "resize_30", "Resize Window to #30"
)

-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local fn = vim.fn       	-- Call Vim functions
local cmd = vim.cmd     	-- Execute Vim commands
local exec = vim.api.nvim_exec 	-- Execute Vimscript
local g = vim.g          	-- Global variables
local opt = vim.opt         	-- Set options (global/buffer/windows-scoped)
local o = vim.o

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','               -- Change leader to a comma
opt.mouse = 'a'                 -- Enable mouse support
opt.clipboard = 'unnamedplus'   -- Copy/paste to system clipboard
opt.swapfile = false            -- Don't use swapfile
opt.shadafile  = "NONE"
opt.shadafile = ""
opt.shell = "/bin/zsh"
opt.updatetime = 200
opt.cursorline = true
g.markdown_folding = 1
opt.spell=true
opt.spelllang = 'en_us'
cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]
--vim.api.nvim_set_hl(0, "ColorColumn", {guibg=lightmagenta})
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true               -- Show line number
opt.relativenumber = true       -- Show Current Line with Relative numbers above and below cursor.
opt.showmatch = true            -- Highlight matching parenthesis
opt.foldmethod = "syntax"       -- Enable folding (default 'foldmarker')
opt.cc = '+1,+2,+3'		-- Line length marker at 80 columns
--opt.tw = 80
opt.splitright = true           -- Vertical split to the right
opt.splitbelow = true           -- Horizontal split to the bottom
opt.ignorecase = true           -- Ignore case letters when search
opt.smartcase = true            -- Ignore lowercase for the whole pattern
opt.linebreak = true            -- Wrap on word boundary
opt.signcolumn = 'yes:1'          -- Signs column always on, minimum 2.
opt.wrap = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true               -- Enable background buffers
opt.history = 100               -- Remember N lines in historma:y
opt.lazyredraw = true           -- Faster scrolling
opt.synmaxcol = 240             -- Max column for syntax highlight
-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true      -- Enable 24-bit RGB colors
cmd[[colorscheme dracula]]
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true            -- Use spaces instead of tabs
opt.shiftwidth = 4              -- Shift 4 spaces when tab
opt.tabstop = 4                 -- 1 tab == 4 spaces
opt.smartindent = true          -- Autoindent new lines
-----------------------------------------------------------
-- Glow Settings
-----------------------------------------------------------
g.glow_binary_path = '/bin'
g.glow_border = 'rounded'
g.glow_width = 120
g.glow_use_pager = true
g.glow_style = 'dark'
-----------------------------------------------------------
-- MKDX Settings, mkdx#settings.
-----------------------------------------------------------
-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType md,liquid,xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=8 noexpandtab
]]


local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

--[[
Deletes all trailing whitespaces in a file if it's not binary nor a diff.
]]--
function _G.trim_trailing_whitespaces()
    if not o.binary and o.filetype ~= 'diff' then
        local current_view = fn.winsaveview()
        cmd([[keeppatterns %s/\s\+$//e]])
        fn.winrestview(current_view)
    end
end

--  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
vim.cmd[[
	highlight! link CmpItemMenu Comment
	" gray
	highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
	" blue
	highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
	highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
	" light blue
	highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
	highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
	highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
	" pink
	highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
	highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
	" front
	highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
	highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
	highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
      ]]


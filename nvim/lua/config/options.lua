local opt = vim.opt

-- Line numbering
opt.relativenumber = true
opt.nu = true

-- Tab size
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

-- Indentation
opt.autoindent = true
opt.smartindent = true

-- Linewrap
opt.wrap = false

-- Safety + Backups
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.confirm = true

-- Search
opt.incsearch = true
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true

-- UI + Visuals
opt.termguicolors = true
vim.g.have_nerd_font = true
opt.showmode = false
opt.background = "dark"
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.hlsearch = true
opt.cursorline = true
opt.cursorlineopt = "line"

-- List Mode
opt.list = false
opt.listchars = {
	tab = '| ',
	trail = '.',
	extends = '›', -- Shows when line continues beyond screen
	precedes = '‹', -- Shows when line starts before screen
}

-- Backspace
opt.backspace = { "start", "eol", "indent" }

-- Splitting
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.updatetime = 50
opt.colorcolumn = "80"
opt.mouse = "a"
vim.g.editorconfig = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

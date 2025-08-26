local opt = vim.opt

vim.o.breakindent = true

vim.g.have_nerd_font = true
opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = 'yes'

opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.cursorline = true
opt.cursorlineopt = "line"

opt.scrolloff = 10

opt.inccommand = "split"

opt.listchars = { tab = '| ', trail = '.'}

opt.confirm = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')



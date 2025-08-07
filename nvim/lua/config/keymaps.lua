-- Set leader keys before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Terminal toggle
vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('t', '<leader>t', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })

-- Easy terminal escape
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Nvim-tree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>o', '<cmd>NvimTreeFocus<CR>', { desc = 'Focus file explorer' })

-- Quick shell commands
vim.keymap.set('n', '<leader>rr', ':TermExec cmd=', { desc = 'Run command in terminal' })

-- Python-specific shortcuts
vim.keymap.set('n', '<leader>rp', function()
  local file = vim.fn.expand('%:p')
  vim.cmd('TermExec cmd="uv run ' .. file .. '"')
end, { desc = 'Run current Python file' })


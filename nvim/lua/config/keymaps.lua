local opts = {noremap = true, silent = True}

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set("n", "J", "mzJ'z", {desc = "Join with the line below"})

-- Center cursor while navigating selections
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart_highlight_yank", {clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
}
)

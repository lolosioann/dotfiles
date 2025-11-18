return {
	"stevearc/oil.nvim",
	dependencies = {"nvim-tree/nvim-web-devicons"},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			keymaps = {
				["q"] = "actions.close",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
		})

		-- vim.keymap.set("n", "`", "<CMD>Oil<CR>", {desc = "Open parent directory in Oil"})
		vim.keymap.set("n", "<leader>e", require("oil").toggle_float, {desc = "Toggle float Oil"})	

		vim.api.nvim_create_autocmd("Filetype", {
			pattern = "oil",
			callback = function()
				vim.opt_local_cursorline = true
			end,
		})

	end
}

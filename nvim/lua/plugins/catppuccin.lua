return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			term_colors = true,
			transparent_background = true,
			float = {
				transparent = true
			},
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15
			},
			styles = {
				comments = { "italic" },
			},
			default_integrations = true,
			auto_integrations = true,
		})
		vim.cmd("colorscheme catppuccin")
	end,
}

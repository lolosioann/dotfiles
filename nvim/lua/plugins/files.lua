return {
	"echasnovski/mini.files",
	version = false,
	opts = {},
	keys = {
		{
			"<leader>e",
			function()
				require("mini.files").open()
			end,
			desc = "Open mini.files",
		},
	},
}

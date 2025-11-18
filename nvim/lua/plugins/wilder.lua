return {
	"gelguy/wilder.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"romgrk/fzy-lua-native"
	},

	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = {":", "/", "?"} })

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				highlighter = {
					wilder.lua_fzy_highlighter(),
				},
				border = "rounded"
			}))
		)

	end
}

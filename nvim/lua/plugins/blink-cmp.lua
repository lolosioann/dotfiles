return {
	"saghen/blink.cmp",
	dependencies = { "L3MON4D3/LuaSnip" },
	version = "1.*",
	---@module 'blink.cmp'
	---@diagnostic disable-next-line: undefined-doc-name
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default", ["<C-enter>"] = { "accept" } },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			keyword = { range = "full" },
			documentation = { auto_show = false },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		snippets = {
			preset = "luasnip",
		},
	},
	opts_extend = { "sources.default" },
}

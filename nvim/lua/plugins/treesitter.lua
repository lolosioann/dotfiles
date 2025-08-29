return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"lua",
				"python",
				"markdown",
				"bash",
				"json",
				"yaml",
				"toml",
			},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },

			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj
					keymaps = {
						-- Python/Bash function objects
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",

						-- Conditional objects
						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",

						-- Loop objects
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",

						-- Parameter objects
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})
	end,
}

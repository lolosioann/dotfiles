return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		indent = {},
		notifier = {},
	},
	keys = {
		-- Non-LSP keymaps (always available)
		{ "<leader>es", function() require("snacks").explorer() end,     desc = "Open Snacks Explorer" },
		{ "<leader>bd", function() require("snacks").bufdelete() end,    desc = "Close current buffer" },
		{ "<leader>ff", function() require("snacks").picker.files() end, desc = "Find files" },
		{ "<leader>fg", function() require("snacks").picker.grep() end,  desc = "Grep" },
	},
	init = function()
		-- LSP keymaps set on attach
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local snacks = require("snacks")

				vim.keymap.set("n", "grd", function() snacks.picker.lsp_definitions() end,
					{ buffer = bufnr, desc = "Goto Definition" })
				vim.keymap.set("n", "grD", function() snacks.picker.lsp_declarations() end,
					{ buffer = bufnr, desc = "Goto Declaration" })
				vim.keymap.set("n", "grr", function() snacks.picker.lsp_references() end,
					{ buffer = bufnr, nowait = true, desc = "References" })
				vim.keymap.set("n", "grI", function() snacks.picker.lsp_implementations() end,
					{ buffer = bufnr, desc = "Goto Implementation" })
				vim.keymap.set("n", "grt", function() snacks.picker.lsp_type_definitions() end,
					{ buffer = bufnr, desc = "Goto Type Definition" })

				vim.keymap.set("n", "<leader>ss", function() snacks.picker.lsp_symbols() end,
					{ buffer = bufnr, desc = "LSP Symbols" })
				vim.keymap.set("n", "<leader>sS", function() snacks.picker.lsp_workspace_symbols() end,
					{ buffer = bufnr, desc = "LSP Workspace Symbols" })
				vim.keymap.set("n", "<leader>d", function() snacks.picker.diagnostics() end,
					{ buffer = bufnr, desc = "Diagnostics" })

				vim.keymap.set("n", "<leader>qf", function() snacks.picker.qflist() end,
					{ buffer = bufnr, desc = "Quickfix List" })
			end,
		})
	end,
}

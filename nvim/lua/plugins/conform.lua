return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	---@module "conform"
	---@diagnostic disable-next-line: undefined-doc-name
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
			markdown = { "prettier" },
			typst = { "prettypst" },
			bash = { "beautysh" },
			zsh = { "beautysh" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			{ desc = "Format current file" },
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

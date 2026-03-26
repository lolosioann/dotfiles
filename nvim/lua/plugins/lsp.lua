return {
	-- Completion plugin
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts_extend = { "sources.default" },
		opts = {
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			keymap = { preset = "default" },
		},
	},
	-- Mason for managing LSP servers
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	-- Mason-LSPConfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Python
					"ruff",
					"ty",
					-- Lua
					"lua_ls",
					-- Markdown
					"marksman",
					-- bash
					"bashls",
					-- json
					"jsonls",
					-- yaml
					"yamlls",
					-- Go
					"gopls",
					-- Rust
					"rust_analyzer",
					-- C/C++
					"clangd",
					-- Typst
					"tinymist",
					-- "prettypst",
					-- MATLAB
					"matlab_ls",
				},
			})
		end,
	},
	-- LSP Configuration
	-- In lsp.lua
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Only diagnostic configuration, NO keymaps
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "always" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},
				virtual_text = {
					source = "always",
					spacing = 2,
					prefix = "●",
				},
			})

			-- Enable LSP servers
			vim.lsp.config("*", {
				root_markers = { ".git" },
			})
			-- Python
			vim.lsp.enable("ruff")
			vim.lsp.enable("ty")
			-- Lua
			vim.lsp.enable("lua_ls")
			-- Markdown
			vim.lsp.enable("marksman")
			-- bash
			vim.lsp.enable("bashls")
			-- json
			vim.lsp.enable("jsonls")
			-- yaml
			vim.lsp.enable("yamlls")
			-- Go
			vim.lsp.enable("gopls")
			-- Rust
			vim.lsp.enable("rust_analyzer")
			-- C/C++
			vim.lsp.enable("clangd")
			-- Typst
			vim.lsp.enable("tinymist")
			-- MATLAB
			vim.lsp.config("matlab_ls", {
				settings = {
					matlab = {
						installPath = "/home/lolosioann/matlab",
					},
				},
			})
			vim.lsp.enable("matlab_ls")
		end,
	},
}

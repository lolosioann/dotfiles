return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "HiPhish/nvim-ts-rainbow2",           -- optional rainbow parentheses
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "json", "yaml", "markdown", "markdown_inline", "bash", "lua", "vim",
          "gitignore", "python", "dockerfile", "c", "rust"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autotag = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            node_decremental = "<bs>",
            scope_incremental = false,
          },
        },
        rainbow = {
          enable = true,
          disable = { "html" },
          extended_mode = false,
          max_file_lines = nil,
        },
      })
    end,
  }
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opt = {
      transparent = true,
    },
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        term_colors = true,
      })
      vim.cmd("colorscheme catppuccin")
    end,
  }
}

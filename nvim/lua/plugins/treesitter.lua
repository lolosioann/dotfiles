return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",  -- Smart text objects
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Languages to install
        ensure_installed = {
          "python",
          "bash", 
          "lua",
          "vim",
          "vimdoc",
          "json",
          "yaml",
          "toml",
          "markdown",
          "git_config",
          "git_rebase",
          "gitcommit",
          "gitignore",
        },
        
        -- Auto-install missing parsers
        auto_install = true,
        
        -- Syntax highlighting
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        
        -- Indentation based on treesitter
        indent = {
          enable = true,
        },
        
        -- Enhanced text objects
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
          
          move = {
            enable = true,
            set_jumps = true, -- Add to jumplist
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer", 
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },
        },
        
        -- Code folding
        fold = {
          enable = true,
        },
      })
      
      -- Enable treesitter-based folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false -- Start with folds open
      
      -- Catppuccin integration for treesitter
      vim.cmd([[
        " Enhanced Python highlighting
        highlight @variable.python guifg=#cdd6f4
        highlight @function.python guifg=#89b4fa
        highlight @function.call.python guifg=#89b4fa
        highlight @method.python guifg=#89b4fa
        highlight @class.python guifg=#f9e2af
        highlight @string.python guifg=#a6e3a1
        highlight @keyword.python guifg=#cba6f7
        highlight @conditional.python guifg=#cba6f7
        highlight @repeat.python guifg=#cba6f7
        highlight @operator.python guifg=#89dceb
        
        " Enhanced Bash highlighting  
        highlight @variable.bash guifg=#cdd6f4
        highlight @function.bash guifg=#89b4fa
        highlight @string.bash guifg=#a6e3a1
        highlight @keyword.bash guifg=#cba6f7
        highlight @operator.bash guifg=#89dceb
      ]])
    end,
  },
}

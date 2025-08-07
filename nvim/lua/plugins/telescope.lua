return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",  -- Better fuzzy finding performance
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      telescope.setup({
        defaults = {
          -- Appearance
          prompt_prefix = " ",
          selection_caret = " ",
          entry_prefix = "  ",
          
          -- Behavior
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          
          -- File filtering
          file_ignore_patterns = {
            "node_modules/",
            ".git/",
            ".venv/",
            "venv/",
            "__pycache__/",
            "*.pyc",
            ".pytest_cache/",
            ".coverage",
            "*.egg-info/",
          },
          
          -- Key mappings within telescope
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
            },
            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,  
              ["<C-t>"] = actions.select_tab,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
            },
          },
        },
        
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
          },
          live_grep = {
            only_sort_text = true,
          },
          grep_string = {
            only_sort_text = true,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
            initial_mode = "normal",
          },
          colorscheme = {
            enable_preview = true,
          },
        },
        
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      
      -- Load extensions
      telescope.load_extension("fzf")
      
      -- Catppuccin theme integration
      vim.cmd([[
        " Telescope colors
        highlight TelescopeNormal guibg=#1e1e2e
        highlight TelescopeBorder guifg=#585b70
        highlight TelescopePromptNormal guibg=#313244
        highlight TelescopePromptBorder guifg=#585b70
        highlight TelescopePromptTitle guifg=#89b4fa
        highlight TelescopePreviewTitle guifg=#a6e3a1
        highlight TelescopeResultsTitle guifg=#cba6f7
        highlight TelescopeSelection guibg=#585b70 guifg=#cdd6f4
        highlight TelescopeSelectionCaret guifg=#f38ba8
      ]])
      
      -- Key mappings
      local builtin = require("telescope.builtin")
      
      -- File operations
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fa", function()
        builtin.find_files({ hidden = true })
      end, { desc = "Find all files (including hidden)" })
      
      -- Search operations  
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word under cursor" })
      vim.keymap.set("v", "<leader>fw", builtin.grep_string, { desc = "Find selected text" })
      
      -- Buffer operations
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })
      
      -- LSP integration
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find references" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols" })
      vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
      
      -- Git operations (for future use)
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
      vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
      vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
      
      -- Misc
      vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Find themes" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
    end,
  },
}

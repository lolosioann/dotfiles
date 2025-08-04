return {
    -- Formatting with conform.nvim
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      cmd = { "ConformInfo" },
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            python = { "ruff_format", "ruff_organize_imports" },
          },

          -- Custom formatters for ruff
          formatters = {
            ruff_format = {
              command = "ruff",
              args = { "format", "--stdin-filename", "$FILENAME", "-" },
              stdin = true,
              cwd = require("conform.util").root_file({
                "pyproject.toml",
                "ruff.toml",
                ".ruff.toml",
              }),
            },
            ruff_organize_imports = {
              command = "ruff",
              args = { "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
              stdin = true,
              cwd = require("conform.util").root_file({
                "pyproject.toml",
                "ruff.toml",
                ".ruff.toml",
              }),
            },
          },

          -- Format on save
          format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
          },
        })

        -- Manual format command
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
          require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format buffer" })
      end,
    },

    -- Linting with nvim-lint
    {
      "mfussenegger/nvim-lint",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        local lint = require("lint")

        -- Configure ruff linter
        lint.linters_by_ft = {
          python = { "ruff" },
        }

        -- Custom ruff linter configuration
        lint.linters.ruff = {
          cmd = "ruff",
          stdin = true,
          args = {
            "check",
            "--output-format=json",
            "--stdin-filename",
            function() return vim.fn.expand("%:p") end,
            "-"
          },
          ignore_exitcode = true,
          parser = function(output, bufnr)
            if output == "" then
              return {}
            end

            local decoded = vim.json.decode(output)
            local diagnostics = {}

            for _, item in ipairs(decoded) do
              table.insert(diagnostics, {
                bufnr = bufnr,
                lnum = item.location.row - 1,
                col = item.location.column - 1,
                end_lnum = item.end_location.row - 1,
                end_col = item.end_location.column - 1,
                severity = vim.diagnostic.severity.WARN,
                message = item.message,
                source = "ruff",
                code = item.code,
              })
            end

            return diagnostics
          end,
        }

        -- Auto-lint on these events
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
          group = lint_augroup,
          callback = function()
            lint.try_lint()
          end,
        })

        -- Manual lint command
        vim.keymap.set("n", "<leader>l", function()
          lint.try_lint()
        end, { desc = "Trigger linting" })
      end,
    },

    -- UV virtual environment detection
    -- {
    --   "linux-cultist/venv-selector.nvim",
    --   dependencies = {
    --     "neovim/nvim-lspconfig",
    --     "nvim-telescope/telescope.nvim",
    --     "mfussenegger/nvim-dap-python"
    --   },
    --   opts = {
    --     settings = {
    --       options = {
    --         notify_user_on_venv_activation = false,
    --         stay_on_this_version = true,
    --       },
    --       search = {
    --         uv = {
    --           command = "fd python$ ~/.local/share/uv/python --full-path --color never",
    --           type = "anaconda"
    --         },
    --         uv_venvs = {
    --           command = "find $PWD/.venv $PWD/venv $PWD/env -name python",
    --           type = "anaconda"
    --         }
    --       }
    --     }
    --   },
    --   event = "VeryLazy",
    --   keys = {
    --     { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python virtual environment" },
    --     { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select cached virtual environment" },
    --   },
    -- },
  }

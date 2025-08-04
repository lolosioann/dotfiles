return {
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        })
      end,
    },


    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",
      },
      config = function()
        local lspconfig = require("lspconfig")

        -- Configure diagnostic appearance
        vim.diagnostic.config({
          virtual_text = {
            spacing = 2,
            source = false,
            prefix = "●",
          },
          underline = true,
          update_in_insert = true,
          severity_sort = true,
          float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = false,
            header = "",
            prefix = "",
          },
        })

        -- Catppuccin Mocha colors with thick underlines
        vim.cmd([[
          " Thick underlines for diagnostics
          highlight DiagnosticUnderlineError gui=underline,bold guisp=#f38ba8 cterm=underline,bold
          highlight DiagnosticUnderlineWarn gui=underline,bold guisp=#f9e2af cterm=underline,bold
          highlight DiagnosticUnderlineInfo gui=underline,bold guisp=#89b4fa cterm=underline,bold
          highlight DiagnosticUnderlineHint gui=underline,bold guisp=#a6e3a1 cterm=underline,bold

          " Gutter signs colors
          highlight DiagnosticSignError guifg=#f38ba8
          highlight DiagnosticSignWarn guifg=#f9e2af
          highlight DiagnosticSignInfo guifg=#89b4fa
          highlight DiagnosticSignHint guifg=#a6e3a1

          " Virtual text colors
          highlight DiagnosticVirtualTextError guifg=#f38ba8 gui=italic
          highlight DiagnosticVirtualTextWarn guifg=#f9e2af gui=italic
          highlight DiagnosticVirtualTextInfo guifg=#89b4fa gui=italic
          highlight DiagnosticVirtualTextHint guifg=#a6e3a1 gui=italic
        ]])

        -- Pyright configuration
        -- Replace your existing pyright setup with this enhanced version

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Function to find Python executable (prioritizes uv venvs)
local function get_python_path()
  -- Check for uv venv in current directory
  local uv_venv_paths = {
    vim.fn.getcwd() .. "/.venv/bin/python",
    vim.fn.getcwd() .. "/venv/bin/python",
    vim.fn.getcwd() .. "/env/bin/python",
  }

  for _, path in ipairs(uv_venv_paths) do
    if vim.fn.executable(path) == 1 then
      return path
    end
  end

  -- Fallback to system python
  return vim.fn.exepath("python3") or vim.fn.exepath("python")
end

lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = get_python_path(),
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
      }
    }
  },
  on_init = function(client)
    -- Update python path when LSP starts
    local python_path = get_python_path()
    client.config.settings.python.pythonPath = python_path
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
})

end,
},
}

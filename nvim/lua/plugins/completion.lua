
return {
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = {
      "rafamadriz/friendly-snippets",  -- Pre-made snippets collection
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()  -- Load friendly-snippets
    end,
  },

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- LSP completion source
      "hrsh7th/cmp-path",        -- Path completion source
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
      "L3MON4D3/LuaSnip",        -- Snippet engine
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        -- Enable snippet support
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- Completion window appearance
        window = {
          completion = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          },
          documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpDoc",
          },
        },

        -- Completion menu formatting
        formatting = {
          format = function(entry, vim_item)
            -- Simple icons
            local kind_icons = {
              Text = "󰉿",
              Method = "󰆧",
              Function = "󰊕",
              Constructor = "",
              Field = "󰜢",
              Variable = "󰀫",
              Class = "󰠱",
              Interface = "",
              Module = "",
              Property = "󰜢",
              Unit = "󰑭",
              Value = "󰎠",
              Enum = "",
              Keyword = "󰌋",
              Snippet = "",
              Color = "󰏘",
              File = "󰈙",
              Reference = "󰈇",
              Folder = "󰉋",
            }

            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or "", vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              path = "[Path]",
            })[entry.source.name]

            return vim_item
          end,
        },

        -- Key mappings with snippet navigation
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          -- Tab/Shift-Tab for navigation with snippet support
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),

        -- Completion sources (expanded)
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },   -- Your pyright completions
          { name = 'luasnip' },    -- Snippets
          { name = 'path' },       -- File paths
        }),
      })

      -- Catppuccin Mocha themed highlights
      vim.cmd([[
        " Completion menu colors
        highlight CmpPmenu guibg=#1e1e2e guifg=#cdd6f4
        highlight CmpSel guibg=#585b70 guifg=#cdd6f4
        highlight CmpDoc guibg=#1e1e2e guifg=#cdd6f4

        " Completion item kind highlights
        highlight CmpItemKindFunction guifg=#89b4fa
        highlight CmpItemKindMethod guifg=#89b4fa
        highlight CmpItemKindVariable guifg=#f38ba8
        highlight CmpItemKindClass guifg=#f9e2af
        highlight CmpItemKindModule guifg=#a6e3a1
        highlight CmpItemKindKeyword guifg=#cba6f7
        highlight CmpItemKindSnippet guifg=#f5c2e7
        highlight CmpItemKindFile guifg=#89dceb
        highlight CmpItemKindFolder guifg=#89dceb
        highlight CmpItemKindText guifg=#cdd6f4
      ]])
    end,
  },
}

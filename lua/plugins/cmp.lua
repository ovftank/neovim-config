return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "Exafunction/windsurf.nvim",
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local keymaps = require("keymaps.cmp")

      require("luasnip.loaders.from_lua").load({ paths = "./snippets" })

      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = keymaps.get_cmp_mappings(),
        matching = {
          disallow_fuzzy_matching = false,
          disallow_partial_matching = false,
          disallow_prefix_unmatching = false,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000, max_item_count = 20, keyword_length = 2 },
          { name = "luasnip",  priority = 900 },
          { name = "codeium",  priority = 950 },
        }, {
          { name = "buffer", priority = 500 },
          { name = "path",   priority = 400 },
          { name = "calc",   priority = 300 },
        }),
        experimental = {
          ghost_text = false,
        },
        formatting = {
          format = function(entry, vim_item)
            local colorizer_ok, colorizer = pcall(require, "tailwindcss-colorizer-cmp")
            if colorizer_ok then
              return colorizer.formatter(entry, vim_item)
            end
            local lspkind_ok, lspkind = pcall(require, "lspkind")
            if lspkind_ok then
              vim_item = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                ellipsis_char = "...",
                symbol_map = {
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
                  EnumMember = "",
                  Constant = "󰏿",
                  Struct = "󰙅",
                  Event = "",
                  Operator = "󰆕",
                  TypeParameter = "",
                  Codeium = "󰚩",
                },
              })(entry, vim_item)
            else
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                codeium = "[Codeium]",
                buffer = "[Buffer]",
                path = "[Path]",
                calc = "[Calc]",
              })[entry.source.name]
            end

            vim_item.dup = 0
            return vim_item
          end,
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = keymaps.get_cmp_cmdline_mappings(),
        sources = {
          { name = "buffer" }
        }
      })

      cmp.setup.cmdline(":", {
        mapping = keymaps.get_cmp_cmdline_mappings(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      require("codeium").setup({
        enable_cmp_source = true,
        enable_chat = false,
        virtual_text = {
          enabled = false,
        },
        workspace_root = {
          use_lsp = true,
          paths = {
            ".git",
            "package.json",
            "go.mod",
            "requirements.txt",
          }
        }
      })
    end,
  },
  {
    "hrsh7th/cmp-calc",
    ft = { "lua", "javascript", "typescript", "python", "html", "css" },
  },
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init({
        mode = "symbol_text",
        preset = "codicons",
        symbol_map = {
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
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      })
    end,
  },
}

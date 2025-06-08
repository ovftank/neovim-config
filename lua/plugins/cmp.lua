return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      "zbirenbaum/copilot-cmp",
      "onsails/lspkind.nvim",
      "luckasRanarison/tailwind-tools.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local keymaps = require("keymaps.cmp")

      require("copilot_cmp").setup()
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = keymaps.get_cmp_mappings(),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000, max_item_count = 20 },
          { name = "copilot",  priority = 950 },
          { name = "luasnip",  priority = 900 },
          { name = "vsnip",    priority = 850 },
        }, {
          { name = "buffer", priority = 500 },
          { name = "path",   priority = 400 },
          { name = "calc",   priority = 300 },
        }),
        formatting = {
          format = function(entry, vim_item)
            local lspkind_ok, lspkind = pcall(require, "lspkind")
            local tailwind_ok, tailwind_cmp = pcall(require, "tailwind-tools.cmp")

            if lspkind_ok and tailwind_ok then
              vim_item = lspkind.cmp_format({
                before = tailwind_cmp.lspkind_format,
                mode = "symbol_text",
                maxwidth = 50,
                ellipsis_char = "...",
                symbol_map = {
                  Copilot = "",
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
              })(entry, vim_item)
            else
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                copilot = "[Copilot]",
                luasnip = "[LuaSnip]",
                vsnip = "[VSCode]",
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
    end,
  },
  {
    "hrsh7th/cmp-calc",
    ft = { "lua", "javascript", "typescript", "python", "html", "css" },
  },
  {
    "hrsh7th/vim-vsnip",
    dependencies = { "hrsh7th/cmp-vsnip" },
    config = function()
      vim.cmd([[
        let g:vsnip_filetypes = {}
        let g:vsnip_filetypes.html = ['html', 'javascript', 'css']
        let g:vsnip_filetypes.javascriptreact = ['javascript', 'html']
        let g:vsnip_filetypes.typescriptreact = ['typescript', 'html']
        let g:vsnip_filetypes.vue = ['javascript', 'html', 'css']
      ]])
    end,
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
          Copilot = "",
        },
      })
    end,
  },
}

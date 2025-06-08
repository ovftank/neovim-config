local function has_tailwind_config()
  local config_files = {
    "tailwind.config.js",
    "tailwind.config.ts",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.json",
  }

  for _, file in ipairs(config_files) do
    if vim.fn.filereadable(file) == 1 then
      return true
    end
  end
  return false
end

return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    ft = {
      "html",
      "css",
      "scss",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
      "astro",
      "php",
    },
    cond = function()
      return has_tailwind_config()
    end,
    config = function()
      require("tailwind-tools").setup({
        server = {
          override = false,
          settings = {
            includeLanguages = {
              typescript = "javascript",
              typescriptreact = "javascript",
            },
            classAttributes = {
              "class",
              "className",
              "ngClass",
              "ngClassName",
              "ngStyle",
            },
            emmetCompletions = true,
            experimental = {
              classRegex = {
                "\\.classList\\.add\\(\\s*\"([^\"]+?)\"\\s*\\)",
                "\\.classList\\.remove\\(\\s*\"([^\"]+?)\"\\s*\\)",
                "\\.classList\\.add\\(\\s*'([^']+?)'\\s*\\)",
                "\\.classList\\.remove\\(\\s*'([^']+?)'\\s*\\)",
                "\\.classList\\.toggle\\(\\s*\"([^\"]+?)\"\\s*\\)",
                "\\.classList\\.toggle\\(\\s*'([^']+?)'\\s*\\)",
                "\\.classList\\.replace\\(\\s*\"([^\"]+?)\"\\s*,\\s*\"([^\"]+?)\"\\s*\\)",
                "\\.classList\\.replace\\(\\s*'([^']+?)'\\s*,\\s*'([^']+?)'\\s*\\)",
                "\\.classList\\.add\\(\\s*`([^`]+?)`\\s*\\)",
                "\\.classList\\.remove\\(\\s*`([^`]+?)`\\s*\\)",
                "\\.classList\\.toggle\\(\\s*`([^`]+?)`\\s*\\)",
                "\\.classList\\.replace\\(\\s*`([^`]+?)`\\s*,\\s*`([^`]+?)`\\s*\\)",
                "class\\s*=\\s*\"([^\"]+?)\"",
                "class\\s*=\\s*'([^']+?)'",
                "class\\s*=\\s*`([^`]+?)`",
                "tw`([^`]*)",
                "tw=\"([^\"]*)",
                "tw={'([^'}]*)",
                "tw\\.\\w+`([^`]*)",
                "tw\\(.*?\\)`([^`]*)",
                { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "classnames\\(([^)]*)\\)", "'([^']*)'" },
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              },
            },
          },
          on_attach = function(client, _)
            if client.name == "tailwindcss" then
              client.server_capabilities.colorProvider = true
            end
          end,
        },
        document_color = {
          enabled = true,
          kind = "inline",
          inline_symbol = "󰝤 ",
          debounce = 200,
        },
        conceal = {
          enabled = false,
          min_length = 12,
          symbol = "󱏿",
          highlight = {
            fg = "#38BDF8",
          },
        },
        keymaps = {
          smart_increment = {
            enabled = false,
          }
        },
        cmp = {
          highlight = "foreground",
        },
        telescope = {
          utilities = {
            callback = function(_, class)
              vim.fn.setreg("+", class)
              vim.notify("copied class: " .. class, vim.log.levels.INFO)
            end,
          },
        },
        extension = {
          queries = {},
          patterns = {
            javascript = { "clsx%(([^)]+)%)" },
            javascriptreact = { "clsx%(([^)]+)%)", "cn%(([^)]+)%)" },
            typescript = { "clsx%(([^)]+)%)" },
            typescriptreact = { "clsx%(([^)]+)%)", "cn%(([^)]+)%)" },
            vue = { ":class=\"([^\"]+)\"", "class=\"([^\"]+)\"" },
          },
        },
      })
    end,
  },
}

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
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "eslint",
          "html",
          "cssls",
          "tailwindcss",
          "jsonls",
        },
        automatic_enable = true,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      capabilities.offsetEncoding = { "utf-16" }

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentHighlightProvider then
          local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
          vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group,
            buffer = bufnr,
            callback = function()
              if vim.bo.filetype == "dashboard" or vim.bo.filetype == "" then
                return
              end
              pcall(vim.lsp.buf.document_highlight)
            end,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = bufnr,
            callback = function()
              if vim.bo.filetype == "dashboard" or vim.bo.filetype == "" then
                return
              end
              pcall(vim.lsp.buf.clear_references)
            end,
          })
        end
      end

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
              completion = { callSnippet = "Replace" },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        pyright = {},
        ts_ls = {
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
          init_options = {
            preferences = {
              disableSuggestions = false,
            }
          },
        },
        html = {
          filetypes = { "html" },
        },
        cssls = {},
        tailwindcss = {
          filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        },
        jsonls = {},
        eslint = {
          settings = {
            packageManager = "pnpm",
            useESLintClass = true,
            experimental = {
              useFlatConfig = false
            },
            codeActionOnSave = {
              enable = true,
              mode = "all"
            },
            format = true,
            quiet = false,
            onIgnoredFiles = "off",
            rulesCustomizations = {},
            run = "onType",
            problems = {
              shortenToSingleLine = false
            },
            nodePath = "",
            workingDirectory = {
              mode = "location"
            }
          },
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        if server ~= "eslint" then
          config.on_attach = on_attach
        end
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "isort",
          "pylint",
          "eslint_d",
          "autopep8",
          "luacheck",
          "jsonlint",
          "yamllint",
          "stylelint",
          "htmlhint",
          "markdownlint",
          "debugpy",
          "js-debug-adapter",
        },
        auto_update = true,
        run_on_start = true,
        start_delay = 0,
        debounce_hours = 5,
        integrations = {
          ["mason-lspconfig"] = true,
          ["mason-nvim-dap"] = true,
        },
      })
    end,
  },
}

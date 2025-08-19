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
          "basedpyright",
          "cssls",
          "emmet_language_server",
          "eslint",
          "html",
          "jsonls",
          "lua_ls",
          "tailwindcss",
          "ts_ls",
        },
        automatic_enable = false,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

      capabilities.offsetEncoding = { "utf-16" }

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentHighlightProvider then
          local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
          vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group,
            buffer = bufnr,
            callback = function()
              pcall(vim.lsp.buf.document_highlight)
            end,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = bufnr,
            callback = function()
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
              hint = {
                enable = true,
              },
            },
          },
        },
        basedpyright = {
          cmd = { "basedpyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_markers = { "requirements.txt", ".git" },
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "recommended",
                failOnWarnings = false,
                autoImportCompletions = true,
                inlayHints = {
                  variableTypes = true,
                  callArgumentNames = true,
                  callArgumentNamesMatching = true,
                  functionReturnTypes = true,
                  genericTypes = true,
                },
                useTypingExtensions = true,
                fileEnumerationTimeout = 10,
                autoFormatStrings = true,
              },
            },
          },
        },
        ts_ls = {
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "jsconfig.json", "tsconfig.json" },
          init_options = {
            hostInfo = "neovim",
            preferences = {
              disableSuggestions = false,
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              importModuleSpecifierPreference = "non-relative",
              importModuleSpecifierEnding = "auto",
              includePackageJsonAutoImports = "auto",
              allowIncompleteCompletions = true,
              includeCompletionsWithSnippetText = true,
              includeCompletionsWithInsertText = true,
              includeAutomaticOptionalChainCompletions = true,
              includeCompletionsWithClassMemberSnippets = true,
              includeCompletionsWithObjectLiteralMethodSnippets = true,
              useLabelDetailsInCompletionEntries = true,
              jsxAttributeCompletionStyle = "auto",
              interactiveInlayHints = true,
            }
          },
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
              completions = {
                completeFunctionCalls = true,
              },
              implementationsCodeLens = { enabled = true },
              referencesCodeLens = { enabled = true, showOnAllFunctions = true },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
              completions = {
                completeFunctionCalls = true,
              },
              implementationsCodeLens = { enabled = true },
              referencesCodeLens = { enabled = true, showOnAllFunctions = true },
            },
          },
        },
        html = {
          filetypes = { "html" },
          init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
              css = true,
              javascript = true
            },
            provideFormatter = true
          }
        },
        cssls = {},
        emmet_language_server = {
          filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
          init_options = {
            includeLanguages = {},
            excludeLanguages = {},
            extensionsPath = {},
            preferences = {},
            showAbbreviationSuggestions = true,
            showExpandedAbbreviation = "always",
            showSuggestionsAsSnippets = false,
            syntaxProfiles = {},
            variables = {},
          },
        },
        tailwindcss = {
          filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
          settings = {
            tailwindCSS = {
              includeLanguages = {
                html = "html",
                javascript = "javascript",
                typescript = "typescript",
                vue = "vue",
                astro = "html",
                jsx = "javascriptreact",
                tsx = "typescriptreact",
              },
              classAttributes = {
                "class",
                "className",
                "ngClass",
                "class:list",
                ":class",
                "v-bind:class",
                "x-bind:class"
              },
              colorDecorators = true,
              showPixelEquivalents = true,
              rootFontSize = 16,
              hovers = true,
              suggestions = true,
              codeActions = true,
              validate = true,
              lint = {
                invalidScreen = "error",
                invalidVariant = "error",
                invalidTailwindDirective = "error",
                invalidApply = "error",
                invalidConfigPath = "error",
                cssConflict = "warning",
                recommendedVariantOrder = "warning",
                usedBlocklistedClass = "warning"
              },
              emmetCompletions = true,
              files = {
                exclude = {
                  "**/.git/**",
                  "**/node_modules/**",
                  "**/.hg/**",
                  "**/.svn/**"
                }
              }
            }
          },
          init_options = {
            userLanguages = {
              html = "html",
              css = "css",
              javascript = "javascript",
              typescript = "typescript",
              vue = "vue"
            }
          },
          capabilities = {
            completion = {
              completionItem = {
                snippetSupport = true,
                resolveSupport = {
                  properties = { "documentation", "detail", "additionalTextEdits" }
                }
              }
            }
          }
        },
        jsonls = {
          filetypes = { "json", "jsonc" },
          init_options = {
            provideFormatter = true,
            validate = true,
            allowComments = true,
            allowTrailingCommas = true,
            allowArbitraryComments = true
          },
          settings = {
            json = {
              format = {
                enable = true,
                tabSize = 4,
                insertSpaces = true,
                keepLines = false
              },
              schemas = {
                {
                  fileMatch = { "tsconfig.json", "tsconfig.*.json" },
                  url = "https://www.schemastore.org/tsconfig"
                },
                {
                  fileMatch = { "package.json" },
                  url = "https://www.schemastore.org/package"
                },
                {
                  fileMatch = { "electron-builder.json" },
                  url = "https://www.schemastore.org/electron-builder.json"
                },
                {
                  fileMatch = { ".github/workflows/*.yml", ".github/workflows/*.yaml" },
                  url =
                  "https://raw.githubusercontent.com/typesafegithub/github-actions-typing/refs/heads/schema-latest/github-actions-typing.schema.json"
                },
                {
                  fileMatch = { "jsconfig.json" },
                  url = "https://www.schemastore.org/jsconfig"
                },
                {
                  fileMatch = { "eslint.config.json", ".eslintrc.json" },
                  url = "https://www.schemastore.org/eslintrc"
                },
                {
                  fileMatch = { ".prettierrc.json", "prettier.config.json" },
                  url = "https://www.schemastore.org/prettierrc.json"
                },
                {
                  fileMatch = { "next.config.json" },
                  url = "https://www.schemastore.org/next"
                }
              },
              validate = {
                enable = true,
                allowComments = true,
                allowTrailingCommas = true,
                allowArbitraryComments = true
              },
              allowComments = true,
              allowTrailingCommas = true,
              allowArbitraryComments = true,
              suggest = {
                includeDefaultValuePropertySnippets = true,
                includeEnumValueCompletions = true
              },
              completion = {
                includeDefaultValuePropertySnippets = true,
                includeEnumValueCompletions = true
              },
              experimental = {
                enableProjectReferences = true
              }
            }
          }
        },
        eslint = {
          settings = {
            codeAction = {
              disableRuleComment = {
                enable = true,
                location = "separateLine"
              },
              showDocumentation = {
                enable = true
              }
            },
            codeActionOnSave = {
              enable = true,
              mode = "all"
            },
            experimental = {
              useFlatConfig = false
            },
            format = true,
            nodePath = "",
            onIgnoredFiles = "off",
            problems = {
              shortenToSingleLine = false
            },
            quiet = false,
            rulesCustomizations = {},
            run = "onType",
            useESLintClass = true,
            validate = "always",
            workingDirectory = {
              mode = "auto"
            },
            packageManager = "pnpm"
          },
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
          "autopep8",
          "basedpyright",
          "debugpy",
          "eslint_d",
          "htmlhint",
          "isort",
          "js-debug-adapter",
          "jsonlint",
          "luacheck",
          "markdownlint",
          "pylint",
          "shfmt",
          "stylelint",
          "stylua",
          "vscode-langservers-extracted",
          "yamllint",
          "prettierd"
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

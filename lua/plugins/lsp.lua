return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "folke/neodev.nvim", opts = {} },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local signs = {
                Error = "󰅚 ",
                Warn = "󰀪 ",
                Hint = "󰌵 ",
                Info = "󰋼 ",
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●',
                    source = "if_many",
                },
                float = {
                    source = true,
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            local function on_attach(client, bufnr)
                local keymaps = require("core.keymap").lsp_keymaps
                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set('n', keymaps.goto_definition, vim.lsp.buf.definition, opts)
                vim.keymap.set('n', keymaps.hover, vim.lsp.buf.hover, opts)
                vim.keymap.set('n', keymaps.rename, vim.lsp.buf.rename, opts)
                vim.keymap.set('n', keymaps.code_action, vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', keymaps.references, vim.lsp.buf.references, opts)
                vim.keymap.set('n', keymaps.diagnostic_next, vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', keymaps.diagnostic_prev, vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', keymaps.diagnostic_line, vim.diagnostic.open_float, opts)
                vim.keymap.set('n', keymaps.format, function()
                    vim.lsp.buf.format()
                end, opts)
                vim.keymap.set('i', keymaps.format, function()
                    vim.lsp.buf.format()
                end, opts)
            end

            local lspconfig = require("lspconfig")
            local servers = {
                "lua_ls",
                "pyright",
                "pylsp",
                "ts_ls",
                "html",
                "cssls",
                "jsonls"
            }

            for _, server in ipairs(servers) do
                local opts = {
                    on_attach = on_attach,
                }

                if server == "lua_ls" then
                    opts.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    }
                end

                if server == "pylsp" then
                    opts.settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = { enabled = false },
                                autopep8 = { enabled = false },
                                yapf = { enabled = false },
                                black = { enabled = true },
                            }
                        }
                    }
                end

                lspconfig[server].setup(opts)
            end
        end,
    }
}
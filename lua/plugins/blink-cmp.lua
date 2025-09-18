return {
    "saghen/blink.cmp",
    version = "1.*",
    config = function(_, opts)
        require("keymaps.blink-cmp")
        opts.keymap = vim.g.blink_cmp_keymap
        opts.cmdline.keymap = vim.g.blink_cmp_keymap
        require("blink.cmp").setup(opts)
    end,
    opts = {
        keymap = { preset = "none" },
        appearance = {
            highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
            nerd_font_variant = "mono",
            use_nvim_cmp_as_default = false,
        },
        snippets = {
            preset = "luasnip",
        },
        completion = {
            keyword = { range = "full" },
            trigger = {
                prefetch_on_insert = true,
                show_in_snippet = true,
                show_on_backspace = true,
                show_on_backspace_in_keyword = true,
                show_on_keyword = true,
                show_on_trigger_character = true,
                show_on_insert = true,
                show_on_blocked_trigger_characters = function()
                    if vim.bo.filetype == "html" then
                        return { " ", "\n", "\t", ">" }
                    elseif vim.bo.filetype == "python" then
                        return { " ", "\n", "\t", ":" }
                    end
                    return { " ", "\n", "\t" }
                end,
            },
            list = {
                max_items = 200,
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
                cycle = {
                    from_bottom = true,
                    from_top = true,
                },
            },
            accept = {
                dot_repeat = false,
                create_undo_point = true,
                resolve_timeout_ms = 100,
                auto_brackets = {
                    enabled = true,
                    default_brackets = { "(", ")" },
                    kind_resolution = {
                        enabled = true,
                        blocked_filetypes = {
                            "typescriptreact",
                            "javascriptreact",
                            "vue",
                            "css",
                            "html",
                        },
                    },
                    semantic_token_resolution = {
                        enabled = true,
                        blocked_filetypes = {},
                        timeout_ms = 400,
                    },
                },
            },
            menu = {
                enabled = true,
                min_width = 15,
                max_height = 10,
                border = "rounded",
                winblend = 10,
                scrolloff = 2,
                scrollbar = true,
                direction_priority = { "s", "n" },
                auto_show = true,
                draw = {
                    align_to = "label",
                    padding = 1,
                    gap = 1,
                    treesitter = { "lsp" },
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                return hl
                            end,
                        },
                        label = {
                            text = function(ctx)
                                return ctx.label
                                    .. (
                                        ctx.label_description and " " .. ctx.label_description
                                        or ""
                                    )
                            end,
                        },
                        source_name = {
                            text = function(ctx)
                                return ctx.source_name
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                update_delay_ms = 50,
                treesitter_highlighting = true,
                window = {
                    min_width = 10,
                    max_width = 80,
                    max_height = 20,
                    border = "rounded",
                    winblend = 10,
                    scrollbar = true,
                },
            },
            ghost_text = {
                enabled = true,
                show_with_selection = true,
                show_without_selection = false,
                show_with_menu = false,
                show_without_menu = true,
            },
        },
        signature = {
            enabled = true,
            trigger = {
                enabled = true,
                show_on_keyword = true,
                show_on_trigger_character = true,
                show_on_insert = false,
                show_on_insert_on_trigger_character = true,
            },
            window = {
                min_width = 1,
                max_width = 100,
                max_height = 10,
                border = "rounded",
                winblend = 10,
                treesitter_highlighting = true,
                show_documentation = true,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                lua = { inherit_defaults = true },
                markdown = { "path", "buffer" },
                html = { "lsp", "path", "snippets", "buffer" },
                css = { "lsp", "path", "snippets", "buffer" },
                javascript = { "lsp", "path", "snippets", "buffer" },
                javascriptreact = { "lsp", "path", "snippets", "buffer" },
                typescript = { "lsp", "path", "snippets", "buffer" },
                typescriptreact = { "lsp", "path", "snippets", "buffer" },
                vue = { "lsp", "path", "snippets", "buffer" },
                nui = {},
            },
            min_keyword_length = 1,
            providers = {
                lsp = {
                    name = "LSP",
                    fallbacks = {},
                    score_offset = 0,
                    opts = {
                        tailwind_color_icon = "",
                    },
                },
                path = {
                    score_offset = 3,
                    fallbacks = { "buffer" },
                    opts = {
                        trailing_slash = true,
                        label_trailing_slash = true,
                        show_hidden_files_by_default = false,
                    },
                },
                snippets = {
                    score_offset = -1,
                    opts = {
                        use_show_condition = true,
                        show_autosnippets = true,
                        prefer_doc_trig = false,
                    },
                },
                buffer = {
                    score_offset = -3,
                    opts = {
                        get_bufnrs = function()
                            return vim.iter(vim.api.nvim_list_wins())
                                :map(function(win)
                                    return vim.api.nvim_win_get_buf(win)
                                end)
                                :filter(function(buf)
                                    return vim.bo[buf].buftype ~= "nofile"
                                end)
                                :totable()
                        end,
                        max_sync_buffer_size = 20000,
                        max_async_buffer_size = 200000,
                        use_cache = true,
                    },
                },
            },
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
            max_typos = function(keyword)
                return math.floor(#keyword / 4)
            end,
            frecency = {
                enabled = true,
                path = vim.fn.stdpath("state") .. "/blink/cmp/frecency.dat",
                unsafe_no_lock = false,
            },
            use_proximity = true,
            sorts = {
                "exact",
                "score",
                "sort_text",
            },
            prebuilt_binaries = {
                download = true,
                ignore_version_mismatch = false,
            },
        },

        cmdline = {
            enabled = true,
            sources = { "buffer", "cmdline" },
            completion = {
                menu = {
                    auto_show = function()
                        return vim.fn.getcmdtype() == ":"
                    end,
                },
                ghost_text = { enabled = true },
                trigger = {
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = {},
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
            },
        },
    },

    opts_extend = { "sources.default" },
}

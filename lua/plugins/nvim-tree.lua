return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 35,
            side = "left",
            relativenumber = false,
            number = false,
            signcolumn = "yes",
            adaptive_size = false,
        },
        hijack_directories = {
            enable = false,
            auto_open = false,
        },
        renderer = {
            group_empty = true,
            highlight_git = true,
            highlight_opened_files = "none",
            highlight_modified = "none",
            root_folder_label = false,
            icons = {
                webdev_colors = true,
                git_placement = "before",
                padding = " ",
                symlink_arrow = " 󰁔 ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                    modified = true,
                },
                glyphs = {
                    default = "󰈔",
                    symlink = "󰌹",
                    bookmark = "󰃀",
                    modified = "󰏬",
                    folder = {
                        arrow_closed = "󰍟",
                        arrow_open = "󰍝",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "󰌹",
                        symlink_open = "󰌹",
                    },
                    git = {
                        unstaged = "",
                        staged = "",
                        unmerged = "",
                        renamed = "",
                        untracked = "󰋘",
                        deleted = "󰆴",
                        ignored = "",
                    },
                },
            },
            indent_markers = {
                enable = true,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
        },
        filters = {
            dotfiles = false,
            git_clean = false,
            no_buffer = false,
            custom = {
                "node_modules",
                "\\.cache",
                "\\.exe$",
                "\\.DS_Store$",
                "\\.astro/",
                "\\.git$",
                "\\.git/",
                "\\.idea/",
                "\\.mvn$",
                "\\.mypy_cache/",
                "\\.netlify/",
                "\\.next/",
                "\\.nuxt/",
                "\\.pytest_cache/",
                "\\.venv$",
                "\\.venv/",
                "\\.vscode/",
                "\\.rgignore$",
                "__pycache__$",
                "__pycache__/",
                "build$",
                "build/",
                "dist/$",
                "dist/",
                "env$",
                "env/",
                "package-lock\\.json$",
                "pnpm-lock\\.yaml$",
                "target$",
                "venv$",
                "venv/",
                "yarn\\.lock$",
            },
            exclude = {},
        },
        git = {
            enable = true,
            ignore = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
            timeout = 400,
        },
        filesystem_watchers = {
            enable = true,
            debounce_delay = 50,
            ignore_dirs = {},
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
                restrict_above_cwd = false,
            },
            expand_all = {
                max_folder_discovery = 300,
                exclude = {},
            },
            file_popup = {
                open_win_config = {
                    col = 1,
                    row = 1,
                    relative = "cursor",
                    border = "shadow",
                    style = "minimal",
                },
            },
            open_file = {
                quit_on_open = false,
                resize_window = true,
                window_picker = {
                    enable = true,
                    picker = "default",
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
            remove_file = {
                close_window = true,
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
            debounce_delay = 50,
            severity = {
                min = vim.diagnostic.severity.HINT,
                max = vim.diagnostic.severity.ERROR,
            },
        },
        modified = {
            enable = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
        live_filter = {
            prefix = "[FILTER]: ",
            always_show_folders = true,
        },
        tab = {
            sync = {
                open = false,
                close = false,
                ignore = {},
            },
        },
        notify = {
            threshold = vim.log.levels.INFO,
        },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                dev = false,
                diagnostics = false,
                git = false,
                profile = false,
                watcher = false,
            },
        },
    },
    config = function(_, opts)
        local keymaps = require("keymaps.nvim-tree")
        opts.on_attach = keymaps.on_attach
        require("nvim-tree").setup(opts)
    end,
}

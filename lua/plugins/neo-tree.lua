return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
            's1n7ax/nvim-window-picker',
            version = '2.*',
            config = function()
                require('window-picker').setup({
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        bo = {
                            filetype = { 'neo-tree', "neo-tree-popup", "notify", "lazy", "mason", "qf" },
                            buftype = { 'terminal', "quickfix" },
                        },
                    },
                })
            end,
        },
    },
    cmd = "Neotree",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
        { "\\", "<cmd>Neotree reveal<cr>", desc = "Reveal File" },
        { "<leader>gs", "<cmd>Neotree float git_status<cr>", desc = "Git Status" },
        { "<leader>bf", "<cmd>Neotree float buffers<cr>", desc = "Buffers" },
    },
    config = function()
        local colors = require("dracula").colors()

        -- Định nghĩa icons cho diagnostic
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup({
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            source_selector = {
                winbar = true,
                content_layout = "center",
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files " },
                    { source = "buffers", display_name = " 󰈙 Buffers " },
                    { source = "git_status", display_name = " 󰊢 Git " },
                    { source = "document_symbols", display_name = " 󰘐 Symbols " },
                },
                separator = { left = "", right = "" },
                highlight_tab = "NeoTreeTabInactive",
                highlight_tab_active = "NeoTreeTabActive",
                highlight_background = "NeoTreeTabInactive",
                highlight_separator = "NeoTreeTabSeparatorInactive",
                highlight_separator_active = "NeoTreeTabSeparatorActive",
            },
            close_if_last_window = false,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            sort_case_insensitive = true,
            window = {
                position = "left",
                width = 35,
                mappings = require("core.keymap").neotree_keymaps,
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_by_name = {
                        "node_modules",
                        ".git",
                        ".cache",
                        "dist",
                        "build",
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                        ".git",
                    },
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                group_empty_dirs = true,
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = true,
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰜌",
                    folder_empty_open = "󰜌",
                    default = "󰈙",
                    highlight = "NeoTreeFileIcon"
                },
                modified = {
                    symbol = "●",
                    highlight = "NeoTreeModified",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "✚",
                        deleted   = "✖",
                        modified  = "",
                        renamed   = "󰁕",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    },
                },
                file_size = {
                    enabled = true,
                    required_width = 64,
                },
                type = {
                    enabled = true,
                    required_width = 122,
                },
                last_modified = {
                    enabled = true,
                    required_width = 88,
                },
                created = {
                    enabled = true,
                    required_width = 110,
                },
            },
        })

        -- Tùy chỉnh màu sắc theo theme Dracula
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = colors.menu })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = colors.menu })
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = colors.menu })
        vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.bright_magenta, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.bright_yellow })
        vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.bright_green })
        vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = colors.bright_red })
        vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = colors.bright_red, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = colors.bright_blue })
        vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = colors.nontext })
        vim.api.nvim_set_hl(0, "NeoTreeSymbolicLinkTarget", { fg = colors.bright_cyan })
        vim.api.nvim_set_hl(0, "NeoTreeTabActive", { fg = colors.bright_magenta, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = colors.comment })
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = colors.bright_magenta })
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = colors.comment })
    end,
}
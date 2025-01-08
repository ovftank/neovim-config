return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {
            'echasnovski/mini.icons'
        },
        config = function()
            local mini_icons = require('mini.icons')
            require('dashboard').setup {
                theme = 'doom',
                config = {
                    header = {
                        "",
                        "             __ _              _    ",
                        "            / _| |            | |   ",
                        "  _____   _| |_| |_ __ _ _ __ | | __",
                        " / _ \\ \\ / /  _| __/ _` | '_ \\| |/ /",
                        "| (_) \\ V /| | | || (_| | | | |   < ",
                        " \\___/ \\_/ |_|  \\__\\__,_|_| |_|_|\\_\\",
                        "                                    ",
                        "                                    ",
                        "",
                    },
                    center = {
                        {
                            icon = mini_icons.get('directory', '.config') .. ' ',
                            icon_hl = 'DashboardCenter',
                            desc = 'Tìm Files',
                            desc_hl = 'DashboardDesc',
                            key = 'f',
                            key_hl = 'DashboardKey',
                            action = 'Telescope find_files'
                        },
                        {
                            icon = mini_icons.get('filetype', 'clock') .. ' ',
                            icon_hl = 'DashboardCenter',
                            desc = 'Files Gần Đây',
                            desc_hl = 'DashboardDesc',
                            key = 'r',
                            key_hl = 'DashboardKey',
                            action = 'Telescope oldfiles'
                        },
                        {
                            icon = mini_icons.get('lsp', 'search') .. ' ',
                            icon_hl = 'DashboardCenter',
                            desc = 'Tìm Text',
                            desc_hl = 'DashboardDesc',
                            key = 'w',
                            key_hl = 'DashboardKey',
                            action = 'Telescope live_grep'
                        },
                        {
                            icon = mini_icons.get('file', 'package.json') .. ' ',
                            icon_hl = 'DashboardCenter',
                            desc = 'Quản Lý Plugins',
                            desc_hl = 'DashboardDesc',
                            key = 'l',
                            key_hl = 'DashboardKey',
                            action = 'Lazy'
                        },
                        {
                            icon = mini_icons.get('lsp', 'exit') .. ' ',
                            icon_hl = 'DashboardCenter',
                            desc = 'Thoát Neovim',
                            desc_hl = 'DashboardDesc',
                            key = 'q',
                            key_hl = 'DashboardKey',
                            action = 'q!'
                        }
                    },
                    footer = {
                        '',
                        mini_icons.get('filetype', 'rocket') .. ' Neovim đã sẵn sàng!',
                        mini_icons.get('filetype', 'keyboard') .. ' ' .. #vim.tbl_keys(require('lazy').plugins()) .. ' plugins đã được tải.'
                    }
                }
            }
            vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#bd93f9' })
            vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#bd93f9' })
            vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#f8f8f2' })
            vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#ffb86c' })
            vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#50fa7b' })
        end
    }
}

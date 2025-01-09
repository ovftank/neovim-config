return {
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            vim.opt.showmode = false

            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
            }

            local language_icons = {
                lua = '󰢱',
                python = '󰌠',
                rust = '󱘗',
                javascript = '󰌞',
                typescript = '󰛦',
                html = '󰌝',
                css = '󰌜',
                cpp = '󰙲',
                c = '󰙱',
                java = '󰬷',
                go = '󰟓',
                markdown = '󰍔',
                vim = '',
                bash = '',
                fish = '',
                zsh = '',
                json = '󰘦',
                yaml = '',
                toml = '',
                dockerfile = '󰡨',
                default = '󰈙',
            }

            local encoding_icons = {
                ['utf-8'] = '󰉿',
                ['utf-16'] = '󰘦',
                ['utf-32'] = '󰘦',
                ['utf8'] = '󰉿',
                ['utf16'] = '󰘦',
                ['utf32'] = '󰘦',
                ['ascii'] = '󰘬',
                ['iso-8859-1'] = '󰘬',
                default = '󰘬',
            }

            local function get_file_icon()
                local extension = vim.fn.expand('%:e')
                return language_icons[extension] or language_icons.default
            end

            local config = {
                options = {
                    theme = 'dracula',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = { "dashboard", "lazy", "alpha" },
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = {
                        {
                            'mode',
                            icon = '󰊠',
                            separator = { left = '', right = '' },
                            fmt = function(str)
                                return str:sub(1, 1)
                            end
                        }
                    },
                    lualine_b = {
                        {
                            'branch',
                            icon = '󰊢',
                            color = { gui = 'bold' }
                        },
                        {
                            'diff',
                            symbols = {
                                added = '󰐕 ',
                                modified = '󰝤 ',
                                removed = '󰍴 ',
                            },
                            cond = conditions.hide_in_width,
                        },
                    },
                    lualine_c = {
                        {
                            'filename',
                            icon = get_file_icon(),
                            file_status = true,
                            path = 1,
                            symbols = {
                                modified = '󰏫 ',
                                readonly = '󰌾 ',
                                unnamed = '[No Name]',
                                newfile = '󰎔 ',
                            }
                        },
                        {
                            'filesize',
                            icon = '󰪃',
                            cond = conditions.buffer_not_empty,
                        },
                        {
                            'searchcount',
                            icon = '󰍉',
                            cond = function()
                                return vim.v.hlsearch ~= 0
                            end,
                        },
                    },
                    lualine_x = {
                        {
                            'diagnostics',
                            sources = { 'nvim_diagnostic' },
                            symbols = {
                                error = '󰅚 ',
                                warn = '󰀪 ',
                                info = '󰋼 ',
                                hint = '󰌵 ',
                            },
                        },
                        {
                            'selectioncount',
                            icon = '󰦨',
                            cond = function()
                                return vim.fn.mode():find("[Vv]") ~= nil
                            end,
                        },
                        {
                            'filetype',
                            icon_only = true,
                            separator = '',
                            padding = { left = 1, right = 0 },
                            icons_enabled = true,
                        },
                        {
                            'encoding',
                            fmt = function(str)
                                return (encoding_icons[str:lower()] or encoding_icons.default) .. ' ' .. str
                            end,
                            cond = conditions.hide_in_width,
                        },
                        {
                            'fileformat',
                            icons_enabled = true,
                            symbols = {
                                unix = '󰣇',
                                dos = '󰨡',
                                mac = '󰀵',
                            },
                        },
                    },
                    lualine_y = {
                        { 'progress', icon = '󰜎' },
                        {
                            'hostname',
                            icon = '󰟀',
                            cond = conditions.hide_in_width,
                        },
                    },
                    lualine_z = {
                        { 'location', icon = '󰍎' },
                    }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                winbar = {},
                inactive_winbar = {},
                extensions = { 'lazy', 'mason', 'trouble', 'nvim-tree' }
            }

            require('lualine').setup(config)
        end
    }
}

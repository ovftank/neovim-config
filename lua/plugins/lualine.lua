return {
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local mini_icons = require('mini.icons')

            -- Dracula color palette
            local colors = {
                bg = '#282a36',
                fg = '#f8f8f2',
                yellow = '#f1fa8c',
                cyan = '#8be9fd',
                darkblue = '#081633',
                green = '#50fa7b',
                orange = '#ffb86c',
                violet = '#bd93f9',
                magenta = '#ff79c6',
                blue = '#8be9fd',
                red = '#ff5555'
            }

            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
            }

            local config = {
                options = {
                    theme = {
                        normal = {
                            a = { fg = colors.bg, bg = colors.violet, gui = 'bold' },
                            b = { fg = colors.fg, bg = colors.bg },
                            c = { fg = colors.fg, bg = colors.bg }
                        },
                        insert = {
                            a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
                            b = { fg = colors.fg, bg = colors.bg },
                        },
                        visual = {
                            a = { fg = colors.bg, bg = colors.magenta, gui = 'bold' },
                            b = { fg = colors.fg, bg = colors.bg },
                        },
                        replace = {
                            a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
                            b = { fg = colors.fg, bg = colors.bg },
                        },
                        command = {
                            a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
                            b = { fg = colors.fg, bg = colors.bg },
                        },
                        inactive = {
                            a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
                            b = { fg = colors.fg, bg = colors.bg },
                            c = { fg = colors.fg, bg = colors.bg }
                        }
                    },
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
                            icon = mini_icons.get('misc', 'vim'),
                            separator = { left = '', right = '' },
                        }
                    },
                    lualine_b = {
                        {
                            'branch',
                            icon = mini_icons.get('git', 'branch'),
                            color = { fg = colors.violet, gui = 'bold' },
                        },
                        {
                            'diff',
                            symbols = {
                                added = mini_icons.get('git', 'added') .. ' ',
                                modified = mini_icons.get('git', 'modified') .. ' ',
                                removed = mini_icons.get('git', 'removed') .. ' ',
                            },
                            diff_color = {
                                added = { fg = colors.green },
                                modified = { fg = colors.orange },
                                removed = { fg = colors.red },
                            },
                            cond = conditions.hide_in_width,
                        },
                    },
                    lualine_c = {
                        {
                            'filename',
                            icon = mini_icons.get('kind', 'file'),
                            file_status = true,
                            path = 1,
                            symbols = {
                                modified = '[+]',
                                readonly = '[-]',
                                unnamed = '[No Name]',
                            }
                        }
                    },
                    lualine_x = {
                        {
                            'diagnostics',
                            sources = { 'nvim_diagnostic' },
                            symbols = {
                                error = mini_icons.get('diagnostic', 'error') .. ' ',
                                warn = mini_icons.get('diagnostic', 'warn') .. ' ',
                                info = mini_icons.get('diagnostic', 'info') .. ' ',
                                hint = mini_icons.get('diagnostic', 'hint') .. ' ',
                            },
                            diagnostics_color = {
                                error = { fg = colors.red },
                                warn = { fg = colors.yellow },
                                info = { fg = colors.cyan },
                                hint = { fg = colors.green },
                            },
                        },
                        { 'encoding',   icon = mini_icons.get('misc', 'keyboard'), color = { fg = colors.green } },
                        { 'fileformat', icons_enabled = false,                     color = { fg = colors.green } },
                        { 'filetype',   icon_only = true,                          separator = '',               padding = { left = 1, right = 0 } },
                        { 'filetype',   colored = true,                            icon = { align = 'right' } },
                    },
                    lualine_y = {
                        { 'progress', icon = mini_icons.get('misc', 'page'), color = { fg = colors.orange, gui = 'bold' } },
                    },
                    lualine_z = {
                        { 'location', icon = mini_icons.get('misc', 'location'), color = { gui = 'bold' } },
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
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = { 'lazy', 'mason', 'trouble', 'nvim-tree' }
            }

            require('lualine').setup(config)
        end
    }
}

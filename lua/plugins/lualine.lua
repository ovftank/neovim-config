return {
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
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
                            icon = '',
                            separator = { left = '', right = '' },
                        }
                    },
                    lualine_b = {
                        {
                            'branch',
                            icon = '',
                        },
                        {
                            'diff',
                            symbols = {
                                added = ' ',
                                modified = ' ',
                                removed = ' ',
                            },
                            cond = conditions.hide_in_width,
                        },
                    },
                    lualine_c = {
                        {
                            'filename',
                            icon = '',
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
                                error = ' ',
                                warn = ' ',
                                info = ' ',
                                hint = ' ',
                            },
                        },
                        { 'encoding',   icon = '',             },
                        { 'fileformat', icons_enabled = false, },
                        { 'filetype',   icon_only = true,      separator = '',               padding = { left = 1, right = 0 } },
                        { 'filetype',   colored = true,        icon = { align = 'right' } },
                    },
                    lualine_y = {
                        { 'progress', icon = '', },
                    },
                    lualine_z = {
                        { 'location', icon = '', },
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

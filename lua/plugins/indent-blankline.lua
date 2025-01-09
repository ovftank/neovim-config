return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim",
        },
        config = function()
            local colors = require('dracula').colors()

            local highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            }

            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = colors.red })
                vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = colors.yellow })
                vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = colors.purple })
                vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = colors.orange })
                vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = colors.green })
                vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = colors.pink })
                vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = colors.cyan })
            end)
            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup({
                indent = {
                    char = "│",
                    highlight = highlight,
                },
                scope = {
                    enabled = true,
                    show_start = true,
                    show_end = true,
                    highlight = highlight,
                    priority = 500,
                },
                exclude = {
                    filetypes = {
                        "help",
                        "dashboard",
                        "lazy",
                        "mason",
                        "notify",
                    },
                },
            })
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
    }
}

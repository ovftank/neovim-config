return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim",
        },
        config = function()
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
                vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#ff5555" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#f1fa8c" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#bd93f9" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ffb86c" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#50fa7b" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#ff79c6" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#8be9fd" })
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
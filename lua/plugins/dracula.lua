return {
    {
        "maxmx03/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local dracula = require("dracula")

            dracula.setup({
                styles = {
                    Type = {},
                    Function = {},
                    Parameter = {},
                    Property = {},
                    Comment = {},
                    String = {},
                    Keyword = {},
                    Identifier = {},
                    Constant = {},
                },
                transparent = false,
                on_colors = function(_, _)
                    return {}
                end,
                on_highlights = function(_, _)
                    return {}
                end,
                plugins = {
                    ["nvim-treesitter"] = true,
                    ["nvim-tree.lua"] = true,
                    ["gitsigns.nvim"] = true,
                    ["lazy.nvim"] = true,
                    ["telescope.nvim"] = true,
                    ["bufferline.nvim"] = true,
                    ["rainbow-delimiters"] = true,
                },
            })
            vim.cmd.colorscheme("dracula")
        end,
    },
}

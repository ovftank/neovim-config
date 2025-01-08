return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            local web_devicons = require("nvim-web-devicons")
            web_devicons.setup({
                color_icons = true,
                default = true,
                strict = true,
            })
        end
    },
    {
        "echasnovski/mini.icons",
        lazy = true,
        version = false,
        config = function()
            require("mini.icons").setup({
                style = "glyph",
                directory = {},
                file = {},
                filetype = {},
                lsp = {},
                use_file_extension = function(_, _)
                    return true
                end
            })
        end
    }
}

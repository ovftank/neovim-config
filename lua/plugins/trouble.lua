return {
    "folke/trouble.nvim",
    opts = {
        auto_preview = true,
        preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
        },
        modes = {
            diagnostics = {
                mode = "diagnostics",
                auto_jump = false,
                auto_close = false,
                focus = true,
            },
        },
        icons = {
            indent = {
                middle = " ",
                last = " ",
                top = " ",
                ws = "│  ",
            },
        },
    },
    config = function(_, opts)
        require("trouble").setup(opts)
        require("keymaps.trouble")
    end,
    lazy = false,
}

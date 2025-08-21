return {
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        opts = {
            show_end_of_buffer = true,
            transparent_bg = false,
            lualine_bg_color = "#44475a",
            italic_comment = true,
        },
        init = function()
            vim.cmd.colorscheme("dracula")
        end,
    },
}

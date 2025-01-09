return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("dracula").setup({
                transparent_bg = false,
                show_end_of_buffer = true,
                italic_comment = true,
                lualine_bg_color = "#44475a"
            })
            vim.cmd([[colorscheme dracula]])
        end,
    }
}

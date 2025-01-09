return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Cấu hình các tùy chọn cho Dracula theme
            require("dracula").setup({
                transparent_bg = true,
                show_end_of_buffer = true,
                italic_comment = true,
                lualine_bg_color = "#44475a"
            })

            local colors = require("dracula").colors()

            vim.api.nvim_set_hl(0, "Search", {
                fg = colors.bg,
                bg = colors.orange,
                bold = true
            })

            vim.api.nvim_set_hl(0, "IncSearch", {
                fg = colors.bg,
                bg = colors.green,
                bold = true
            })

            vim.cmd([[colorscheme dracula]])
        end,
    }
}
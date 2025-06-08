return {
    "chikko80/error-lens.nvim",
    event = { "BufRead", "BufNewFile", "InsertEnter" },
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
        enabled = true,
        auto_adjust = {
            enable = true,
            fallback_bg_color = "#282a36",
            step = 7,
            total = 30
        },
        prefix = 2,
        colors = {
            error_fg = "#ff5555",
            error_bg = "#44475a",
            warn_fg = "#ffb86c",
            warn_bg = "#44475a",
            info_fg = "#8be9fd",
            info_bg = "#44475a",
            hint_fg = "#50fa7b",
            hint_bg = "#44475a"
        }
    }
}

return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        enable = true,
        multiwindow = false,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil,
    },
    config = function(_, opts)
        require("treesitter-context").setup(opts)

        vim.api.nvim_set_hl(0, "TreesitterContext", { link = "NormalFloat" })
        vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })
        vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { link = "FloatBorder" })
    end,
}

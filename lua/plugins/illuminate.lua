return {
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
            local colors = require("dracula").colors()
            vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = colors.selection })
            vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = colors.selection })
            vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = colors.selection })
        end,
    }
}
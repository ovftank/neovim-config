return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            local ts_keymaps = require("core.keymap").ts_keymaps

            require("nvim-treesitter.configs").setup({
                modules = {},
                sync_install = false,
                ignore_install = {},
                ensure_installed = {
                    "lua", "vimdoc", "python", "markdown",
                    "markdown_inline", "regex", "json",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = ts_keymaps.incremental_selection,
                },
            })
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldenable = false
        end,
    }
}

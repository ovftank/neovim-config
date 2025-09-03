return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "javascript",
            "typescript",
            "html",
            "css",
            "json",
            "jsonc",
            "python",
            "bash",
            "yaml",
            "toml",
            "dockerfile",
            "gitignore",
            "gitcommit",
            "diff",
            "regex",
        },

        sync_install = false,

        auto_install = true,

        ignore_install = {},

        highlight = {
            enable = true,

            disable = function(_, buf)
                local max_filesize = 100 * 1024
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,

            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = {},
        },
        incremental_selection = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        require("keymaps.treesitter")
    end,
}

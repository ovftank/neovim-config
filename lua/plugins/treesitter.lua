return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                modules = {},
                ignore_install = {},

                sync_install = true,
                auto_install = true,
                ensure_installed = {
                    "lua", "vim", "vimdoc", "query",
                    "javascript", "typescript", "tsx", "html", "css", "python", "json", "bash", "markdown",
                    "markdown_inline",
                },

                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },
                incremental_selection = require("core.keymap").ts_keymaps.incremental_selection,
                autotag = { enable = true },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = require("core.keymap").ts_keymaps.textobjects or {},
                    },
                },
            })

            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldenable = false
            vim.opt.foldlevel = 99
        end,
    }
}

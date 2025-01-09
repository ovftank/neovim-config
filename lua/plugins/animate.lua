return {
    {
        "echasnovski/mini.animate",
        version = false,
        event = "VeryLazy",
        config = function()
            local animate = require('mini.animate')
            animate.setup({
                -- Cấu hình cursor
                cursor = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
                },

                -- Cấu hình scroll mượt
                scroll = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
                },

                -- Cấu hình resize cửa sổ
                resize = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
                },

                -- Cấu hình mở/đóng cửa sổ
                open = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
                },

                close = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
                },
            })

            -- Tắt animation khi sử dụng neoscroll
            vim.api.nvim_create_autocmd("User", {
                pattern = "NeoscrollStarted",
                callback = function()
                    vim.b.minianimate_disable = true
                end
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "NeoscrollStopped",
                callback = function()
                    vim.b.minianimate_disable = false
                end
            })
        end
    }
}
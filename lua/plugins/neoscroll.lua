return {
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        dependencies = {
            "echasnovski/mini.animate"
        },
        config = function()
            local neoscroll = require('neoscroll')

            neoscroll.setup({
                hide_cursor = true,
                stop_eof = true,
                respect_scrolloff = true,
                cursor_scrolls_alone = false,
                easing = "quadratic",
                duration_multiplier = 0.8,
                performance_mode = false,
            })

            local keymap = {
                ["<C-k>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100, easing = "sine" }) end,
                ["<C-j>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100, easing = "sine" }) end,
            }

            local modes = { 'n', 'v', 'x' }
            for key, func in pairs(keymap) do
                vim.keymap.set(modes, key, func, { silent = true })
            end

            neoscroll.setup({
                pre_hook = function()
                    vim.wo.cursorline = false
                end,
                post_hook = function()
                    vim.wo.cursorline = true
                end
            })
        end
    }
}

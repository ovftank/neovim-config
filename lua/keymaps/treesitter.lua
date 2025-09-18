local keymap = vim.keymap

keymap.set({ "n", "v", "i" }, "<A-w>", function()
    local ts_incremental = require("nvim-treesitter.incremental_selection")
    local mode = vim.fn.mode()
    if mode == "n" or mode == "i" then
        if mode == "i" then
            vim.cmd("stopinsert")
        end
        ts_incremental.init_selection()
    else
        ts_incremental.node_incremental()
    end
end, { desc = "expand" })
keymap.set("v", "<A-s>", function()
    local ts_incremental = require("nvim-treesitter.incremental_selection")
    ts_incremental.node_decremental()
end, { desc = "shrink" })

-- =============================================================================
-- BUFFER OPERATIONS
-- =============================================================================
local keymap = vim.keymap

-- =============================================================================
-- BUFFER MANAGEMENT
-- =============================================================================
keymap.set("n", "<C-w>", "<cmd>bdelete<cr>", { nowait = true, desc = "close buffer" })
keymap.set("i", "<C-w>", "<cmd>bdelete<cr>", { nowait = true, desc = "close buffer" })

-- =============================================================================
-- BUFFER NAVIGATION
-- =============================================================================
keymap.set("n", "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { nowait = true, desc = "next buffer" })
keymap.set(
    "n",
    "<C-S-Tab>",
    "<Cmd>BufferLineCyclePrev<CR>",
    { nowait = true, desc = "previous buffer" }
)

-- =============================================================================
-- BUFFERLINE KEYMAPS
-- =============================================================================

for i = 1, 9 do
    keymap.set("n", "<C-" .. i .. ">", function()
        require("bufferline").go_to(i, true)
    end, { desc = "go to buffer " .. i })
    keymap.set("i", "<C-" .. i .. ">", function()
        require("bufferline").go_to(i, true)
    end, { desc = "go to buffer " .. i })
    keymap.set("v", "<C-" .. i .. ">", function()
        require("bufferline").go_to(i, true)
    end, { desc = "go to buffer " .. i })
    keymap.set("c", "<C-" .. i .. ">", function()
        require("bufferline").go_to(i, true)
    end, { desc = "go to buffer " .. i })
end

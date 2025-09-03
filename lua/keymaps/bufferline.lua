local keymap = vim.keymap

-- =============================================================================
-- TAB NAVIGATION
-- =============================================================================
keymap.set("n", "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "next tab" })
keymap.set("v", "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "next tab" })
keymap.set("i", "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "next tab" })

keymap.set("n", "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "prev tab" })
keymap.set("v", "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "prev tab" })
keymap.set("i", "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "prev tab" })

-- =============================================================================
-- TAB DIRECT ACCESS
-- =============================================================================
keymap.set("n", "<C-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "tab 1" })
keymap.set("v", "<C-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "tab 1" })
keymap.set("i", "<C-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "tab 1" })

keymap.set("n", "<C-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "tab 2" })
keymap.set("v", "<C-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "tab 2" })
keymap.set("i", "<C-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "tab 2" })

keymap.set("n", "<C-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "tab 3" })
keymap.set("v", "<C-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "tab 3" })
keymap.set("i", "<C-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "tab 3" })

keymap.set("n", "<C-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "tab 4" })
keymap.set("v", "<C-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "tab 4" })
keymap.set("i", "<C-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "tab 4" })

keymap.set("n", "<C-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "tab 5" })
keymap.set("v", "<C-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "tab 5" })
keymap.set("i", "<C-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "tab 5" })

keymap.set("n", "<C-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "tab 6" })
keymap.set("v", "<C-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "tab 6" })
keymap.set("i", "<C-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "tab 6" })

keymap.set("n", "<C-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "tab 7" })
keymap.set("v", "<C-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "tab 7" })
keymap.set("i", "<C-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "tab 7" })

keymap.set("n", "<C-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "tab 8" })
keymap.set("v", "<C-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "tab 8" })
keymap.set("i", "<C-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "tab 8" })

keymap.set("n", "<C-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "tab 9" })
keymap.set("v", "<C-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "tab 9" })
keymap.set("i", "<C-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "tab 9" })

-- =============================================================================
-- TAB CLOSE
-- =============================================================================
keymap.set("n", "<C-w>", "<Cmd>bdelete!<CR>", { nowait = true, desc = "close tab" })
keymap.set("v", "<C-w>", "<Cmd>bdelete!<CR>", { nowait = true, desc = "close tab" })
keymap.set("i", "<C-w>", "<Cmd>bdelete!<CR>", { nowait = true, desc = "close tab" })

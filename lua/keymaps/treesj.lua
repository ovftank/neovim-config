local keymap = vim.keymap

keymap.set("n", "<C-l>", "<Cmd>TSJToggle<CR>", { desc = "toggle split/join arguments" })
keymap.set("v", "<C-l>", "<Cmd>TSJToggle<CR>", { desc = "toggle split/join arguments" })
keymap.set("i", "<C-l>", "<Cmd>TSJToggle<CR>", { desc = "toggle split/join arguments" })

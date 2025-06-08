local keymap = vim.keymap

keymap.set("n", "<A-t>", "<cmd>ToggleTerm<cr>", { desc = "Bật/tắt terminal" })
keymap.set("t", "<A-t>", "<cmd>ToggleTerm<cr>", { desc = "Bật/tắt terminal" })

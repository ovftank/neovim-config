local keymap = vim.keymap

keymap.set("n", "<A-t>", "<cmd>ToggleTerm<cr>", { desc = "toggle term" })
keymap.set("t", "<A-t>", "<C-\\><C-n><cmd>ToggleTerm<cr>", { desc = "toggle term" })

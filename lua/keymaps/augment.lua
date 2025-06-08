local map = vim.keymap.set

map("n", "<C-A-s>", ":AugmentSignin<CR>", { desc = "dang nhap augment" })
map("n", "<C-A-t>", ":AugmentStatus<CR>", { desc = "trang thai augment" })
map("n", "<C-A-j>", ":AugmentLoginJSON<CR>", { desc = "login voi JSON tu clipboard" })
map("n", "<C-A-d>", ":AugmentTokenDirect ", { desc = "gui code truc tiep" })

return {}

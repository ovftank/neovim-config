local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


keymap("n", "<C-Up>", ":m .-2<CR>==", opts)
keymap("n", "<C-Down>", ":m .+1<CR>==", opts)
keymap("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", opts)


keymap({ "n", "v", "i" }, "<C-s>", "<Esc>:w<CR>", opts)
keymap({ "n", "v", "i" }, "<C-z>", "<Esc>u", opts)
keymap({ "n", "v", "i" }, "<C-S-z>", "<Esc><C-r>", opts)
keymap({ "n", "v", "i" }, "<C-a>", "<Esc>ggVG", opts)
keymap("n", "<C-v>", "i<C-r>+", opts)
keymap("v", "<C-v>", '"+P', opts)
keymap("i", "<C-v>", "<C-r>+", opts)


keymap({ "n", "v", "i" }, "<A-n>", function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end, opts)


keymap("n", "<S-Home>", "v^", opts)
keymap("n", "<S-End>", "v$", opts)
keymap("i", "<S-Home>", "<Esc>v^", opts)
keymap("i", "<S-End>", "<Esc>v$", opts)
keymap("v", "<S-Home>", "^", opts)
keymap("v", "<S-End>", "$", opts)

keymap({ "n", "v", "i" }, "<C-l>", "<Esc>V", opts)


keymap({ "n", "i" }, "<C-c>", "<Esc>0vg_y<Esc>", opts)
keymap({ "n", "i" }, "<C-x>", "<Esc>0vg_d<Esc>", opts)
keymap("v", "<C-c>", '"+y', opts)
keymap("v", "<C-x>", '"+x', opts)


keymap("n", "<S-Up>", "vk", opts)
keymap("n", "<S-Down>", "vj", opts)
keymap("n", "<S-Left>", "vh", opts)
keymap("n", "<S-Right>", "vl", opts)

keymap("i", "<S-Up>", "<Esc>vk", opts)
keymap("i", "<S-Down>", "<Esc>vj", opts)
keymap("i", "<S-Left>", "<Esc>vh", opts)
keymap("i", "<S-Right>", "<Esc>vl", opts)

keymap("v", "<S-Up>", "k", opts)
keymap("v", "<S-Down>", "j", opts)
keymap("v", "<S-Left>", "h", opts)
keymap("v", "<S-Right>", "l", opts)


local ts_keymaps = {
    incremental_selection = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
    },
}

return {
    ts_keymaps = ts_keymaps
}
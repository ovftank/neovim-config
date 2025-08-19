local keymap = vim.keymap

keymap.set({ "n", "v", "i" }, "<C-s>", "<Esc>:w!<CR>", { desc = "save" })

keymap.set("v", "<C-c>", [["+y]], { desc = "copy" })
keymap.set("c", "<C-v>", '<C-r>+', { desc = "paste" })
keymap.set("n", "<C-v>", [["+p]], { desc = "paste" })
keymap.set("v", "<C-v>", [["+p]], { desc = "paste" })
keymap.set("i", "<C-v>", "<C-r>+", { desc = "paste" })
keymap.set("v", "<C-x>", [["+d]], { desc = "cut" })

keymap.set("n", "<C-a>", "ggVG", { desc = "select all" })
keymap.set("v", "<C-a>", "ggVG", { desc = "select all" })
keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "select all" })

keymap.set("i", "<S-Up>", "<C-o>v<Up>", { desc = "select up" })
keymap.set("i", "<S-Down>", "<C-o>v<Down>", { desc = "select down" })
keymap.set("i", "<S-Left>", "<C-o>v<Left>", { desc = "select left" })
keymap.set("i", "<S-Right>", "<C-o>v<Right>", { desc = "select right" })

keymap.set("n", "<C-z>", "u", { desc = "undo" })
keymap.set("i", "<C-z>", "<Esc>ui", { desc = "undo" })
keymap.set("v", "<C-z>", "<Esc>u", { desc = "undo" })

keymap.set("n", "<C-S-z>", "<C-r>", { desc = "redo" })
keymap.set("i", "<C-S-z>", "<Esc><C-r>i", { desc = "redo" })
keymap.set("v", "<C-S-z>", "<Esc><C-r>", { desc = "redo" })

keymap.set("s", "<BS>", "<C-g>c", { desc = "del selection" })
keymap.set("v", "<BS>", "di", { desc = "del text" })

keymap.set("i", "<C-BS>", "<C-w>", { desc = "del word" })
keymap.set("n", "<C-BS>", "<C-w>", { desc = "del word" })
keymap.set("c", "<C-BS>", "<C-w>", { desc = "del word" })

keymap.set("n", "<C-u>", "dd", { desc = "del line" })
keymap.set("i", "<C-u>", "<Esc>ddi", { desc = "del line" })
keymap.set("v", "<C-u>", "<Esc>dd", { desc = "del line" })

keymap.set("n", "<C-Down>", ":m .+1<CR>==", { desc = "move down" })
keymap.set("n", "<C-Up>", ":m .-2<CR>==", { desc = "move up" })
keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "move down" })
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "move up" })
keymap.set("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", { desc = "move down" })
keymap.set("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", { desc = "move up" })

keymap.set("n", "n", "nzzzv", { desc = "next search" })
keymap.set("n", "N", "Nzzzv", { desc = "prev search" })

keymap.set("n", "<Space>", ":set relativenumber!<CR>", { desc = "toggle relnum", silent = true })

keymap.set("n", "<C-<>", "<<", { desc = "indent left" })
keymap.set("n", "<C->>", ">>", { desc = "indent right" })
keymap.set("v", "<C-<>", "<gv", { desc = "indent left" })
keymap.set("v", "<C->>", ">gv", { desc = "indent right" })
keymap.set("i", "<C-<>", "<C-d>", { desc = "indent left" })
keymap.set("i", "<C->>", "<C-t>", { desc = "indent right" })

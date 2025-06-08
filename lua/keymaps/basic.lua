local M = {}

local keymap = vim.keymap

keymap.set({ "n", "v", "i" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

keymap.set("v", "<C-c>", [["+y]], { desc = "Copy" })
keymap.set({ "n", "v", "i" }, "<C-v>", [["+p]], { desc = "Paste" })
keymap.set("v", "<C-x>", [["+d]], { desc = "Cut" })

keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
keymap.set("v", "<C-a>", "ggVG", { desc = "Select all" })
keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "Select all" })

keymap.set("i", "<S-Up>", "<C-o>v<Up>", { desc = "Select up from insert" })
keymap.set("i", "<S-Down>", "<C-o>v<Down>", { desc = "Select down from insert" })
keymap.set("i", "<S-Left>", "<C-o>v<Left>", { desc = "Select left from insert" })
keymap.set("i", "<S-Right>", "<C-o>v<Right>", { desc = "Select right from insert" })

keymap.set("n", "<C-z>", "u", { desc = "Undo" })
keymap.set("i", "<C-z>", "<Esc>ui", { desc = "Undo" })
keymap.set("v", "<C-z>", "<Esc>u", { desc = "Undo" })

keymap.set("n", "<C-S-z>", "<C-r>", { desc = "Redo" })
keymap.set("i", "<C-S-z>", "<Esc><C-r>i", { desc = "Redo" })
keymap.set("v", "<C-S-z>", "<Esc><C-r>", { desc = "Redo" })

keymap.set("s", "<BS>", "<C-g>c", { desc = "Delete selection" })
keymap.set("v", "<BS>", "d", { desc = "Xóa text được chọn" })

keymap.set("i", "<C-BS>", "<C-w>", { desc = "Xóa từ bên trái" })
keymap.set("i", "<C-h>", "<C-w>", { desc = "Xóa từ bên trái (alternative)" })

keymap.set("n", "<C-u>", "dd", { desc = "Xóa dòng hiện tại" })
keymap.set("i", "<C-u>", "<Esc>ddi", { desc = "Xóa dòng hiện tại" })
keymap.set("v", "<C-u>", "<Esc>dd", { desc = "Xóa dòng hiện tại" })

keymap.set("n", "<C-Down>", ":m .+1<CR>==", { desc = "Di chuyển dòng xuống" })
keymap.set("n", "<C-Up>", ":m .-2<CR>==", { desc = "Di chuyển dòng lên" })
keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Di chuyển dòng xuống" })
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Di chuyển dòng lên" })
keymap.set("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Di chuyển dòng xuống" })
keymap.set("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Di chuyển dòng lên" })

keymap.set("n", "n", "nzzzv", { desc = "Tìm tiếp theo" })
keymap.set("n", "N", "Nzzzv", { desc = "Tìm trước đó" })

keymap.set("n", "<Space>", ":set relativenumber!<CR>", { desc = "Toggle relativenumber", silent = true })

keymap.set("n", "<C-[>", "<<", { desc = "Indent left" })
keymap.set("n", "<C-]>", ">>", { desc = "Indent right" })
keymap.set("v", "<C-[>", "<gv", { desc = "Indent left" })
keymap.set("v", "<C-]>", ">gv", { desc = "Indent right" })
keymap.set("i", "<C-[>", "<C-d>", { desc = "Indent left" })
keymap.set("i", "<C-]>", "<C-t>", { desc = "Indent right" })

return M

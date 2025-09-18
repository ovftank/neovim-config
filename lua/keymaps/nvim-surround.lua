local keymap = vim.keymap

keymap.set("v", '"', '<Plug>(nvim-surround-visual)"', { desc = "wrap selection with quotes" })
keymap.set(
    "v",
    "'",
    "<Plug>(nvim-surround-visual)'",
    { desc = "wrap selection with single quotes" }
)
keymap.set("v", "`", "<Plug>(nvim-surround-visual)`", { desc = "wrap selection with backticks" })
keymap.set("v", "(", "<Plug>(nvim-surround-visual))", { desc = "wrap selection with parentheses" })
keymap.set("v", "[", "<Plug>(nvim-surround-visual)]", { desc = "wrap selection with brackets" })
keymap.set("v", "{", "<Plug>(nvim-surround-visual)}", { desc = "wrap selection with braces" })
keymap.set(
    "v",
    "<",
    "<Plug>(nvim-surround-visual)>",
    { desc = "wrap selection with angle brackets" }
)
keymap.set("v", "t", "<Plug>(nvim-surround-visual)t", { desc = "wrap selection with HTML tag" })

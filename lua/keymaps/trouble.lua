local keymap = vim.keymap

keymap.set(
    { "n", "i", "v" },
    "<C-g>",
    "<cmd>Trouble diagnostics toggle<cr>",
    { desc = "toggle trouble diagnostics" }
)

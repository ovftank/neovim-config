return {
  "olrtg/nvim-emmet",
  ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
  config = function()
    local keymap = vim.keymap
    keymap.set({ "n", "v" }, "<A-e>", require("nvim-emmet").wrap_with_abbreviation, { desc = "emmet wrap" })
  end,
}

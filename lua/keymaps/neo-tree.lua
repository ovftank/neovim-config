local keymap = vim.keymap

keymap.set({ "n", "i", "v", "x", "s", "o", "t", "c" }, "<C-b>", "<cmd>Neotree toggle<CR>", { desc = "toggle tree" })
keymap.set({ "n", "i", "v", "x", "s", "o", "t", "c" }, "<C-S-b>", "<cmd>Neotree reveal<CR>", { desc = "reveal file" })

local M = {}

M.handle_popup_input = function(args)
  vim.keymap.set("i", "<C-BS>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>", true, true, true), "i", true)
  end, { noremap = true, buffer = args.bufnr })
end

M.window_mappings = {
  ["<2-LeftMouse>"] = "open",
  ["<CR>"] = "open",
  ["<ESC>"] = "cancel",
  ["<C-b>"] = "close_window",
  ["<c-n>"] = {
    "add",
    config = {
      show_path = "none",
    },
  },
  ["<c-s-n>"] = "add_directory",
  ["<del>"] = "delete",
  ["<f2>"] = "rename",
  ["<c-c>"] = "copy_to_clipboard",
  ["<c-x>"] = "cut_to_clipboard",
  ["<c-v>"] = "paste_from_clipboard",
  ["<F5>"] = "refresh",
  ["?"] = "show_help",
  ["i"] = "show_file_details",
}

M.filesystem_mappings = {
  ["<C-b>"] = "close_window",
  ["<bs>"] = "navigate_up",
  ["."] = "set_root",
  ["<C-h>"] = "toggle_hidden",
  ["/"] = "fuzzy_finder",
}


return M

local keymap = vim.keymap

keymap.set({ "n", "i", "v", "x", "s", "o", "t", "c" }, "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "toggle tree" })
keymap.set({ "n", "i", "v", "x", "s", "o", "t", "c" }, "<C-S-b>", "<cmd>Neotree reveal<cr>", { desc = "reveal file" })

local M = {}

M.window_mappings = {
  ["<2-LeftMouse>"] = "open",
  ["<cr>"] = "open",
  ["<esc>"] = "cancel",
  ["<c-b>"] = "close_window",
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
  ["<bs>"] = "navigate_up",
  ["."] = "set_root",
  ["<C-h>"] = "toggle_hidden",
  ["/"] = "fuzzy_finder",
}

M.buffers_mappings = {
  ["<c-b>"] = "close_window",
  ["<del>"] = "delete_buffer",
  ["<cr>"] = "open",
}

M.git_status_mappings = {
  ["<c-b>"] = "close_window",
  ["<del>"] = "delete_buffer",
  ["<cr>"] = "open",
}

return M

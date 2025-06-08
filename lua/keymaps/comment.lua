local keymap = vim.keymap

keymap.set({ "n", "v", "i" }, "<C-/>", function()
  if vim.fn.mode() == "i" then
    vim.cmd("stopinsert")
    require("Comment.api").toggle.linewise.current()
    vim.cmd("startinsert")
  else
    require("Comment.api").toggle.linewise()
  end
end, { desc = "toggle comment" })

keymap.set("v", "<C-/>", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "toggle comment" })

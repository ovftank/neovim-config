local M = {}

local keymap = vim.keymap

local function setup_lsp_keymaps(ev)
  local opts = { buffer = ev.buf }

  keymap.set("n", "<C-K>", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hiển thị thông tin hover" }))
  keymap.set("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Đổi tên symbol" }))

  keymap.set({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
  keymap.set({ "n", "v", "i" }, "<C-S-i>", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, vim.tbl_extend("force", opts, { desc = "Format code" }))
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = setup_lsp_keymaps,
})

return M

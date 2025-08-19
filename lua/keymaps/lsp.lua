local M = {}

local keymap = vim.keymap

local function setup_lsp_keymaps(ev)
  local opts = { buffer = ev.buf }
  keymap.set("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "rename" }))

  keymap.set({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "code actions" }))
  keymap.set({ "n", "v", "i" }, "<C-S-i>", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = {
          "source.organizeImports"
        },
        diagnostics = {},
      },
    })
    require("conform").format({ async = true, lsp_fallback = true })
  end, vim.tbl_extend("force", opts, { desc = "format & organize imports" }))
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    setup_lsp_keymaps(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.name == "tailwindcss" then
      client.server_capabilities.completionProvider.triggerCharacters = {
        '"', "'", "`", ".", "(", "[", "!", "/", ":", "-"
      }
    end
  end,
})

return M

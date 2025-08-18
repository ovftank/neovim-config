vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    source = "if_many",
    prefix = "●",
    spacing = 4,
    format = function(diagnostic)
      return string.format("%s", diagnostic.message)
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
    format = function(diagnostic)
      return string.format("%s (%s)", diagnostic.message, diagnostic.source)
    end,
  },
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local diagnostics_group = augroup("DiagnosticsConfig", { clear = true })

autocmd({ "CursorHold", "CursorHoldI" }, {
  group = diagnostics_group,
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
      return
    end

    local diagnostics = vim.diagnostic.get(0)
    if #diagnostics > 0 then
      vim.diagnostic.open_float(nil, { focus = false })
    end
  end,
})

autocmd({ "TextChanged", "TextChangedI" }, {
  group = diagnostics_group,
  callback = function()
    pcall(function()
      vim.diagnostic.show()
    end)
  end,
})

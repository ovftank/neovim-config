local keymap = vim.keymap

local function safe_require(module)
  local ok, mod = pcall(require, module)
  return ok and mod or nil
end

keymap.set("", "<2-LeftMouse>", function()
  local dap = safe_require("dap")
  if dap then
    dap.toggle_breakpoint()
  end
end, { desc = "toggle breakpoint" })

keymap.set("n", "<2-LeftMouse>", function()
  local dapui = safe_require("dapui")
  if dapui then
    local widgets = require("dap.ui.widgets")
    if widgets then
      widgets.hover()
    end
  end
end, { desc = "debug expand/hover", buffer = true })

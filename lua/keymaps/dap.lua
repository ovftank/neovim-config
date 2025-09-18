local keymap = vim.keymap

local function toggle_breakpoint()
    local dap = require("dap")
    local mouse_pos = vim.fn.getmousepos()
    vim.fn.setpos(".", { 0, mouse_pos.line, mouse_pos.column, 0 })
    dap.toggle_breakpoint()
end

keymap.set(
    "n",
    "<RightMouse>",
    toggle_breakpoint,
    { desc = "debug: toggle breakpoint with right click" }
)
keymap.set(
    "i",
    "<RightMouse>",
    toggle_breakpoint,
    { desc = "debug: toggle breakpoint with right click" }
)
keymap.set(
    "v",
    "<RightMouse>",
    toggle_breakpoint,
    { desc = "debug: toggle breakpoint with right click" }
)

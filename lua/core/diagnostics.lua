vim.diagnostic.config({
    virtual_text = {
        enabled = true,
        source = "if_many",
        prefix = "",
        spacing = 4,
        format = function(diagnostic)
            return string.format("%s", diagnostic.message)
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        enabled = false,
    },
})

local signs = {
    { name = "DiagnosticSignError", text = "󰅚 " },
    { name = "DiagnosticSignWarn", text = "󰀦 " },
    { name = "DiagnosticSignHint", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local lspconfig = require("lspconfig")

return lspconfig.cssls.setup({
    filetypes = { "css" },
    root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1]),
    settings = {
        css = {
            validate = true,
            lint = {
                unknownAtRules = "ignore",
            },
        },
    },
})

local lspconfig = require("lspconfig")

return lspconfig.html.setup({
    filetypes = { "html" },
    root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1]),
    settings = {
        html = {
            format = {
                templating = true,
                wrapLineLength = 120,
                wrapAttributes = "auto",
            },
            hover = {
                documentation = true,
                references = true,
            },
            validate = {
                scripts = true,
                styles = true,
            },
            suggest = {
                html5 = true,
            },
        },
    },
})

local lspconfig = require("lspconfig")

return lspconfig.eslint.setup({
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
    },
    root_dir = require("lspconfig.util").root_pattern(
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        "package.json"
    ),
    settings = {},
})

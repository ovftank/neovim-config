local lspconfig = require("lspconfig")

return lspconfig.tailwindcss.setup({
    filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "astro",
        "markdown",
    },
    init_options = {
        userLanguages = {
            eelixir = "html-eex",
            eruby = "erb",
            templ = "html",
        },
    },
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
            },
            validate = true,
            colorDecorators = true,
            suggestions = true,
            hovers = true,
            codeActions = true,
            showPixelEquivalents = true,
            includeLanguages = {
                typescript = "javascript",
                typescriptreact = "javascript",
            },
        },
    },
    root_dir = require("lspconfig.util").root_pattern(
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "tailwind.config.cts",
        "tailwind.config.mts",
        "postcss.config.js",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "postcss.config.ts",
        "postcss.config.cts",
        "postcss.config.mts",
        "package.json",
        "node_modules",
        ".git"
    ),
})

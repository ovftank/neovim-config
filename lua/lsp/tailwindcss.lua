return {
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
    root_markers = {
        "tailwind.config.js",
        "tailwind.config.ts",
        "package.json",
        "node_modules",
    },
}

local lspconfig = require("lspconfig")

return lspconfig.emmet_language_server.setup({
    filetypes = {
        "html",
        "javascriptreact",
        "typescriptreact",
        "vue",
    },
    init_options = {
        includeLanguages = {
            javascriptreact = "html",
            typescriptreact = "html",
            vue = "html",
        },
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = false,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = true,
        syntaxProfiles = {},
        variables = {},
    },
})

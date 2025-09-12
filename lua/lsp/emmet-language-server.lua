local lspconfig = require("lspconfig")

return lspconfig.emmet_language_server.setup({
    filetypes = {
        "html",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "css",
    },
    init_options = {
        includeLanguages = {},
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

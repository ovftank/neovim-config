return {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    root_markers = { "tsconfig.json", "package.json", ".git" },
    init_options = {
        hostInfo = "neovim",
        preferences = {
            disableSuggestions = false,
            quotePreference = "auto",
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            importModuleSpecifierPreference = "non-relative",
            importModuleSpecifierEnding = "auto",
            includePackageJsonAutoImports = "auto",
            allowIncompleteCompletions = true,
            includeCompletionsWithSnippetText = true,
            includeCompletionsWithInsertText = true,
            includeAutomaticOptionalChainCompletions = true,
            includeCompletionsWithClassMemberSnippets = true,
            includeCompletionsWithObjectLiteralMethodSnippets = true,
            useLabelDetailsInCompletionEntries = true,
            jsxAttributeCompletionStyle = "auto",
            interactiveInlayHints = true,
            allowRenameOfImportPath = true,
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
            completions = {
                completeFunctionCalls = true,
            },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true, showOnAllFunctions = true },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
            completions = {
                completeFunctionCalls = true,
            },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true, showOnAllFunctions = true },
        },
    },
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}

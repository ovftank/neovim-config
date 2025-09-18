return {
    filetypes = { "css" },
    settings = {
        css = {
            validate = true,
            lint = {
                unknownAtRules = "ignore",
            },
            completion = {
                completePropertyWithSemicolon = true,
                triggerPropertyValueCompletion = true,
            },
            hover = {
                documentation = true,
                references = true,
            },
        },
    },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                },
            },
        },
    },
}

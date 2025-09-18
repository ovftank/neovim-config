return {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "recommended",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                diagnosticMode = "workspace",

                inlayHints = {
                    variableTypes = true,
                    callArgumentNames = true,
                    callArgumentNamesMatching = false,
                    functionReturnTypes = true,
                    genericTypes = true,
                },

                autoFormatStrings = true,

                useTypingExtensions = true,

                diagnosticSeverityOverrides = {
                    reportUnusedVariable = "warning",
                    reportUnusedImport = "warning",
                    reportPrivateUsage = "warning",
                    reportMissingTypeStubs = "warning",
                    reportMissingModuleDocstring = "none",
                    reportMissingFunctionDocstring = "none",
                },
            },
        },
    },
}

return {
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
                url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
            validate = true,
            format = {
                enable = true,
                singleQuote = false,
                bracketSpacing = true,
            },
            hover = true,
            completion = true,
        },
    },
}

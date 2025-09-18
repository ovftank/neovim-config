return {
    filetypes = { "html" },
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
}

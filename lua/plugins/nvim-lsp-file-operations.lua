return {
    "antosha417/nvim-lsp-file-operations",
    opts = {
        debug = false,
        operations = {
            willRenameFiles = true,
            didRenameFiles = true,
            willCreateFiles = true,
            didCreateFiles = true,
            willDeleteFiles = true,
            didDeleteFiles = true,
        },
        timeout_ms = 10000,
    },
}

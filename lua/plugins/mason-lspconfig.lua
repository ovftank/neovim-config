return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "jsonls",
            "basedpyright",
            "cssls",
            "emmet_language_server",
            "eslint",
            "html",
            "tailwindcss",
            "ts_ls",
            "yamlls",
        },
        automatic_enable = false,
    },
}

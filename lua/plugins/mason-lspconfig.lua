return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            "basedpyright",
            "cssls",
            "emmet_language_server",
            "eslint",
            "html",
            "jsonls",
            "tailwindcss",
            "ts_ls",
            "yamlls",
        },
        automatic_installation = true,
        automatic_enable = false,
    },
    config = function(_, opts)
        require("keymaps.lsp")
        require("mason-lspconfig").setup(opts)

        require("lsp.basedpyright")
        require("lsp.cssls")
        require("lsp.emmet-language-server")
        require("lsp.eslint")
        require("lsp.html")
        require("lsp.jsonls")
        require("lsp.tailwindcss")
        require("lsp.ts_ls")
        require("lsp.yamlls")
    end,
}

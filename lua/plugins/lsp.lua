return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        require("mason-lspconfig").setup()
        require("keymaps.lsp")
        local jsonls_config = require("lsp.jsonls")
        vim.lsp.config("jsonls", jsonls_config)

        local basedpyright_config = require("lsp.basedpyright")
        vim.lsp.config("basedpyright", basedpyright_config)

        local cssls_config = require("lsp.cssls")
        vim.lsp.config("cssls", cssls_config)

        local emmet_config = require("lsp.emmet-language-server")
        vim.lsp.config("emmet_language_server", emmet_config)

        local eslint_config = require("lsp.eslint")
        vim.lsp.config("eslint", eslint_config)

        local html_config = require("lsp.html")
        vim.lsp.config("html", html_config)

        local tailwindcss_config = require("lsp.tailwindcss")
        vim.lsp.config("tailwindcss", tailwindcss_config)

        local ts_ls_config = require("lsp.ts_ls")
        vim.lsp.config("ts_ls", ts_ls_config)

        local yamlls_config = require("lsp.yamlls")
        vim.lsp.config("yamlls", yamlls_config)

        vim.lsp.enable("basedpyright")
        vim.lsp.enable("cssls")
        vim.lsp.enable("emmet_language_server")
        vim.lsp.enable("eslint")
        vim.lsp.enable("html")
        vim.lsp.enable("jsonls")
        vim.lsp.enable("tailwindcss")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("yamlls")
    end,
}

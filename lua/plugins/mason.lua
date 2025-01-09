return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
                keymaps = require("core.keymap").mason_keymaps,
                border = "rounded",
                width = 0.8,
                height = 0.9,
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "pylsp",
                "ts_ls",
                "html",
                "cssls",
                "jsonls",
            },
            automatic_installation = true,
        },
    },
}
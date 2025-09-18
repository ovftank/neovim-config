return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            "autoflake",
            "black",
            "debugpy",
            "isort",
            "js-debug-adapter",
            "prettier",
            "pylint",
        },
        auto_update = true,
        run_on_start = true,
        start_delay = 1000,
        integrations = {
            ["mason-lspconfig"] = true,
        },
    },
}

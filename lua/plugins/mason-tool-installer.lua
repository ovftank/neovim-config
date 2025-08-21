return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            "prettierd",
            "pylint",
            "black",
            "isort",
            "autoflake",
        },
        auto_update = true,
        run_on_start = true,
        start_delay = 1000,
        integrations = {
            ["mason-lspconfig"] = true,
        },
    },
}

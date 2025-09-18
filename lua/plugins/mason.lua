return {
    "mason-org/mason.nvim",
    opts = {
        ui = {
            border = "rounded",
            width = 0.8,
            height = 0.9,
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
        max_concurrent_installers = 4,
    },
}

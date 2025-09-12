return {
    "hiphish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        strategy = {
            [""] = "rainbow-delimiters.strategy.global",
            vim = "rainbow-delimiters.strategy.local",
            html = "rainbow-delimiters.strategy.local",
            markdown = "rainbow-delimiters.strategy.local",
        },
        query = {
            [""] = "rainbow-delimiters",
            javascript = "rainbow-delimiters",
            typescript = "rainbow-delimiters",
            javascriptreact = "rainbow-delimiters",
            typescriptreact = "rainbow-delimiters",
            python = "rainbow-delimiters",
            css = "rainbow-delimiters",
            json = "rainbow-delimiters",
            yaml = "rainbow-delimiters",
        },
        priority = {
            [""] = 110,
            lua = 210,
        },
        highlight = {
            "RainbowDelimiterBlue",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
        },
        blacklist = {},
    },
    config = function(_, opts)
        require("rainbow-delimiters.setup").setup(opts)
    end,
}

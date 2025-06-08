return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          less = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters = {
          prettier = {
            options = {
              ft_parsers = {
                javascript = "babel",
                javascriptreact = "babel",
                typescript = "typescript",
                typescriptreact = "typescript",
              },
            },
          },
        },
      })
    end,
  },
}

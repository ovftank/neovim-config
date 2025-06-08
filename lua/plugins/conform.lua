return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "autopep8" },
          javascript = { "eslint_d", "prettier" },
          javascriptreact = { "eslint_d", "prettier" },
          typescript = { "eslint_d", "prettier" },
          typescriptreact = { "eslint_d", "prettier" },
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
          astro = { "prettier" },
        },
        default_format_opts = {
          timeout_ms = 3000,
          lsp_format = "fallback",
        },
        format_on_save = {
          timeout_ms = 3000,
          lsp_format = "fallback",
          async = false,
        },
        notify_on_error = true,
        notify_no_formatters = true,
        formatters = {
        },
      })
    end,
  },
}

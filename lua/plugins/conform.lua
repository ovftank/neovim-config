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
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          astro = { "prettier" },
        },
        default_format_opts = {
          timeout_ms = 1000,
          lsp_format = "fallback",
          stop_after_first = true,
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "fallback",
          async = false,
          stop_after_first = true,
        },
        notify_on_error = false,
        notify_no_formatters = false,
        formatters = {
          prettier = {
            timeout_ms = 800,
          },
        },
      })
    end,
  },
}

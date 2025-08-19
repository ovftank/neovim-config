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
          javascript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier", "injected" },
          astro = { "prettier" },
        },
        default_format_opts = {
          timeout_ms = 1000,
          lsp_format = "prefer",
          stop_after_first = true,
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "prefer",
          async = false,
          stop_after_first = true,
        },
        notify_on_error = false,
        notify_no_formatters = false,
        formatters = {
          prettier = {
            timeout_ms = 800,
            prepend_args = {
              "--single-quote",
              "--trailing-comma=none",
              "--tab-width=4",
              "--print-width=999999999",
              "--semi",
              "--end-of-line=crlf",
              "--html-whitespace-sensitivity=css",
              "--jsx-single-quote",
              "--require-config=false",
            },
          },
          injected = {
            options = {
              ignore_errors = true,
              lang_to_formatters = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                js = { "prettier" },
                ts = { "prettier" },
                ["javascriptreact"] = { "prettier" },
                ["typescriptreact"] = { "prettier" },
                python = { "isort", "autopep8" },
                py = { "isort", "autopep8" },
                lua = { "stylua" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                bash = { "shfmt" },
                sh = { "shfmt" },
              },
            },
          },
        },
      })
    end,
  },
}

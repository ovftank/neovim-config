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
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          jsonc = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd", "injected" },
          astro = { "prettierd" },
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
          isort = {
            prepend_args = { "--line-ending", "auto" },
          },
          injected = {
            options = {
              ignore_errors = true,
              lang_to_formatters = {
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                js = { "prettierd" },
                ts = { "prettierd" },
                ["javascriptreact"] = { "prettierd" },
                ["typescriptreact"] = { "prettierd" },
                python = { "isort", "autopep8" },
                py = { "isort", "autopep8" },
                lua = { "stylua" },
                css = { "prettierd" },
                html = { "prettierd" },
                json = { "prettierd" },
                yaml = { "prettierd" },
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

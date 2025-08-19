return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d" },
      python = { "pylint" },
      json = { "jsonlint" },
      css = { "stylelint" },
      html = { "htmlhint" },
      markdown = { "markdownlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      group = lint_augroup,
      callback = function()
        vim.defer_fn(function()
          lint.try_lint()
        end, 200)
      end,
    })
  end,
}

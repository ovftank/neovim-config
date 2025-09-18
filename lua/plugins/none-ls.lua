return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local null_ls = require("null-ls")

        local sources = {
            null_ls.builtins.formatting.prettier.with({
                prefer_local = "node_modules/.bin",
                extra_args = {
                    "--end-of-line",
                    "crlf",
                    "--html-whitespace-sensitivity",
                    "css",
                    "--jsx-single-quote",
                    "true",
                    "--print-width",
                    "999999999",
                    "--semi",
                    "true",
                    "--single-quote",
                    "true",
                    "--tab-width",
                    "4",
                    "--trailing-comma",
                    "none",
                    "--embedded-language-formatting",
                    "auto",
                },
                filetypes = {
                    "javascript",
                    "typescript",
                    "javascriptreact",
                    "typescriptreact",
                    "json",
                    "html",
                    "css",
                    "markdown",
                    "yaml",
                },
            }),
            null_ls.builtins.formatting.black.with({
                extra_args = {
                    "--skip-string-normalization",
                },
            }),
            null_ls.builtins.formatting.isort.with({
                extra_args = {
                    "--profile=black",
                    "--line-length=88",
                    "--multi-line=3",
                    "--trailing-comma",
                    "--force-grid-wrap=0",
                    "--use-parentheses",
                    "--ensure-newline-before-comments",
                },
            }),
        }

        if vim.fn.isdirectory(".git") == 1 then
            table.insert(sources, null_ls.builtins.code_actions.gitsigns)
        end

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            debug = false,
            sources = sources,
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                filter = function(formatter)
                                    return formatter.name == "null-ls"
                                end,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}

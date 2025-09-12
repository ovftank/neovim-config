local keymap = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        keymap({ "n", "v", "i" }, "<F1>", function()
            local mode = vim.fn.mode()
            if mode == "i" then
                vim.cmd("stopinsert")
            elseif mode == "t" then
                vim.cmd("stopinsert")
            end
            require("telescope.builtin").lsp_references({
                attach_mappings = function(_, map)
                    local actions = require("telescope.actions")
                    map("i", "<Esc>", actions.close)
                    map("n", "<Esc>", actions.close)
                    map("i", "<C-BS>", function()
                        vim.api.nvim_feedkeys(
                            vim.api.nvim_replace_termcodes("<C-w>", true, true, true),
                            "i",
                            true
                        )
                    end)
                    map("i", "<C-a>", function(_)
                        vim.api.nvim_feedkeys(
                            vim.api.nvim_replace_termcodes("<Esc>^llv$<C-g>", true, true, true),
                            "n",
                            true
                        )
                    end)
                    return true
                end,
            })
        end, opts)
        keymap("n", "<F3>", "<plug>(matchup-%)", { desc = "Jump to matching delimiter" })
        keymap("i", "<F3>", function()
            vim.cmd("stopinsert")
            vim.cmd("normal! <plug>(matchup-%)")
        end, { desc = "Jump to matching delimiter" })

        keymap({ "n", "v", "i" }, "<C-.>", function()
            local mode = vim.fn.mode()
            if mode == "i" then
                vim.cmd("stopinsert")
            elseif mode == "t" then
                vim.cmd("stopinsert")
            end
            vim.lsp.buf.code_action()
        end, opts)
        keymap({ "n", "v", "i" }, "<F2>", function()
            local mode = vim.fn.mode()
            if mode == "i" then
                vim.cmd("stopinsert")
            elseif mode == "t" then
                vim.cmd("stopinsert")
            end

            local Input = require("nui.input")
            local event = require("nui.utils.autocmd").event

            local current_name = vim.fn.expand("<cword>")

            local input = Input({
                position = {
                    row = "20%",
                    col = "50%",
                },
                size = {
                    width = 30,
                    height = 1,
                },
                border = {
                    style = "rounded",
                    text = {
                        top = " 󰑕 rename symbol ",
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                },
            }, {
                prompt = "> ",
                default_value = current_name,
                on_close = function() end,
                on_submit = function(value)
                    if not value or value == "" then
                        return
                    end

                    if value == current_name then
                        return
                    end

                    vim.lsp.buf.rename(value)
                end,
            })

            input:mount()

            input:map("i", "<Esc>", function()
                input:unmount()
            end, { noremap = true })

            input:map("n", "<Esc>", function()
                input:unmount()
            end, { noremap = true })

            input:map("i", "<C-BS>", function()
                local line = vim.api.nvim_get_current_line()
                local col = vim.api.nvim_win_get_cursor(0)[2]

                local start = col
                while start > 0 and line:sub(start, start):match("[%w_]") do
                    start = start - 1
                end

                if start < col then
                    vim.api.nvim_set_current_line(line:sub(1, start) .. line:sub(col + 1))
                    vim.api.nvim_win_set_cursor(0, { 1, start })
                else
                    local prev_start = col
                    while prev_start > 0 and line:sub(prev_start, prev_start):match("%s") do
                        prev_start = prev_start - 1
                    end
                    while prev_start > 0 and line:sub(prev_start, prev_start):match("[%w_]") do
                        prev_start = prev_start - 1
                    end
                    vim.api.nvim_set_current_line(line:sub(1, prev_start) .. line:sub(col + 1))
                    vim.api.nvim_win_set_cursor(0, { 1, prev_start })
                end
            end, { noremap = true })

            input:map("i", "<C-a>", function()
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes("<Esc>^llv$<C-g>", true, true, true),
                    "n",
                    true
                )
            end, { noremap = true })

            vim.defer_fn(function()
                vim.cmd("startinsert!")
            end, 10)

            input:on(event.BufLeave, function()
                input:unmount()
            end)
        end, opts)

        keymap({ "n", "v", "i" }, "<C-S-i>", function()
            local mode = vim.fn.mode()
            if mode == "i" then
                vim.cmd("stopinsert")
            elseif mode == "t" then
                vim.cmd("stopinsert")
            end

            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})

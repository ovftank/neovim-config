if not pcall(require, "telescope") then
    return
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local keymap = vim.keymap

keymap.set({ "n", "v", "i", "t" }, "<C-t>", function()
    local mode = vim.fn.mode()
    if mode == "i" then
        vim.cmd("stopinsert")
    elseif mode == "t" then
        vim.cmd("stopinsert")
    end
    builtin.find_files({
        attach_mappings = function(prompt_bufnr, map)
            map("i", "<Esc>", actions.close)
            map("n", "<Esc>", actions.close)
            map("i", "<Right>", function()
                actions.select_vertical(prompt_bufnr)
            end)
            map("n", "<Right>", function()
                actions.select_vertical(prompt_bufnr)
            end)
            map("i", "%", function()
                vim.cmd("stopinsert")
                builtin.live_grep({
                    attach_mappings = function(_, map_grep)
                        map_grep("i", "<Esc>", actions.close)
                        map_grep("n", "<Esc>", actions.close)
                        map_grep("i", "<C-BS>", function()
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<C-w>", true, true, true),
                                "i",
                                true
                            )
                        end)
                        map_grep("i", "<C-a>", function(_)
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<Esc>^llv$<C-g>", true, true, true),
                                "n",
                                true
                            )
                        end)
                        return true
                    end,
                })
            end)
            map("i", "@", function()
                vim.cmd("stopinsert")
                builtin.lsp_workspace_symbols({
                    attach_mappings = function(_, map_symbols)
                        map_symbols("i", "<Esc>", actions.close)
                        map_symbols("n", "<Esc>", actions.close)
                        map_symbols("i", "<C-BS>", function()
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<C-w>", true, true, true),
                                "i",
                                true
                            )
                        end)
                        map_symbols("i", "<C-a>", function(_)
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<Esc>^llv$<C-g>", true, true, true),
                                "n",
                                true
                            )
                        end)
                        return true
                    end,
                })
            end)
            map("i", ">", function()
                vim.cmd("stopinsert")
                builtin.commands({
                    attach_mappings = function(_, map_commands)
                        map_commands("i", "<Esc>", actions.close)
                        map_commands("n", "<Esc>", actions.close)
                        map_commands("i", "<C-BS>", function()
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<C-w>", true, true, true),
                                "i",
                                true
                            )
                        end)
                        map_commands("i", "<C-a>", function(_)
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<Esc>^llv$<C-g>", true, true, true),
                                "n",
                                true
                            )
                        end)
                        return true
                    end,
                })
            end)
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
end, { desc = "find files" })

keymap.set({ "n", "v", "i", "t" }, "<C-f>", function()
    local mode = vim.fn.mode()
    if mode == "i" then
        vim.cmd("stopinsert")
    elseif mode == "t" then
        vim.cmd("stopinsert")
    end
    builtin.current_buffer_fuzzy_find({
        attach_mappings = function(_, map)
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
end, { desc = "fuzzy find in buffer" })

keymap.set({ "n", "v", "i", "t" }, "<C-S-f>", function()
    local mode = vim.fn.mode()
    if mode == "i" then
        vim.cmd("stopinsert")
    elseif mode == "t" then
        vim.cmd("stopinsert")
    end
    builtin.live_grep({
        attach_mappings = function(_, map)
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
end, { desc = "live grep" })

keymap.set({ "n", "v", "i", "t" }, "<F12>", function()
    local mode = vim.fn.mode()
    if mode == "i" then
        vim.cmd("stopinsert")
    elseif mode == "t" then
        vim.cmd("stopinsert")
    end
    builtin.keymaps({
        attach_mappings = function(_, map)
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
end, { desc = "keymaps" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopePrompt",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()

        vim.keymap.set("i", "<C-v>", "<C-r>+", { buffer = buf, silent = true, desc = "paste" })

        vim.keymap.set("i", "<C-BS>", function()
            vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<C-w>", true, true, true),
                "i",
                true
            )
        end, { buffer = buf, silent = true })

        vim.keymap.set("i", "<C-a>", function()
            vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<Esc>^llv$<C-g>", true, true, true),
                "n",
                true
            )
        end, { buffer = buf, silent = true })
    end,
})

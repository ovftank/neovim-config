local keymap = vim.keymap

keymap.set("n", "<ESC>", function()
    local buffers = vim.api.nvim_list_bufs()
    for _, buf in ipairs(buffers) do
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("gitsigns://") then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end, { desc = "close gitsigns diff" })

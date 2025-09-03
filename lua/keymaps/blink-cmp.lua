if not pcall(require, "blink.cmp") then
    return
end

vim.g.blink_cmp_keymap = {
    preset = "none",
    ["<Tab>"] = {
        function(cmp)
            if cmp.snippet_active() then
                return cmp.accept()
            else
                return cmp.select_and_accept()
            end
        end,
        "snippet_forward",
        "fallback",
    },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-k>"] = { "scroll_documentation_up", "fallback" },
    ["<C-j>"] = { "scroll_documentation_down", "fallback" },
    ["<Esc>"] = { "hide", "fallback" },
}

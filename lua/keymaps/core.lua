local keymap = vim.keymap

keymap.set("n", "q", "<nop>", { desc = "disable record mode" })

keymap.set("n", "<C-s>", "<Cmd>update<CR>", { desc = "save" })
keymap.set("v", "<C-s>", "<Esc><Cmd>update<CR>", { desc = "save" })
keymap.set("i", "<C-s>", "<Cmd>update<CR>", { desc = "save" })

keymap.set("v", "<C-c>", [["+y]], { desc = "copy" })
keymap.set("c", "<C-v>", "<C-r>+", { desc = "paste" })
keymap.set("n", "<C-v>", [["+p]], { desc = "paste from clipboard" })
keymap.set("v", "<C-v>", [["+p]], { desc = "paste from clipboard" })
keymap.set("i", "<C-v>", '<Esc>"+pa', { desc = "paste from clipboard" })
keymap.set("v", "<C-x>", [["+d]], { desc = "cut" })

keymap.set("n", "<C-a>", "gg0VG", { desc = "select all" })
keymap.set("v", "<C-a>", "gg0VG", { desc = "select all" })
keymap.set("i", "<C-a>", "<Esc>gg0VG", { desc = "select all" })

keymap.set("n", "<S-Left>", "vh", { desc = "select left" })
keymap.set("n", "<S-Right>", "vl", { desc = "select right" })
keymap.set("v", "<S-Left>", "h", { desc = "select left" })
keymap.set("v", "<S-Right>", "l", { desc = "select right" })
keymap.set("i", "<S-Left>", "<C-o>v<Left>", { desc = "select left" })
keymap.set("i", "<S-Right>", "<C-o>v<Right>", { desc = "select right" })

keymap.set("n", "<C-S-Left>", "vb", { desc = "select word left" })
keymap.set("n", "<C-S-Right>", "ve", { desc = "select word right" })
keymap.set("v", "<C-S-Left>", "b", { desc = "select word left" })
keymap.set("v", "<C-S-Right>", "e", { desc = "select word right" })
keymap.set("i", "<C-S-Left>", "<C-o>vb", { desc = "select word left" })
keymap.set("i", "<C-S-Right>", "<C-o>ve", { desc = "select word right" })

keymap.set("n", "<S-Up>", "vk", { desc = "select up" })
keymap.set("n", "<S-Down>", "vj", { desc = "select down" })
keymap.set("v", "<S-Up>", "k", { desc = "select up" })
keymap.set("v", "<S-Down>", "j", { desc = "select down" })
keymap.set("i", "<S-Up>", "<C-o>v<Up>", { desc = "select up" })
keymap.set("i", "<S-Down>", "<C-o>v<Down>", { desc = "select down" })

keymap.set("n", "<S-Home>", "v^", { desc = "select to home" })
keymap.set("n", "<S-End>", "vg_", { desc = "select to end" })
keymap.set("v", "<S-Home>", "^", { desc = "select to home" })
keymap.set("v", "<S-End>", "g_", { desc = "select to end" })
keymap.set("i", "<S-Home>", "<C-o>v^", { desc = "select to home" })
keymap.set("i", "<S-End>", "<C-o>vg_", { desc = "select to end" })

keymap.set("n", "<C-z>", "u", { desc = "undo" })
keymap.set("i", "<C-z>", "<ESC>ua", { desc = "undo" })
keymap.set("v", "<C-z>", "<Cmd>undo<CR>", { desc = "undo" })

keymap.set("n", "<C-S-z>", "<C-r>", { desc = "redo" })
keymap.set("i", "<C-S-z>", "<Cmd>redo<CR>", { desc = "redo" })
keymap.set("v", "<C-S-z>", "<Cmd>redo<CR>", { desc = "redo" })

keymap.set("s", "<BS>", "<C-g>c", { desc = "del selection" })
keymap.set("v", "<BS>", [["_di]], { desc = "del text" })

keymap.set("i", "<C-BS>", "<C-w>", { desc = "del word" })
keymap.set("n", "<C-BS>", "<C-w>", { desc = "del word" })
keymap.set("c", "<C-BS>", "<C-w>", { desc = "del word" })

keymap.set("n", "<C-u>", [["_dd]], { desc = "del line" })
keymap.set("i", "<C-u>", '<Cmd>normal! "_dd<CR>', { desc = "del line" })
keymap.set("v", "<C-u>", [["_d]], { desc = "del selection" })

keymap.set("n", "<C-Down>", ":m .+1<CR>==", { desc = "move down" })
keymap.set("n", "<C-Up>", ":m .-2<CR>==", { desc = "move up" })
keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "move down" })
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "move up" })
keymap.set("i", "<C-Down>", "<Cmd>m .+1<CR><Cmd>normal! ==<CR>", { desc = "move down" })
keymap.set("i", "<C-Up>", "<Cmd>m .-2<CR><Cmd>normal! ==<CR>", { desc = "move up" })

keymap.set("n", "n", "nzzzv", { desc = "next search" })
keymap.set("n", "N", "Nzzzv", { desc = "prev search" })

keymap.set(
    { "n", "v" },
    "<Space>",
    ":set relativenumber!<CR>",
    { desc = "toggle relnum", silent = true }
)

keymap.set(
    { "n", "i", "v" },
    "<M-z>",
    "<Cmd>set wrap!<CR>",
    { desc = "toggle line wrap", silent = true }
)

keymap.set("n", "<M-f>", "za", { desc = "toggle fold" })
keymap.set("n", "<M-F>", "zA", { desc = "toggle fold recursively" })

keymap.set("n", "<C-<>", "<<", { desc = "indent left" })
keymap.set("n", "<C->>", ">>", { desc = "indent right" })
keymap.set("v", "<C-<>", "<gv", { desc = "indent left" })
keymap.set("v", "<C->>", ">gv", { desc = "indent right" })
keymap.set("i", "<C-<>", "<C-d>", { desc = "indent left" })
keymap.set("i", "<C->>", "<C-t>", { desc = "indent right" })

keymap.set("n", "<C-Left>", "b", { desc = "word start left" })
keymap.set("n", "<C-Right>", "w", { desc = "word end right" })
keymap.set("i", "<C-Left>", "<C-o>b", { desc = "word start left" })
keymap.set("i", "<C-Right>", "<C-o>w", { desc = "word end right" })
keymap.set("v", "<C-Left>", "b", { desc = "word start left" })
keymap.set("v", "<C-Right>", "w", { desc = "word end right" })

local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
    local current_win = vim.api.nvim_get_current_win()
    if terminal_win and vim.api.nvim_win_is_valid(terminal_win) and current_win == terminal_win then
        vim.api.nvim_win_hide(terminal_win)
        terminal_win = nil
        return
    end

    if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
        vim.api.nvim_set_current_win(terminal_win)
        vim.cmd("startinsert")
        return
    end

    local main_win = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if not buf_name:match("NvimTree") and vim.bo[buf].buftype == "" then
            main_win = win
            break
        end
    end

    if main_win then
        vim.api.nvim_set_current_win(main_win)
    end

    if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
        vim.cmd("belowright split")
        terminal_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
        vim.cmd("startinsert")
        return
    end

    vim.cmd("belowright split | terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
    terminal_win = vim.api.nvim_get_current_win()

    vim.bo[terminal_buf].buflisted = false
    vim.cmd("startinsert")
    vim.api.nvim_create_autocmd("TermClose", {
        buffer = terminal_buf,
        callback = function()
            terminal_buf = nil
            terminal_win = nil
        end,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
        buffer = terminal_buf,
        callback = function()
            vim.cmd("startinsert")
        end,
    })
end

keymap.set({ "n", "i", "v", "t" }, "<M-t>", toggle_terminal, { desc = "toggle terminal" })

keymap.set("n", "<C-/>", function()
    return require("vim._comment").operator() .. "_"
end, { expr = true, desc = "comment line" })

keymap.set("x", "<C-/>", function()
    return require("vim._comment").operator()
end, { expr = true, desc = "comment selection" })

keymap.set("i", "<C-/>", function()
    return "<Cmd>normal " .. require("vim._comment").operator() .. "_<CR>"
end, { expr = true, desc = "comment line" })

keymap.set("n", "<M-e>", ":InlineEdit<CR>", { desc = "inline edit" })
keymap.set("i", "<M-e>", "<Cmd>InlineEdit<CR>", { desc = "inline edit" })
keymap.set("v", "<M-e>", "<Cmd>InlineEdit<CR>", { desc = "inline edit" })

keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })

keymap.set("n", "<M-Left>", "<C-w><", { desc = "resize window left" })
keymap.set("n", "<M-Right>", "<C-w>>", { desc = "resize window right" })
keymap.set("n", "<M-Up>", "<C-w>-", { desc = "resize window up" })
keymap.set("n", "<M-Down>", "<C-w>+", { desc = "resize window down" })

keymap.set("n", "<M-h>", "<C-w>h", { desc = "focus left window" })
keymap.set("n", "<M-l>", "<C-w>l", { desc = "focus right window" })
keymap.set("i", "<M-h>", "<C-o><C-w>h", { desc = "focus left window" })
keymap.set("i", "<M-l>", "<C-o><C-w>l", { desc = "focus right window" })

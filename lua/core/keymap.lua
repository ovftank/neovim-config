local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<S-Up>", "vk", opts)
keymap("n", "<S-Down>", "vj", opts)
keymap("n", "<S-Left>", "vh", opts)
keymap("n", "<S-Right>", "vl", opts)
keymap("i", "<S-Up>", "<Esc>vk", opts)
keymap("i", "<S-Down>", "<Esc>vj", opts)
keymap("i", "<S-Left>", "<Esc>vh", opts)
keymap("i", "<S-Right>", "<Esc>vl", opts)
keymap("v", "<S-Up>", "k", opts)
keymap("v", "<S-Down>", "j", opts)
keymap("v", "<S-Left>", "h", opts)
keymap("v", "<S-Right>", "l", opts)
keymap("n", "<Home>", "^", opts)
keymap("n", "<End>", "$", opts)
keymap("i", "<Home>", "<Esc>^i", opts)
keymap("i", "<End>", "<Esc>$a", opts)
keymap("v", "<S-Home>", "^", opts)
keymap("v", "<S-End>", "$", opts)

keymap("n", "<C-Up>", ":m .-2<CR>==", opts)
keymap("n", "<C-Down>", ":m .+1<CR>==", opts)
keymap("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", opts)

keymap("n", "<C-S-Left>", "<C-w>h", opts)
keymap("n", "<C-S-Down>", "<C-w>j", opts)
keymap("n", "<C-S-Up>", "<C-w>k", opts)
keymap("n", "<C-S-Right>", "<C-w>l", opts)

keymap({ "n", "i" }, "<C-c>", "<Esc>0vg_y<Esc>", opts)
keymap({ "n", "i" }, "<C-x>", "<Esc>0vg_d<Esc>", opts)
keymap("v", "<C-c>", '"+y', opts)
keymap("v", "<C-x>", '"+x', opts)
keymap("v", "<C-v>", '"_dP', opts)
keymap("i", "<C-v>", "<C-r>+", opts)

keymap({ "n", "v", "i" }, "<C-s>", "<Esc>:w<CR>", opts)
keymap({ "n", "v", "i" }, "<C-z>", "<Esc>u", opts)
keymap({ "n", "v", "i" }, "<C-S-z>", "<Esc><C-r>", opts)
keymap({ "n", "v", "i" }, "<C-a>", "<Esc>ggVG", opts)
keymap({ "n", "v", "i" }, "<C-l>", "<Esc>V", opts)
keymap("v", "<BS>", "x", opts)

keymap("n", "<", "<ESC>V<gv", opts)
keymap("n", ">", "<ESC>V>gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<C-w>", ":bd<CR>", opts)
keymap("n", "<C-Tab>", ":bnext<CR>", opts)
keymap("n", "<C-S-Tab>", ":bprevious<CR>", opts)

keymap({ "n", "v", "i" }, "<A-n>", function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end, opts)

local ts_keymaps = {
    incremental_selection = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<Tab>",
    },
    textobjects = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.inner",
        ["ad"] = "@comment.outer",
        ["id"] = "@comment.inner",
    }
}

local lsp_keymaps = {
    goto_definition = "<F1>",
    hover = "K",
    rename = "<F2>",
    code_action = "<C-.>",
    references = "<F4>",
    diagnostic_next = "]d",
    diagnostic_prev = "[d",
    diagnostic_line = "gl",
    format = "<C-S-i>",
}

local telescope_keymaps = {
    lsp_definitions = "<F1>",
    find_files = "<C-t>",
    live_grep = "<C-S-t>",
    close = "<esc>"
}

local mason_keymaps = {
    toggle_package_expand = "<CR>",
    install_package = "i",
    update_package = "u",
    check_package_version = "c",
    update_all_packages = "U",
    check_outdated_packages = "C",
    uninstall_package = "X",
    cancel_installation = "q",
    apply_language_filter = "<C-f>",
    toggle_package_install_log = "<CR>",
    toggle_help = "<leader>",
}

local neotree_keymaps = {
    ["<space>"] = "none",
    ["l"] = "open",
    ["h"] = "close_node",
    ["H"] = "close_all_nodes",
    ["<C-h>"] = "toggle_hidden",
    ["/"] = "fuzzy_finder",
    ["f"] = "filter_on_submit",
    ["<c-x>"] = "clear_filter",
    ["?"] = "show_help",
    ["<esc>"] = "cancel",
    ["<2-LeftMouse>"] = "open",
    ["P"] = { "toggle_preview", config = { use_float = true } },
    ["S"] = "open_split",
    ["s"] = "open_vsplit",
    ["t"] = "open_tabnew",
    ["w"] = "open_with_window_picker",
    ["C"] = "close_node",
    ["z"] = "close_all_nodes",
    ["Z"] = "expand_all_nodes",
    ["R"] = "refresh",
    ["a"] = {
        "add",
        config = {
            show_path = "relative"
        }
    },
    ["A"] = "add_directory",
    ["d"] = "delete",
    ["r"] = "rename",
    ["y"] = "copy_to_clipboard",
    ["x"] = "cut_to_clipboard",
    ["p"] = "paste_from_clipboard",
    ["c"] = "copy",
    ["m"] = "move",
    ["q"] = "close_window",
    ["g?"] = "show_help",
    ["<"] = "prev_source",
    [">"] = "next_source",
    ["i"] = "show_file_details",
    ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
    ["oc"] = { "order_by_created", nowait = false },
    ["od"] = { "order_by_diagnostics", nowait = false },
    ["og"] = { "order_by_git_status", nowait = false },
    ["om"] = { "order_by_modified", nowait = false },
    ["on"] = { "order_by_name", nowait = false },
    ["os"] = { "order_by_size", nowait = false },
    ["ot"] = { "order_by_type", nowait = false },
    ["<bs>"] = "navigate_up",
    ["."] = "set_root",
    ["D"] = "fuzzy_finder_directory",
    ["#"] = "fuzzy_sorter",
    ["[g"] = "prev_git_modified",
    ["]g"] = "next_git_modified",
}

return {
    ts_keymaps = ts_keymaps,
    lsp_keymaps = lsp_keymaps,
    telescope_keymaps = telescope_keymaps,
    mason_keymaps = mason_keymaps,
    neotree_keymaps = neotree_keymaps,
}

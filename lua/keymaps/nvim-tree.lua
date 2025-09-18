local keymap = vim.keymap

local function toggle_nvim_tree()
    local api = require("nvim-tree.api")
    api.tree.toggle({
        find_file = true,
        focus = true,
        update_root = false,
    })
end

keymap.set("n", "<C-b>", toggle_nvim_tree, { desc = "toggle file explorer" })
keymap.set("v", "<C-b>", toggle_nvim_tree, { desc = "toggle file explorer" })
keymap.set("c", "<C-b>", toggle_nvim_tree, { desc = "toggle file explorer" })
keymap.set("i", "<C-b>", toggle_nvim_tree, { desc = "toggle file explorer" })
keymap.set("t", "<C-b>", toggle_nvim_tree, { desc = "toggle file explorer" })

local function rename()
    local api = require("nvim-tree.api")
    local Input = require("nui.input")
    local event = require("nui.utils.autocmd").event

    local node = api.tree.get_node_under_cursor()
    if not node then
        return
    end

    local current_name = node.name
    local is_dir = node.type == "directory"
    local icon = is_dir and "" or "󰈔"

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
                top = " " .. icon .. " rename ",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
    }, {
        prompt = "> ",
        default_value = current_name,
        on_close = function()
            api.tree.focus()
        end,
        on_submit = function(value)
            if not value or value == "" then
                return
            end

            if value == current_name then
                return
            end

            local old_path = node.absolute_path
            local parent_path = vim.fn.fnamemodify(old_path, ":h")
            local new_path = parent_path .. "/" .. value

            local rename_file = require("nvim-tree.actions.fs.rename-file")
            rename_file.rename(node, new_path)
            api.tree.reload()
        end,
    })

    input:mount()

    input:map("i", "<Esc>", function()
        input:unmount()
        api.tree.focus()
    end, { noremap = true })

    input:map("n", "<Esc>", function()
        input:unmount()
        api.tree.focus()
    end, { noremap = true })

    input:map("i", "<C-v>", "<C-r>+", { noremap = true })

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
end

local function create_file()
    local api = require("nvim-tree.api")
    local Input = require("nui.input")
    local event = require("nui.utils.autocmd").event

    local node = api.tree.get_node_under_cursor()
    local parent_path
    if node then
        if node.type == "directory" then
            parent_path = node.absolute_path
        else
            parent_path = vim.fn.fnamemodify(node.absolute_path, ":h")
        end
    else
        parent_path = vim.fn.getcwd()
    end

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
                top = " 󰈔 create file ",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
    }, {
        prompt = "> ",
        default_value = "",
        on_close = function()
            api.tree.focus()
        end,
        on_submit = function(value)
            if not value or value == "" then
                return
            end

            local full_path = parent_path .. "/" .. value

            local dir = vim.fn.fnamemodify(full_path, ":h")
            vim.fn.mkdir(dir, "p")

            local file = io.open(full_path, "w")
            if file then
                file:close()
            end
            api.tree.reload()
            vim.cmd("edit " .. vim.fn.fnameescape(full_path))
        end,
    })

    input:mount()

    input:map("i", "<Esc>", function()
        input:unmount()
        api.tree.focus()
    end, { noremap = true })

    input:map("n", "<Esc>", function()
        input:unmount()
        api.tree.focus()
    end, { noremap = true })

    input:map("i", "<C-v>", "<C-r>+", { noremap = true })

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
end

local function create_folder()
    local api = require("nvim-tree.api")
    local Input = require("nui.input")
    local event = require("nui.utils.autocmd").event

    local node = api.tree.get_node_under_cursor()

    local parent_path
    if node then
        if node.type == "directory" then
            parent_path = node.absolute_path
        else
            parent_path = vim.fn.fnamemodify(node.absolute_path, ":h")
        end
    else
        parent_path = vim.fn.getcwd()
    end

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
                top = "  create folder ",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
    }, {
        prompt = "> ",
        default_value = "",
        on_close = function()
            api.tree.focus()
        end,
        on_submit = function(value)
            if not value or value == "" then
                return
            end

            local full_path = parent_path .. "/" .. value

            vim.fn.mkdir(full_path, "p")
            api.tree.reload()
        end,
    })

    input:mount()

    input:map("i", "<Esc>", function()
        input:unmount()
        api.tree.focus()
    end, { noremap = true })

    input:map("n", "<Esc>", function()
        input:unmount()
        api.tree.focus()
    end, { noremap = true })

    input:map("i", "<C-v>", "<C-r>+", { noremap = true })

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
end

local function delete()
    local api = require("nvim-tree.api")

    local node = api.tree.get_node_under_cursor()
    if not node then
        return
    end
    api.fs.remove(node)
    api.tree.reload()
end

local function nvim_tree_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    keymap.set("n", "<CR>", api.node.open.edit, opts("open"))
    keymap.set("n", "<F2>", rename, opts("rename"))
    keymap.set("n", "<C-c>", api.fs.copy.node, opts("copy"))
    keymap.set("n", "<C-x>", api.fs.cut, opts("cut"))
    keymap.set("n", "<C-v>", api.fs.paste, opts("paste"))
    keymap.set("n", "<Del>", delete, opts("delete"))
    keymap.set("n", "<C-n>", create_file, opts("create file"))
    keymap.set("n", "<C-S-n>", create_folder, opts("create folder"))
    keymap.set("n", "<C-r>", api.tree.reload, opts("refresh file explorer"))
    keymap.set("n", "<C-h>", api.tree.toggle_gitignore_filter, opts("toggle hidden files"))
end
return {
    on_attach = nvim_tree_on_attach,
}

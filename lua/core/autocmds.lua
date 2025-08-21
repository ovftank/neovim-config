-- =============================================================================
-- AUTO COMMANDS
-- =============================================================================
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- =============================================================================
-- GENERAL AUTO COMMANDS
-- =============================================================================
local general = augroup("General", { clear = true })

autocmd("TextYankPost", {
    group = general,
    desc = "highlight copy",
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("BufWritePre", {
    group = general,
    desc = "trim spaces",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function()
            vim.cmd([[%s/\s\+$//e]])
        end)
        vim.fn.setpos(".", save_cursor)
    end,
})

autocmd("FileType", {
    group = general,
    desc = "disable auto-comment",
    callback = function()
        vim.opt_local.formatoptions:remove("r")
        vim.opt_local.formatoptions:remove("o")
        vim.opt_local.formatoptions:remove("c")
    end,
})

-- =============================================================================
-- NVIM-TREE AUTO OPEN
-- =============================================================================
local nvim_tree_group = augroup("NvimTree", { clear = true })

local function open_nvim_tree(data)
    local real_file = vim.fn.filereadable(data.file) == 1

    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    local directory = vim.fn.isdirectory(data.file) == 1

    if directory then
        vim.cmd.cd(data.file)
        vim.api.nvim_buf_delete(data.buf, { force = true })
        vim.cmd("enew")
        require("nvim-tree.api").tree.open({ current_window = false })
    elseif real_file or no_name then
        require("nvim-tree.api").tree.toggle({
            focus = false,
            find_file = true,
            current_window = false,
        })
    end
end

autocmd("VimEnter", {
    group = nvim_tree_group,
    desc = "open nvim-tree at startup",
    callback = open_nvim_tree,
})

-- =============================================================================
-- AUTO-RELOAD FILES & NETWORK SHARES FIX
-- =============================================================================
local auto_reload_group = augroup("AutoReload", { clear = true })

autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    group = auto_reload_group,
    desc = "auto reload files changed externally",
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

autocmd("FileChangedShell", {
    group = auto_reload_group,
    desc = "auto choose reload for file changes",
    pattern = "*",
    callback = function()
        vim.v.fcs_choice = "reload"
    end,
})

-- =============================================================================
-- REPLACE DIRECTORY BUFFER WITH FIRST FILE
-- =============================================================================
local replace_dir_group = augroup("ReplaceDirBuffer", { clear = true })

autocmd("BufReadPost", {
    group = replace_dir_group,
    desc = "replace directory buffer with first file",
    callback = function()
        local buffers = vim.api.nvim_list_bufs()
        for _, buf in ipairs(buffers) do
            local buf_name = vim.api.nvim_buf_get_name(buf)
            local buf_type = vim.bo[buf].buftype
            local buf_filetype = vim.bo[buf].filetype

            local is_directory = vim.fn.isdirectory(buf_name) == 1
            local is_netrw = buf_filetype == "netrw"
            local is_blank = buf_name == "" and buf_type == "" and not vim.bo[buf].modified

            if is_directory or is_netrw or is_blank then
                vim.api.nvim_buf_delete(buf, { force = false })
                break
            end
        end
    end,
})

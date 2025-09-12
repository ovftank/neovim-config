local function update_config()
    local handle = io.popen("git status --porcelain")
    if not handle then
        vim.notify("lỗi check git status", vim.log.levels.ERROR)
        return
    end

    local output = handle:read("*a")
    handle:close()

    if output ~= "" then
        vim.notify("có thay đổi chưa commit, commit trước khi update", vim.log.levels.WARN)
        return
    end

    local pull_handle = io.popen("git pull origin main")
    if not pull_handle then
        vim.notify("lỗi git pull", vim.log.levels.ERROR)
        return
    end

    local pull_output = pull_handle:read("*a")
    pull_handle:close()

    if pull_output:find("Already up to date") then
        vim.notify("config đã up to date", vim.log.levels.INFO)
        return
    end
    vim.cmd("source ~/AppData/Local/nvim/init.lua")
    vim.notify("update xong, config đã reload", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("Update", update_config, {
    desc = "auto update nvim config từ git và reload",
})

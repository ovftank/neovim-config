local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

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
    pcall(function() vim.cmd([[%s/\s\+$//e]]) end)
    vim.fn.setpos(".", save_cursor)
  end,
})

local dashboard_group = augroup("Dashboard", { clear = true })
autocmd("VimEnter", {
  group = dashboard_group,
  desc = "show dashboard",
  callback = function()
    if vim.fn.argc() == 0 or (vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) == 1) then
      vim.cmd("Dashboard")
    end
  end,
})

autocmd("BufEnter", {
  group = dashboard_group,
  desc = "back dashboard",
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "netrw" then
      vim.cmd("Dashboard")
    end
  end,
})

local tailwind_group = augroup("TailwindAutoSort", { clear = true })
autocmd("BufWritePre", {
  group = tailwind_group,
  pattern = { "*.html", "*.css", "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue", "*.svelte", "*.astro", "*.php" },
  desc = "sort tailwind",
  callback = function()
    if pcall(require, "tailwind-tools") then
      vim.cmd("TailwindSortSync")
    end
  end,
})

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

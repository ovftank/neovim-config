local M = {}

local keymap = vim.keymap

local function setup_telescope_keymaps()
  if not pcall(require, "telescope") then
    return
  end

  local builtin = require("telescope.builtin")

  keymap.set({ "n", "v", "i" }, "<C-t>", function()
    if vim.fn.mode() == "i" then
      vim.cmd("stopinsert")
    end
    builtin.find_files({
      attach_mappings = function(_, map)
        map("i", "<Esc>", require("telescope.actions").close)
        map("n", "<Esc>", require("telescope.actions").close)
        map("i", "%", function()
          vim.cmd("stopinsert")
          builtin.live_grep()
        end)
        return true
      end
    })
  end, { desc = "find files" })

  keymap.set({ "n", "v", "i" }, "<C-f>", function()
    if vim.fn.mode() == "i" then
      vim.cmd("stopinsert")
    end
    builtin.grep_string({
      search = vim.fn.expand("<cword>"),
      attach_mappings = function(_, map)
        map("i", "<Esc>", require("telescope.actions").close)
        map("n", "<Esc>", require("telescope.actions").close)
        return true
      end
    })
  end, { desc = "find text in buffer" })

  keymap.set({ "n", "v", "i" }, "<C-q>", function()
    if vim.fn.mode() == "i" then
      vim.cmd("stopinsert")
    end
    builtin.lsp_references({
      attach_mappings = function(_, map)
        map("i", "<Esc>", require("telescope.actions").close)
        map("n", "<Esc>", require("telescope.actions").close)
        return true
      end
    })
  end, { desc = "find refs" })

  keymap.set({ "n", "v", "i" }, "<F1>", function()
    if vim.fn.mode() == "i" then
      vim.cmd("stopinsert")
    end
    builtin.lsp_definitions({
      attach_mappings = function(_, map)
        map("i", "<Esc>", require("telescope.actions").close)
        map("n", "<Esc>", require("telescope.actions").close)
        return true
      end
    })
  end, { desc = "goto def" })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_telescope_keymaps,
})

return M

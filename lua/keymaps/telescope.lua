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
  end, { desc = "Tìm file (gõ % để search content)" })

  keymap.set({ "n", "v", "i" }, "<C-f>", function()
    if vim.fn.mode() == "i" then
      vim.cmd("stopinsert")
    end
    builtin.current_buffer_fuzzy_find({
      attach_mappings = function(_, map)
        map("i", "<Esc>", require("telescope.actions").close)
        map("n", "<Esc>", require("telescope.actions").close)
        return true
      end
    })
  end, { desc = "Tìm nội dung trong file hiện tại" })

  keymap.set({ "n", "v", "i" }, "<C-r>", function()
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
  end, { desc = "Tìm references" })

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
  end, { desc = "Goto definition" })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_telescope_keymaps,
})

return M

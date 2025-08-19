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
        map("i", "@", function()
          vim.cmd("stopinsert")
          builtin.lsp_document_symbols()
        end)
        map("i", ">", function()
          vim.cmd("stopinsert")
          builtin.commands()
        end)
        map("i", "<C-BS>", function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>", true, true, true), "i", true)
        end)
        map("i", "<C-a>", function(prompt_bufnr)
          local action_state = require("telescope.actions.state")
          local picker = action_state.get_current_picker(prompt_bufnr)
          if picker and picker.prompt_bufnr then
            local prompt_win = vim.api.nvim_get_current_win()
            vim.api.nvim_win_set_cursor(prompt_win, { 1, 0 })
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>v$", true, true, true), "n", true)
          end
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

  keymap.set({ "n", "v", "i" }, "<F12>", function()
    if vim.fn.mode() == "i" then
      vim.cmd("stopinsert")
    end
    builtin.keymaps({
      attach_mappings = function(_, map)
        map("i", "<Esc>", require("telescope.actions").close)
        map("n", "<Esc>", require("telescope.actions").close)
        return true
      end
    })
  end, { desc = "keymaps" })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_telescope_keymaps,
})

return M

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = "dracula-nvim",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn", "info", "hint" },
          symbols = { error = "✗ ", warn = "⚠ ", info = "ⓘ ", hint = "💡" },
          colored = true,
          update_in_insert = false,
          always_visible = false,
          on_click = function()
            require("telescope.builtin").diagnostics()
          end,
        }
      },
      lualine_c = { "filename" },
      lualine_x = {
        {
          function()
            local ok, dap = pcall(require, "dap")
            ---@diagnostic disable-next-line: undefined-field
            if ok and dap.session() ~= nil then
              return "▶"
            else
              return "▶"
            end
          end,
          on_click = function()
            local ok, dap = pcall(require, "dap")
            if ok then
              ---@diagnostic disable-next-line: undefined-field
              dap.continue()
            end
          end,
          color = function()
            local ok, dap = pcall(require, "dap")
            ---@diagnostic disable-next-line: undefined-field
            if ok and dap.session() ~= nil then
              return { fg = "#98c379" }
            else
              return { fg = "#e5c07b" }
            end
          end,
        },
        {
          function()
            local ok, dap = pcall(require, "dap")
            ---@diagnostic disable-next-line: undefined-field
            if ok and dap.session() ~= nil then
              return "⏭"
            else
              return ""
            end
          end,
          on_click = function()
            local ok, dap = pcall(require, "dap")
            if ok then
              ---@diagnostic disable-next-line: undefined-field
              dap.step_over()
            end
          end,
          color = { fg = "#61afef" },
        },
        {
          function()
            local ok, dap = pcall(require, "dap")
            ---@diagnostic disable-next-line: undefined-field
            if ok and dap.session() ~= nil then
              return "■"
            else
              return ""
            end
          end,
          on_click = function()
            local ok, dap = pcall(require, "dap")
            if ok then
              ---@diagnostic disable-next-line: undefined-field
              dap.terminate()
            end
          end,
          color = { fg = "#e06c75" },
        },

        "copilot",
        "encoding",
        "fileformat",
        "filetype"
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}

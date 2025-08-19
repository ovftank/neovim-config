return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local uv = require("luv")
    local current_time = ""

    local function set_interval(interval, callback)
      local timer = uv.new_timer()
      local function ontimeout()
        callback(timer)
      end
      uv.timer_start(timer, interval, interval, ontimeout)
      return timer
    end

    local function update_wakatime()
      local stdin = uv.new_pipe()
      local stdout = uv.new_pipe()
      local stderr = uv.new_pipe()

      uv.spawn(
        "wakatime",
        {
          args = { "--today" },
          stdio = { stdin, stdout, stderr }
        },
        function(_, _)
          stdin:close()
          stdout:close()
          stderr:close()
        end
      )

      uv.read_start(
        stdout,
        function(err, data)
          assert(not err, err)
          if data then
            current_time = "󱑆 " .. data:sub(1, #data - 2) .. " "
          end
        end
      )
    end

    set_interval(5000, update_wakatime)

    local function get_wakatime()
      return current_time
    end

    return {
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
          {
            "branch",
            on_click = function()
              require("telescope.builtin").git_branches()
            end,
          },
          {
            "diff",
            on_click = function()
              require("gitsigns").diffthis()
            end,
          },
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
              if vim.bo.filetype == "neo-tree" then
                return ""
              end
              local ok, dap = pcall(require, "dap")
              ---@diagnostic disable-next-line: undefined-field
              if ok and dap.session() ~= nil then
                return "▶"
              else
                return "▶"
              end
            end,
            on_click = function()
              if vim.bo.filetype == "neo-tree" then
                return
              end
              local ok, dap = pcall(require, "dap")
              if ok then
                ---@diagnostic disable-next-line: undefined-field
                dap.continue()
              end
            end,
            color = function()
              if vim.bo.filetype == "neo-tree" then
                return {}
              end
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
              if vim.bo.filetype == "neo-tree" then
                return ""
              end
              local ok, dap = pcall(require, "dap")
              ---@diagnostic disable-next-line: undefined-field
              if ok and dap.session() ~= nil then
                return "⏭"
              else
                return ""
              end
            end,
            on_click = function()
              if vim.bo.filetype == "neo-tree" then
                return
              end
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
              if vim.bo.filetype == "neo-tree" then
                return ""
              end
              local ok, dap = pcall(require, "dap")
              ---@diagnostic disable-next-line: undefined-field
              if ok and dap.session() ~= nil then
                return "■"
              else
                return ""
              end
            end,
            on_click = function()
              if vim.bo.filetype == "neo-tree" then
                return
              end
              local ok, dap = pcall(require, "dap")
              if ok then
                ---@diagnostic disable-next-line: undefined-field
                dap.terminate()
              end
            end,
            color = { fg = "#e06c75" },
          },
          get_wakatime,
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
    }
  end,
}

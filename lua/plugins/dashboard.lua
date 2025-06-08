local M = {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
}

function M.config()
  local dashboard = require("dashboard")

  dashboard.setup({
    theme = "hyper",
    config = {
      header = {
        "",
        "┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬─────┐",
        "│ Esc │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │Bkspc│",
        "├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬───┤",
        "│  ⇥    │ H │ W │ E │ R │ T │ Y │ U │ I │ O │ P │ [ │ ] │ \\ │",
        "├───────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴───┤",
        "│  ^.^   │ A │ S │ D │ F │ G │ ← │ ↓ │ ↑ │ → │ ; │ ' │Enter │",
        "├────────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤",
        "│ Shift    │ Z │ X │ C │ V │ B │ N │ M │ , │ . │ / │  ^.^   │",
        "├──────┬───┴┬──┴─┬─┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬───────┤",
        "│  ^.^ │^.^ │^.^ │          Space         │ `  │^.^ │^.^│^.^│",
        "└──────┴────┴────┴────────────────────────┴────┴────┴───────┘",
        "                        zuoya gmk61                         ",
        "",
      },
      shortcut = {
        {
          icon = " ",
          icon_hl = "@variable",
          desc = "Tìm tệp",
          group = "Label",
          action = function()
            require("telescope.builtin").find_files({
              attach_mappings = function(_, map)
                map("i", "<Esc>", require("telescope.actions").close)
                map("n", "<Esc>", require("telescope.actions").close)
                return true
              end
            })
          end,
          key = "f",
        },
        {
          desc = " Thoát",
          group = "Number",
          action = "qa",
          key = "q",
        },
      },
      project = {
        enable = true,
        limit = 8,
        icon = " ",
        label = "Dự án gần đây",
        action = "Telescope find_files cwd=",
      },
      mru = {
        enable = true,
        limit = 10,
        icon = " ",
        label = "Tệp gần đây:",
        cwd_only = false,
      },
      footer = {
        "",
        "🚀 @ovftank",
      },
    },
  })
end

return M

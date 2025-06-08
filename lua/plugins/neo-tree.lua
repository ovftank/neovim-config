return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  opts = function()
    local keymaps = require("keymaps.neo-tree")
    return {
    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    sort_case_insensitive = false,
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        with_expanders = nil,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "📁",
        folder_open = "📂",
        folder_empty = "📁",
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    window = {
      position = "left",
      width = 40,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = keymaps.window_mappings,
    },
    nesting_rules = {},
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true,
        hide_by_name = {},
        hide_by_pattern = {},
        always_show = {},
        never_show = {},
      },
      follow_current_file = {
        enabled = false,
        leave_dirs_open = false,
      },
      group_empty_dirs = false,
      hijack_netrw_behavior = "disabled",
      use_libuv_file_watcher = false,
      window = {
        mappings = keymaps.filesystem_mappings,
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      group_empty_dirs = true,
      show_unloaded = true,
      window = {
        mappings = keymaps.buffers_mappings,
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = keymaps.git_status_mappings,
      },
    },
    }
  end,
}

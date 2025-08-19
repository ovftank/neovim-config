return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = true,
    auto_hide = 0,
    tabpages = true,
    clickable = true,
    focus_on_close = 'left',
    hide = { extensions = false, inactive = false },
    highlight_alternate = false,
    highlight_inactive_file_icons = false,
    highlight_visible = true,

    exclude_name = { '^$', '^\\[.*\\]$', '^\\[.*\\]\\s*$' },

    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout', text = 'neo-tree', align = 'left' },
      NvimTree = true,
      undotree = { text = 'undotree', align = 'center' },
      Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
    },

    icons = {
      buffer_index = false,
      buffer_number = false,
      button = '',
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '󰅚 ' },
        [vim.diagnostic.severity.WARN] = { enabled = true, icon = '󰀦 ' },
        [vim.diagnostic.severity.INFO] = { enabled = true, icon = '󰋩 ' },
        [vim.diagnostic.severity.HINT] = { enabled = true, icon = '󰌵 ' },
      },
      gitsigns = {
        added = { enabled = true, icon = '󰐕 ' },
        changed = { enabled = true, icon = '󰆓 ' },
        deleted = { enabled = true, icon = '󰩺 ' },
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = { left = '▎', right = '' },
      separator_at_end = true,
      modified = { button = '●' },
      preset = 'default',
      alternate = { filetype = { enabled = false } },
      current = { buffer_index = true },
      inactive = { button = '×' },
      visible = { modified = { buffer_number = false } },
    },

    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 30,
    minimum_length = 0,
    semantic_letters = true,

    insert_at_start = false,
    insert_at_end = false,

    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil,

  },
  version = '1.9.1',
}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,

      hide_numbers = true,
      shade_terminals = true,
      shading_factor = -30,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = false,
      persist_size = true,
      persist_mode = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      winbar = {
        enabled = true,
        name_formatter = function()
          return "Terminal"
        end
      },
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 3,
        title_pos = "center",
      },
      highlights = {
        Normal = {
          guibg = "#1e1e2e",
        },
        NormalFloat = {
          link = "Normal"
        },
        FloatBorder = {
          guifg = "#bd93f9",
          guibg = "#1e1e2e",
        },
      },
    })
  end,
}

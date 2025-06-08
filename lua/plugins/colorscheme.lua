return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        show_end_of_buffer = true,
        transparent_bg = false,
        lualine_bg_color = "#44475a",
        italic_comment = true,
      })
      vim.cmd.colorscheme("dracula")
    end,
  },
}

return {
  "soulis-1256/eagle.nvim",
  config = function()
    vim.o.mousemoveevent = true
    require("eagle").setup({
      mouse_mode = true,
      keyboard_mode = false,
      show_lsp_info = true,
      render_delay = 0,
      detect_idle_timer = 50,
      border = "single",
      title_color = "#bd93f9",
      border_color = "#bd93f9",
    })
  end,
}

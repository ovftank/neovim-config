return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = "^$",
      toggler = {
        line = false,
        block = false,
      },
      opleader = {
        line = false,
        block = false,
      },
      extra = {
        above = false,
        below = false,
        eol = false,
      },
      mappings = {
        basic = false,
        extra = false,
      },
      pre_hook = nil,
      post_hook = nil,
    })
  end,
}

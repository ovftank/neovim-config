return {
    "echasnovski/mini.icons",
    lazy = false,
    init = function()
        require("mini.icons").mock_nvim_web_devicons()
    end,
    opts = {
        style = "glyph",
        lsp = {
            Text = { glyph = "󰉿", hl = "MiniIconsGrey" },
            Method = { glyph = "󰊕", hl = "MiniIconsPurple" },
            Function = { glyph = "󰊕", hl = "MiniIconsPurple" },
            Constructor = { glyph = "󰒓", hl = "MiniIconsYellow" },
            Field = { glyph = "󰜢", hl = "MiniIconsCyan" },
            Variable = { glyph = "󰆦", hl = "MiniIconsRed" },
            Class = { glyph = "󱡠", hl = "MiniIconsYellow" },
            Interface = { glyph = "󱡠", hl = "MiniIconsAzure" },
            Module = { glyph = "󰅩", hl = "MiniIconsGreen" },
            Property = { glyph = "󰖷", hl = "MiniIconsCyan" },
            Unit = { glyph = "󰪚", hl = "MiniIconsGrey" },
            Value = { glyph = "󰦨", hl = "MiniIconsYellow" },
            Enum = { glyph = "󰦨", hl = "MiniIconsYellow" },
            Keyword = { glyph = "󰻾", hl = "MiniIconsPurple" },
            Snippet = { glyph = "󱄽", hl = "MiniIconsGreen" },
            Color = { glyph = "󰏘", hl = "MiniIconsGreen" },
            File = { glyph = "󰈔", hl = "MiniIconsBlue" },
            Reference = { glyph = "󰬲", hl = "MiniIconsBlue" },
            Folder = { glyph = "󰉋", hl = "MiniIconsBlue" },
            EnumMember = { glyph = "󰦨", hl = "MiniIconsYellow" },
            Constant = { glyph = "󰏿", hl = "MiniIconsRed" },
            Struct = { glyph = "󱡠", hl = "MiniIconsYellow" },
            Event = { glyph = "󱐋", hl = "MiniIconsRed" },
            Operator = { glyph = "󰪚", hl = "MiniIconsGrey" },
            TypeParameter = { glyph = "󰬛", hl = "MiniIconsAzure" },
        },
    },
    config = function(_, opts)
        local mini_icons = require("mini.icons")
        mini_icons.setup(opts)
        mini_icons.tweak_lsp_kind()
    end,
}

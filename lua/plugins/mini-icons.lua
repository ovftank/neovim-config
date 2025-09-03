return {
    "echasnovski/mini.icons",
    lazy = true,
    init = function()
        require("mini.icons").mock_nvim_web_devicons()
    end,
    opts = {
        style = "glyph",
        lsp = {
            Text = { glyph = "󰉿", hl = "MiniIconsGrey" },
            Method = { glyph = "󰊕", hl = "MiniIconsPurple" },
            Function = { glyph = "󰊕", hl = "MiniIconsPurple" },
            Constructor = { glyph = "󰒓", hl = "MiniIconsOrange" },
            Field = { glyph = "󰜢", hl = "MiniIconsOrange" },
            Variable = { glyph = "󰆦", hl = "MiniIconsRed" },
            Class = { glyph = "󱡠", hl = "MiniIconsOrange" },
            Interface = { glyph = "󱡠", hl = "MiniIconsOrange" },
            Module = { glyph = "󰅩", hl = "MiniIconsOrange" },
            Property = { glyph = "󰖷", hl = "MiniIconsOrange" },
            Unit = { glyph = "󰪚", hl = "MiniIconsOrange" },
            Value = { glyph = "󰦨", hl = "MiniIconsOrange" },
            Enum = { glyph = "󰦨", hl = "MiniIconsOrange" },
            Keyword = { glyph = "󰻾", hl = "MiniIconsPurple" },
            Snippet = { glyph = "󱄽", hl = "MiniIconsGreen" },
            Color = { glyph = "󰏘", hl = "MiniIconsGreen" },
            File = { glyph = "󰈔", hl = "MiniIconsBlue" },
            Reference = { glyph = "󰬲", hl = "MiniIconsBlue" },
            Folder = { glyph = "󰉋", hl = "MiniIconsBlue" },
            EnumMember = { glyph = "󰦨", hl = "MiniIconsOrange" },
            Constant = { glyph = "󰏿", hl = "MiniIconsOrange" },
            Struct = { glyph = "󱡠", hl = "MiniIconsOrange" },
            Event = { glyph = "󱐋", hl = "MiniIconsOrange" },
            Operator = { glyph = "󰪚", hl = "MiniIconsGrey" },
            TypeParameter = { glyph = "󰬛", hl = "MiniIconsOrange" },
        },
    },
    config = function(_, opts)
        require("mini.icons").setup(opts)
        MiniIcons.tweak_lsp_kind()
    end,
}

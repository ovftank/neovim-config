return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        ls.setup({
            history = true,
            delete_check_events = "TextChanged",
            region_check_events = "CursorMoved",
            enable_autosnippets = true,
            update_events = "TextChanged,TextChangedI",

            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "", "DiagnosticWarn" } },
                    },
                },
                [types.insertNode] = {
                    active = {
                        virt_text = { { "", "DiagnosticInfo" } },
                    },
                },
            },
        })
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/snippets" } })
    end,
}

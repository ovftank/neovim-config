return {
    "andymass/vim-matchup",
    event = "VeryLazy",
    init = function()
        vim.g.matchup_matchparen_enabled = 1
        vim.g.matchup_motion_enabled = 1
        vim.g.matchup_text_obj_enabled = 1

        vim.g.matchup_treesitter_enabled = 1
        vim.g.matchup_treesitter_stopline = 500

        vim.g.matchup_delim_stopline = 1500
        vim.g.matchup_matchparen_stopline = 400

        vim.g.matchup_matchparen_offscreen = { method = "popup" }

        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_deferred_show_delay = 50
        vim.g.matchup_matchparen_deferred_hide_delay = 700

        vim.g.matchup_motion_override_Npercent = 11
        vim.g.matchup_motion_cursor_end = 1

        vim.g.matchup_delim_noskips = 0

        vim.g.loaded_matchit = 1

        vim.g.matchup_matchparen_hi_background = 1
    end,
    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                vim.cmd(
                    "hi MatchParen guifg=#f8f8f2 guibg=#44475a gui=underline ctermfg=15 ctermbg=238 cterm=underline"
                )
                vim.cmd(
                    "hi MatchParenCur guifg=#f8f8f2 guibg=#6272a4 gui=bold,underline ctermfg=15 ctermbg=61 cterm=bold,underline"
                )

                vim.cmd(
                    "hi MatchWord guifg=#f8f8f2 guibg=#44475a gui=underline ctermfg=15 ctermbg=238 cterm=underline"
                )

                vim.cmd(
                    "hi MatchWordCur guifg=#f8f8f2 guibg=#6272a4 gui=bold,underline ctermfg=15 ctermbg=61 cterm=bold,underline"
                )

                vim.cmd("hi MatchBackground guibg=#44475a ctermbg=238")

                vim.cmd(
                    "hi OffscreenPopup guifg=#f8f8f2 guibg=#44475a gui=bold ctermfg=15 ctermbg=238 cterm=bold"
                )
            end,
        })

        vim.cmd("doautocmd ColorScheme")
    end,
}

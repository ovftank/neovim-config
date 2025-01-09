return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("dracula").setup({
                -- Tùy chỉnh màu sắc
                colors = {
                    bright_red = "#FF5555",
                    bright_green = "#50fa7b",
                    bright_yellow = "#f1fa8c",
                    bright_blue = "#bd93f9",
                    bright_magenta = "#ff79c6",
                    bright_cyan = "#8be9fd",
                    bright_white = "#ffffff",
                    menu = "#21222C",
                    visual = "#3E4452",
                    gutter_fg = "#4B5263",
                    nontext = "#3B4048",
                },
                -- Tùy chỉnh highlight
                show_end_of_buffer = true,
                transparent_bg = false,
                -- Tùy chỉnh các thành phần giao diện
                italic_comment = true,
                overrides = {
                    -- Tùy chỉnh màu cho các thành phần cụ thể
                    CursorLine = { bg = "#2d3144" },
                    Search = { fg = "#f8f8f2", bg = "#6272a4" },
                    IncSearch = { fg = "#f8f8f2", bg = "#ff79c6" },
                    DiffAdd = { fg = "#50fa7b", bg = "#31353f" },
                    DiffChange = { fg = "#f1fa8c", bg = "#31353f" },
                    DiffDelete = { fg = "#ff5555", bg = "#31353f" },
                    -- TreeSitter highlights
                    ["@function"] = { fg = "#50fa7b", italic = true },
                    ["@keyword"] = { fg = "#ff79c6", italic = true },
                    ["@string"] = { fg = "#f1fa8c" },
                    ["@type"] = { fg = "#8be9fd", italic = true },
                    ["@comment"] = { fg = "#6272a4", italic = true },
                },
            })

            -- Áp dụng colorscheme
            vim.cmd([[colorscheme dracula]])

            -- Thêm các highlight groups tùy chỉnh
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#6272a4" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f8f8f2", bold = true })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        end,
    }
}

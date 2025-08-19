vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "UfoFoldedFg", { link = "Normal" })
        vim.api.nvim_set_hl(0, "UfoFoldedBg", { link = "Folded" })

        vim.api.nvim_set_hl(0, "UfoPreviewSbar", { link = "PmenuSbar" })
        vim.api.nvim_set_hl(0, "UfoPreviewThumb", { link = "PmenuThumb" })
        vim.api.nvim_set_hl(0, "UfoPreviewWinBar", { link = "UfoFoldedBg" })
        vim.api.nvim_set_hl(0, "UfoPreviewCursorLine", { link = "Visual" })

        vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { link = "Comment" })
        vim.api.nvim_set_hl(0, "UfoCursorFoldedLine", { link = "CursorLine" })
    end,
})

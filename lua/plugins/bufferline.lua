return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    themable = true,
                    numbers = "none",
                    close_command = "bdelete! %d",
                    middle_mouse_command = nil,
                    indicator = {
                        icon = "▎",
                        style = "icon",
                    },
                    buffer_close_icon = "󰅖",
                    modified_icon = "●",
                    close_icon = "󰅘",
                    left_trunc_marker = "󰂸",
                    right_trunc_marker = "󰂺",
                    max_name_length = 18,
                    max_prefix_length = 15,
                    truncate_names = true,
                    tab_size = 18,
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false,
                    diagnostics_update_on_event = true,
                    diagnostics_indicator = function(_, _, diagnostics_dict, _)
                        local s = " "
                        for e, n in pairs(diagnostics_dict) do
                            local sym = e == "error" and " "
                                or (e == "warning" and " " or " ")
                            s = s .. n .. sym
                        end
                        return s
                    end,
                    custom_filter = function(buf_number, _)
                        if vim.bo[buf_number].filetype ~= "qf" then
                            return true
                        end
                        if vim.fn.bufname(buf_number) ~= "[No Name]" then
                            return true
                        end
                        if
                            vim.fn.getcwd() == vim.fn.expand("~")
                            and vim.bo[buf_number].filetype ~= "alpha"
                        then
                            return true
                        end
                        return false
                    end,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "file explorer",
                            text_align = "left",
                            separator = true,
                        },
                    },
                    color_icons = true,
                    get_element_icon = function(element)
                        local icon, hl = require("mini.icons").get("filetype", element.filetype)
                        return icon, hl
                    end,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    show_duplicate_prefix = true,
                    duplicates_across_groups = true,
                    persist_buffer_sort = true,
                    move_wraps_at_ends = false,
                    separator_style = "thick",
                    enforce_regular_tabs = false,
                    always_show_bufferline = true,
                    auto_toggle_bufferline = true,
                    sort_by = "insert_after_current",
                    groups = {
                        options = {
                            toggle_hidden_on_enter = true,
                        },
                        items = {},
                    },
                },
            })

            require("keymaps.buffer")
        end,
    },
}

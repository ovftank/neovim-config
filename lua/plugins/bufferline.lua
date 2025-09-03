return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VimEnter",
    opts = {
        options = {
            mode = "buffers",
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator = {
                icon = "▎",
                style = "icon",
            },
            buffer_close_icon = "󰅖",
            modified_icon = "󰏬",
            close_icon = "󰅖",
            left_trunc_marker = "󰍞",
            right_trunc_marker = "󰍟",
            max_name_length = 30,
            max_prefix_length = 30,
            truncate_names = true,
            tab_size = 21,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            diagnostics_update_on_event = true,
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or " ")
                    s = s .. n .. sym .. " "
                end
                return s
            end,
            color_icons = true,
            get_element_icon = function(element)
                local icon, hl, _ = require("mini.icons").get("filetype", element.filetype)
                return icon, hl
            end,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            always_show_bufferline = true,
            show_tab_indicators = true,
            show_duplicate_prefix = true,
            persist_buffer_sort = true,
            separator_style = "thin",
            name_formatter = function(buf)
                if buf.name:match("%.md") then
                    return vim.fn.fnamemodify(buf.name, ":t:r")
                end
            end,
            enforce_regular_tabs = true,
            custom_filter = function(buf_number, _)
                if
                    vim.bo[buf_number].filetype ~= "qf"
                    and vim.bo[buf_number].filetype ~= "fugitive"
                then
                    return true
                end
            end,
            hover = {
                enabled = true,
                delay = 200,
                reveal = { "close" },
            },
            sort_by = "insert_after_current",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                },
            },
        },
    },
    config = function(_, opts)
        local bufferline = require("bufferline")
        opts.options.style_preset = bufferline.style_preset.default
        bufferline.setup(opts)
        require("keymaps.bufferline")
    end,
}

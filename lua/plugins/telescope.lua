return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = function()
        return {
            defaults = {
                prompt_prefix = "󰍉 ",
                selection_caret = " ",
                entry_prefix = " ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" },
                file_ignore_patterns = {
                    "node_modules/",
                    "__pycache__/",
                    "%.git/",
                    "dist/",
                    "build/",
                    "%.lock$",
                    "%.jpg$",
                    "%.jpeg$",
                    "%.png$",
                    "%.gif$",
                    "%.svg$",
                    "%.ico$",
                },
            },
            pickers = {
                find_files = {},
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
                grep_string = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        width = 0.5,
                        prompt_title = "Select one of:",
                    }),
                },
            },
        }
    end,
    config = function()
        require("keymaps.telescope")
        require("telescope").load_extension("ui-select")
    end,
}

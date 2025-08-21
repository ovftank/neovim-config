return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
        defaults = {
            prompt_prefix = "󰍉 ",
            selection_caret = " ",
            entry_prefix = " ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
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
            file_ignore_patterns = {
                "node_modules",
                "^%.git/",
                "dist/",
                "build/",
                "*.lock",
            },
            path_display = { "truncate" },
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            use_less = true,
            set_env = { ["COLORTERM"] = "truecolor" },
        },
        pickers = {
            find_files = {
                find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            },
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
    },
    config = function()
        require("keymaps.telescope")
        require("telescope").load_extension("ui-select")
    end,
}

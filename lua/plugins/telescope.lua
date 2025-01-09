return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        version = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build && copy build\\libfzf.dll lua\\',
            },
        },
        keys = require("core.keymap").telescope_keymaps,
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    prompt_prefix = " 🔍 ",
                    selection_caret = " ❯ ",
                    path_display = { "truncate" },
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
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                        hidden = true,
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    },
                    live_grep = {
                        theme = "dropdown",
                        previewer = true,
                    },
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                        initial_mode = "normal",
                        sort_lastused = true,
                        sort_mru = true,
                    },
                    oldfiles = {
                        theme = "dropdown",
                        previewer = false,
                        sort_lastused = true,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })

            pcall(telescope.load_extension, "fzf")
        end,
    }
}

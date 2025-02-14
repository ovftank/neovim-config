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
        keys = function()
            local keys = {}
            local telescope_keymaps = require("core.keymap").telescope_keymaps
            local builtin = require("telescope.builtin")

            local default_opts = {
                initial_mode = "insert",
                theme = "dropdown",
            }

            local command_opts = {
                find_files = vim.tbl_extend("force", default_opts, {
                    previewer = false,
                    hidden = true,
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" },
                }),
                live_grep = vim.tbl_extend("force", default_opts, {
                    previewer = true,
                    additional_args = function()
                        return { "--glob", "!**/node_modules/*" }
                    end,
                }),
            }
            local modes = { "", "n", "v", "i" }
            for _, mode in ipairs(modes) do
                for command, key in pairs(telescope_keymaps) do
                    if builtin[command] then
                        table.insert(keys, {
                            key,
                            function()
                                if mode == "i" then
                                    vim.cmd("stopinsert")
                                end
                                builtin[command](command_opts[command])
                            end,
                            mode = mode,
                            desc = "Telescope " .. command,
                        })
                    end
                end
            end

            return keys
        end,
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    prompt_prefix = "",
                    selection_caret = " ❯ ",
                    path_display = { "truncate" },
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    mappings = {
                        i = {
                            [require("core.keymap").telescope_keymaps.close] = "close",
                        },
                        n = {
                            [require("core.keymap").telescope_keymaps.close] = "close",
                        },
                    },
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

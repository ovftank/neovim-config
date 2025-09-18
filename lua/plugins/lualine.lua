return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "arkav/lualine-lsp-progress",
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = vim.g.colors_name,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                refresh = {
                    statusline = 100,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 10,
                    events = {
                        "ModeChanged",
                        "WinEnter",
                        "BufEnter",
                    },
                },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                    },
                },
                lualine_b = {
                    {
                        "filename",
                        path = 0,
                        shorting_target = 40,
                        symbols = {
                            modified = " 󰏫",
                            readonly = " 󰌾",
                            unnamed = " 󰈙",
                            newfile = " 󰈔",
                        },
                    },
                    {
                        "branch",
                        on_click = function()
                            require("telescope.builtin").git_branches()
                        end,
                    },
                    {
                        "diff",
                        colored = true,
                        symbols = {
                            added = "󰐖 ",
                            modified = "󰏬 ",
                            removed = "󰍵 ",
                        },
                        on_click = function()
                            require("gitsigns").diffthis()
                        end,
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        sections = { "error", "warn", "info", "hint" },
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                        on_click = function()
                            vim.cmd("Trouble diagnostics")
                        end,
                    },
                    {
                        function()
                            if not _G.wakatime_state then
                                _G.wakatime_state = { time = "" }

                                local uv = vim.uv or vim.loop

                                local function update_wakatime()
                                    local wakatime_cli = "wakatime"
                                    local ok, cli_location = pcall(
                                        vim.api.nvim_cmd,
                                        { cmd = "WakaTimeCliLocation" },
                                        { output = true }
                                    )
                                    if ok and cli_location and cli_location ~= "" then
                                        wakatime_cli = cli_location
                                            :gsub("^%s+", "")
                                            :gsub("%s+$", "")
                                            :gsub("\n", "")
                                    end

                                    local stdin = uv.new_pipe()
                                    local stdout = uv.new_pipe()
                                    local stderr = uv.new_pipe()

                                    ---@diagnostic disable-next-line: missing-fields
                                    local handle = uv.spawn(wakatime_cli, {
                                        args = { "--today" },
                                        stdio = { stdin, stdout, stderr },
                                    }, function(_, _)
                                        if stdin then
                                            stdin:close()
                                        end
                                        if stdout then
                                            stdout:close()
                                        end
                                        if stderr then
                                            stderr:close()
                                        end
                                    end)

                                    if handle and stdout then
                                        uv.read_start(stdout, function(err, data)
                                            if not err and data then
                                                _G.wakatime_state.time = data:gsub("^%s+", "")
                                                    :gsub("%s+$", "")
                                                    :gsub("\n", "")
                                            end
                                        end)
                                    end
                                end

                                update_wakatime()

                                local timer = uv.new_timer()
                                if timer then
                                    uv.timer_start(timer, 30000, 30000, function()
                                        update_wakatime()
                                    end)
                                end
                            end

                            return _G.wakatime_state.time ~= ""
                                    and ("󰥔 " .. _G.wakatime_state.time)
                                or ""
                        end,
                        cond = function()
                            return vim.g.loaded_wakatime == 1
                        end,
                        color = { fg = "#bd93f9" },
                    },
                    {
                        function()
                            local dap = require("dap")
                            if dap.session() then
                                return "󰃤 debug"
                            end
                            local filetype = vim.bo.filetype
                            if
                                filetype == "python"
                                or filetype == "javascript"
                                or filetype == "typescript"
                            then
                                return "▶ debug"
                            end
                            return ""
                        end,
                        color = { fg = "#bd93f9" },
                        on_click = function()
                            local dap = require("dap")
                            dap.continue()
                        end,
                    },
                },
                lualine_c = {
                    {
                        "lsp_progress",
                        display_components = {
                            "lsp_client_name",
                            "spinner",
                            { "title", "percentage", "message" },
                        },
                        colors = {
                            use = true,
                        },
                        separators = {
                            component = " ",
                            progress = " | ",
                            message = {
                                pre = "(",
                                post = ")",
                                commenced = "In Progress",
                                completed = "Completed",
                            },
                            percentage = { pre = "", post = "%% " },
                            title = { pre = "", post = ": " },
                            lsp_client_name = { pre = "[", post = "]" },
                            spinner = { pre = "", post = "" },
                        },
                        timer = {
                            progress_enddelay = 100,
                            spinner = 50,
                            lsp_client_name_enddelay = 150,
                        },
                        spinner_symbols = {
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                        },
                    },
                    {
                        "searchcount",
                        maxcount = 999,
                        timeout = 200,
                    },
                },
                lualine_x = {
                    {
                        "encoding",
                        show_bomb = false,
                    },
                    {
                        "fileformat",
                        symbols = {
                            unix = "",
                            dos = "",
                        },
                        cond = function()
                            return vim.fn.empty(vim.fn.expand("%")) == 0
                        end,
                        on_click = function()
                            local Menu = require("nui.menu")
                            local current_ff = vim.bo.fileformat
                            local menu_items = {
                                Menu.item("  unix (LF)", { ff = "unix" }),
                                Menu.item("  dos (CRLF)", { ff = "dos" }),
                            }

                            local menu = Menu({
                                position = "50%",
                                size = {
                                    width = 20,
                                    height = 4,
                                },
                                border = {
                                    style = "rounded",
                                    text = {
                                        top = " 󰈸 file format ",
                                        top_align = "center",
                                    },
                                },
                                win_options = {
                                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                                },
                            }, {
                                lines = menu_items,
                                max_width = 20,
                                keymap = vim.g.lualine_menu_keymap,
                                on_close = function() end,
                                on_submit = function(item)
                                    vim.bo.fileformat = item.ff
                                end,
                            })

                            menu:mount()

                            for i, item in ipairs(menu_items) do
                                if item.ff == current_ff then
                                    vim.api.nvim_win_set_cursor(menu.winid, { i, 0 })
                                    break
                                end
                            end
                        end,
                    },
                    {
                        "filetype",
                        colored = true,
                        icon_only = false,
                    },
                    "filesize",
                },
                lualine_y = {},
                lualine_z = {},
            },
            winbar = {},
            inactive_winbar = {},
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = { "nvim-tree" },
        },
    },
}

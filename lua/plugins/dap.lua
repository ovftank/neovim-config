return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("keymaps.dap")

            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" }
            )
            vim.fn.sign_define(
                "DapBreakpointCondition",
                { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
            )
            vim.fn.sign_define(
                "DapLogPoint",
                { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" }
            )
            vim.fn.sign_define(
                "DapStopped",
                { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "" }
            )
            vim.fn.sign_define(
                "DapBreakpointRejected",
                { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
            )

            dapui.setup({
                icons = { expanded = "", collapsed = "", current_frame = "" },
                mappings = {
                    expand = { "<2-LeftMouse>" },
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 1.0 },
                        },
                        position = "left",
                        size = 40,
                    },
                    {
                        elements = {
                            { id = "console", size = 1.0 },
                        },
                        position = "bottom",
                        size = 10,
                    },
                },
                controls = {
                    enabled = true,
                    element = "console",
                    icons = {
                        pause = "",
                        play = "",
                        step_into = "",
                        step_over = "",
                        step_out = "󰆸",
                        step_back = "",
                        run_last = "",
                        terminate = "",
                    },
                },
            })

            require("nvim-dap-virtual-text").setup({
                enabled = true,
                enabled_commands = true,
                highlight_changed_variables = true,
                highlight_new_as_changed = false,
                show_stop_reason = true,
                commented = false,
                only_first_definition = true,
                all_references = false,
                display_callback = function(variable)
                    return variable.name .. " = " .. variable.value
                end,
                virt_text_pos = "eol",
                all_frames = false,
                virt_lines_show_usage = true,
                virt_text_win_col = nil,
            })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            dap.adapters.python = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
                args = { "-m", "debugpy.adapter" },
            }

            dap.adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = {
                        vim.fn.stdpath("data")
                            .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                        "${port}",
                    },
                },
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "launch file",
                    program = "${file}",
                    console = "integratedTerminal",
                    justMyCode = false,
                },
            }

            dap.configurations.javascript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                },
            }

            dap.configurations.typescript = dap.configurations.javascript
        end,
    },
}

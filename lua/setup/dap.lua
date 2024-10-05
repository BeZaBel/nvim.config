return {
    setup = function()
        require("dapui").setup()
        require("nvim-dap-virtual-text").setup({})

        local dap = require("dap")
        local ui = require("dapui")

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = {
                "--interpreter=dap",
                "--eval-command",
                "set print pretty on",
            },
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Select and attach to process",
                type = "gdb",
                request = "attach",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                pid = function()
                    local name = vim.fn.input("Executable name (filter): ")
                    return require("dap.utils").pick_process({ filter = name })
                end,
                cwd = "${workspaceFolder}",
            },
            {
                name = "Attach to gdbserver :1234",
                type = "gdb",
                request = "attach",
                target = "localhost:1234",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
            },
        }

        local map = vim.keymap.set

        map("n", "<leader>b", dap.toggle_breakpoint)
        map("n", "<leader>gb", dap.run_to_cursor)

        map("n", "<leader>>", function()
            require("dapui").eval(nil, { enter = true })
        end)

        map("n", "<F1>", dap.continue)
        map("n", "<F2>", dap.step_into)
        map("n", "<F3>", dap.step_over)
        map("n", "<F4>", dap.step_out)
        map("n", "<F5>", dap.step_back)
        map("n", "<F12>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}

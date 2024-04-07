return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require('dap')
            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = function()
                        local tbl = {}
                        local str = vim.fn.input('Arguments: ')

                        for arg in (str .. " "):gmatch("(.-) ") do
                            table.insert(tbl, arg)
                        end

                        return tbl
                    end,
                },
            }
            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c
        end,
        event = "VeryLazy"
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
        event = "VeryLazy"
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                'codelldb',
            },
        },
        event = "VeryLazy"
    }
}

vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",
})

local map = vim.keymap.set
local dap = require('dap')
local dapui = require("dapui")
local opts = { noremap = true, silent = true }

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/bin/codelldb"),
        args = {"--port", "${port}"},
    }
}

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

map("n", "<leader>du", function() dapui.toggle() end, opts)
map("n", "<leader>dpc", function() dap.continue() end, opts)
map("n", "<leader>dpb", function() dap.toggle_breakpoint() end, opts)
map("n", "<leader>dpi", function() dap.step_into() end, opts)
map("n", "<leader>dpo", function() dap.step_over() end, opts)

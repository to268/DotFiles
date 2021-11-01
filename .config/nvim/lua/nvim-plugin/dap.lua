local dap = require('dap')
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local M = {}

M.setup = function()

    dap.adapters.python = {
        type = 'executable';
        command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
        args = { '-m', 'debugpy.adapter' };
    }
    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
        name = "lldb"
    }
    dap.configurations.c = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,

            cwd = '${workspaceFolder}',
            stopOnEntry = true,

            args = function()
                local tbl = {}
                local str = vim.fn.input('args: ')

                for arg in (str .. " "):gmatch("(.-) ") do
                    table.insert(tbl, arg)
                end

                return tbl
            end,

            env = function()
                local variables = {}
                for k, v in pairs(vim.fn.environ()) do
                    table.insert(variables, string.format("%s=%s", k, v))
                end
                return variables
            end,

            runInTerminal = false,
        },
    }
    dap.configurations.cpp = dap.configurations.c
    dap.configurations.rust = dap.configurations.c

    -- require("nvim-dap-virtual-text").setup()
    require("dapui").setup()
end

M.remap = function()
    map("n", "<F5>", ":lua require('dap').continue()<CR>", opts)
    map("n", "<F10>", ":lua require('dap').step_over()<CR>", opts)
    map("n", "<F11>", ":lua require('dap').step_into()<CR>", opts)
    map("n", "<F12>", ":lua require('dap').step_out()<CR>", opts)
    map("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>", opts)
    map("n", "<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
    map("n", "<leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
    map("n", "<leader>dr", ":lua require('dap').repl.open()<CR>", opts)
    map("n", "<leader>dl", ":lua require('dap').run_last()<CR>", opts)
    map("n", "<leader>du", ":lua require('dapui').toggle()<CR>", opts)
end

return M

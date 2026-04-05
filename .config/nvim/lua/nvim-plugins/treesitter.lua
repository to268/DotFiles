local autocmd = vim.api.nvim_create_autocmd

vim.pack.add({
    {
    	src = "https://github.com/nvim-treesitter/nvim-treesitter",
    	branch = "main",
    },
    "https://github.com/nvim-treesitter/nvim-treesitter-context"
})

autocmd('PackChanged', {
    callback = function(event)
        if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
            vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
            else
                vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
            end
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        local excluded = {
            FTerm = true,
            TelescopePrompt = true,
            TelescopeResults = true,
            ["dap-repl"] = true,
            ["nvim-pack"] = true,
            cmp_docs = true,
            cmp_menu = true,
            dapui_breakpoints = true,
            dapui_console = true,
            dapui_hover = true,
            dapui_scopes = true,
            dapui_stacks = true,
            dapui_watches = true,
            env = true,
            git = true,
            harpoon = true,
            mason = true,
            mininotify = true,
            oil = true,
            oil_preview = true,
            qf = true,
        }

        if not excluded[vim.bo.filetype] then
            vim.treesitter.start()
        end
    end,
})

autocmd('User', {
    pattern = 'TSUpdate',
    callback = function()
        require('nvim-treesitter.parsers').rstml = {
            install_info = {
                url = 'https://github.com/rayliwell/tree-sitter-rstml',
                location = 'rstml',
            },
        }
        require('nvim-treesitter.parsers').rust_with_rstml = {
            install_info = {
                url = 'https://github.com/rayliwell/tree-sitter-rstml',
                location = 'rust_with_rstml',
            },
        }
    end
})

require('nvim-treesitter').setup({})
require('nvim-treesitter').install({
    'asm',
    'astro',
    'awk',
    'bash',
    'bibtex',
    'c',
    'c_sharp',
    'cmake',
    'cpp',
    'css',
    'csv',
    'cuda',
    'diff',
    'disassembly',
    'dockerfile',
    'dot',
    'doxygen',
    'editorconfig',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'go',
    'gpg',
    'haskell',
    'helm',
    'hlsl',
    'html',
    'html_tags',
    'http',
    'hyprlang',
    'ini',
    'java',
    'javascript',
    'jq',
    'json',
    'latex',
    'linkerscript',
    'llvm',
    'lua',
    'luadoc',
    'make',
    'markdown',
    'meson',
    'mlir',
    'nasm',
    'nginx',
    'ninja',
    'objdump',
    'ocaml',
    'pem',
    'perl',
    'php',
    'proto',
    'python',
    'rst',
    'ruby',
    'rust',
    'scheme',
    'scss',
    'sql',
    'tablegen',
    'terraform',
    'tmux',
    'toml',
    'typescript',
    'vim',
    'vimdoc',
    'vue',
    'wgsl',
    'xml',
    'yaml',
    'zathurarc',
    'zig',
    'zsh',
}):wait(300000)

---@type vim.lsp.Config
return {
    cmd = { 'astro-ls', '--stdio' },
    filetypes = { 'astro' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    init_options = {
        typescript = {},
    },
    before_init = function(_, config)
        if config.init_options and config.init_options.typescript and not config.init_options.typescript.tsdk then
            config.init_options.typescript.tsdk = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/packages/typescript-language-server/node_modules/typescript/lib")
        end
    end,
}

local function get_command()
    local cmd = { 'tblgen-lsp-server' }
    local files = vim.fs.find(
        { 'tablegen_compile_commands.yml', 'build/tablegen_compile_commands.yml' },
        { path = vim.fn.expand('%:p:h'), upward = true, type = 'file' }
    )
    if #files > 0 then
        local file = files[1]
        table.insert(cmd, '--tablegen-compilation-database=' .. file)
    end

    return cmd
end

---@type vim.lsp.Config
return {
    cmd = get_command(),
    filetypes = { 'tablegen' },
    root_markers = { 'tablegen_compile_commands.yml', '.git' },
}

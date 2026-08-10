return {
    cmd = function(dispatchers, _)
        local cmd = 'vscode-css-language-server'
        return vim.lsp.rpc.start({ cmd, '--stdio' }, dispatchers)
    end,
    filetypes = { 'css', 'scss', 'less' },
    init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
    root_markers = { 'package.json', '.git' },
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
    on_attach = function(client, _)
        -- disable formatter
        client.server_capabilities.documentFormattingProvider = false
    end,
}

return {
    cmd = { "clangd", "--fallback-style=none" },     -- prevents fallback to LLVM
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
        end
        vim.bo[bufnr].tabstop = 4
        vim.bo[bufnr].shiftwidth = 4
        vim.bo[bufnr].expandtab = false
    end,
    settings = {
        clangd = {
            fallbackFlags = { "-std=c99" },
        },
    },
}

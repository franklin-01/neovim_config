return {
    cmd = { "clangd", "--fallback-style=none" },     -- prevents fallback to LLVM
    on_attach = function(_, bufnr)
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

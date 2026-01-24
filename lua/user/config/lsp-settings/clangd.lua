return {
    cmd = { "clangd" },
    on_attach = function(_, bufnr)
        vim.bo[bufnr].tabstop = 4
        vim.bo[bufnr].shiftwidth = 4
        vim.bo[bufnr].expandtab = false
    end,
    init_options = {
        fallbackFlags = {
            "-std=c99",
            "-I/usr/include/freetype2",
            "-I/usr/include/libpng16",
            "-I/usr/include/X11",
        },
    },
}

local M = {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
}

function M.config()
    require("lsp_lines").setup()
    vim.diagnostic.config({
        virtual_lines = { only_current_line = true },
    })
end

return M

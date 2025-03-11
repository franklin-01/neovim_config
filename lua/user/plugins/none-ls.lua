local M = {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

function M.config()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    -- local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
        debug = false,
        sources = {
            formatting.stylua.with({
                extra_args = {
                    "--indent-type",
                    "Spaces",
                    "--indent-width",
                    "4",
                    "--collapse-simple-statement",
                    "Always",
                    "--column-width",
                    "80",
                },
            }),
            formatting.black.with({
                extra_args = { "--line-length", "79" },
            }),
            formatting.pg_format,
        },
    })
end

return M

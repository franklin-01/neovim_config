local M = {
    "local/module",
    enabled = false,
}

M.maps = function(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

M.LoadKeyMaps = function()
    local wk = require("which-key")
    wk.add({
        -- go to
        { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>",                        desc = "Go to definition", },
        { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",                       desc = "Go to declaration", },
        { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",                    desc = "Go to implementation", },
        { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>",                        desc = "Show references", },
        { "<leader>gk", "<cmd>lua vim.lsp.buf.hover()<cr>",                             desc = "Show information", },
        { "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<cr>",                     desc = "Show Diagnostic", },
        -- other lsp stuff
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                       desc = "Code Action", },
        { "<leader>lh", "<cmd>lua require('user.config.lsp').toggle_inlay_hints()<cr>", desc = "Hints", },
        { "<leader>li", "<cmd>LspInfo<cr>",                                             desc = "Info" },
        { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",                      desc = "Next Diagnostic", },
        { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                      desc = "Prev Diagnostic", },
        { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                          desc = "CodeLens Action", },
        { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",                     desc = "Quickfix", },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                            desc = "Rename", },
        {
            "<leader>lf",
            "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
            desc = "Format",
        },
    })
end

return M

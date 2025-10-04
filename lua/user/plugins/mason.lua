local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
}

function M.config()
    local servers = require("user.config.lsp.servers")

    require("mason").setup({
        ui = {
            border = "rounded",
            icons = {
                package_installed = " ✓ ",
                package_pending = " ➜ ",
                package_uninstalled = " ✗ ",
            },
        },
    })

    require("mason-lspconfig").setup({
        ensure_installed = servers.list,
    })
end

return M

local M = {
    "neovim/nvim-lspconfig",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "folke/neodev.nvim",
        },
    },
}

function M.config()
    -- imports
    local key = require("user.config.lsp.keymaps")
    local servers = require("user.config.lsp.servers")
    local configs = require("user.config.lsp.configs")

    -- load shortcuts
    key.LoadKeyMaps()

    configs.loadDialogConfig()

    for _, server in pairs(servers.list) do
        local require_ok, settings = pcall(require, "user.config.lsp-settings." .. server)
        local opts = {}
        if require_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        vim.lsp.config(server, opts)
    end

    vim.lsp.enable("sourcekit")
    local ok, swift_config = pcall(require, "user.config.lsp-settings.sourcekit")
    if ok then
        vim.lsp.config("sourcekit", swift_config)
    end
end

return M

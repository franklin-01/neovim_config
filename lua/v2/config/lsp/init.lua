local M = require "base.module"

function M:load()
    require("v2.config.lsp.keymaps"):load()
    require("v2.config.lsp.diagnostic"):load()
    local servers = require("v2.config.lsp.servers")

    for _, server in pairs(servers.list) do
        local require_ok, settings = pcall(require, "v2.config.lsp.servers." .. server)
        if require_ok then
            vim.lsp.config(server, settings)
        end
    end
end

return M

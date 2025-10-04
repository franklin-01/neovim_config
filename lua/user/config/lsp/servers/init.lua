local M = {
    "local/module",
    enabled = false,
}

M.list = {
    "bashls",
    "vtsls",
    "biome",
    "cssls",
    "gopls",
    "html",
    "lua_ls",
    "pyright",
    "tailwindcss",
    -- "rust_analyzer",
    "clangd",
    "sqls",
    "dockerls",
    "docker_compose_language_service",
    "rnix",
    "yamlls",
    "jsonls",
    "intelephense",
}


M.is_lsp_attached = function(name)
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
        if client.name == name then
            return true
        end
    end
    return false
end

return M

local M = {
    "local/module",
    enabled = false,
}

function M.common_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.onTypeFormatting = {
        dynamicRegistration = true,
    }
    capabilities.workspace.workspaceFolders = true
    return capabilities
end

return M

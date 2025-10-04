local icons = require("user.extra.icons")

local M = {
    "local/module",
    enabled = false,
}

local default_diagnostic_config = {
    signs = {
        active = true,
        values = {
            {
                name = "DiagnosticSignError",
                text = icons.diagnostics.Error,
            },
            {
                name = "DiagnosticSignWarn",
                text = icons.diagnostics.Warning,
            },
            {
                name = "DiagnosticSignHint",
                text = icons.diagnostics.Hint,
            },
            {
                name = "DiagnosticSignInfo",
                text = icons.diagnostics.Information,
            },
        },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

M.loadDialogConfig = function()
    local diag_config = vim.diagnostic.config(default_diagnostic_config)
    if diag_config then
        for _, sign in ipairs(vim.tbl_get(diag_config, "signs", "values") or {}) do
            vim.fn.sign_define(sign.name, {
                texthl = sign.name,
                text = sign.text,
                numhl = sign.name,
            })
        end
    end
end

return M

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

    -- enable the language server
    vim.lsp.enable('kotlin_lsp')

    -- configure language server's options
    -- vim.lsp.config('kotlin_lsp', {
    --     single_file_support = true,
    --     cmd = { "kotlin-ls", "--stdio" },
    --     filetypes = { "kotlin" },
    --     root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
    -- })

    -- vim.lsp.config("kotlin_lsp", {
    --     cmd = { "kotlin-ls", "--stdio" },
    --     filetypes = { "kotlin" },
    --     flags = {
    --         debounce_text_changes = 300,
    --         allow_incremental_sync = true,
    --     },
    --
    --     single_file_support = false,
    --
    --     on_attach = function(client, _)
    --         client.server_capabilities.semanticTokensProvider = nil
    --     end,
    --
    --     settings = {
    --         kotlin = {
    --             indexing = {
    --                 enabled = true,
    --                 exclude = {
    --                     "**/build/**",
    --                     "**/.gradle/**",
    --                     "**/target/**",
    --                     "**/.idea/**",
    --                 },
    --             },
    --
    --             completion = {
    --                 snippets = true,
    --                 autoImport = true,
    --             },
    --
    --             diagnostics = {
    --                 enabled = true,
    --             },
    --         },
    --     },
    --
    --     root_dir = function(bufnr, on_dir)
    --         -- Strong markers FIRST
    --         local gradle_markers = {
    --             'settings.gradle.kts',
    --             'settings.gradle',
    --             'build.gradle.kts',
    --             'build.gradle',
    --             'gradlew',
    --         }
    --
    --         local root = vim.fs.root(bufnr, gradle_markers)
    --
    --         -- Fallback to git
    --         if not root then
    --             root = vim.fs.root(bufnr, { '.git' })
    --         end
    --
    --         -- Final fallback
    --         root = root or vim.fn.getcwd()
    --
    --         on_dir(root)
    --     end,
    --
    -- })
end

return M

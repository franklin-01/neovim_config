local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
}

function M.config()
    local servers = {
        -- python
        -- "ruff",
        -- "black",
        "pyright",
        --"flake8",
        -- lua
        "lua_ls",
        -- "stylua",
        -- bash
        "bashls",
        -- js, ts, html, css
        "ts_ls",
        "biome",
        "html",
        "cssls",
        "tailwindcss",
        -- go
        "gopls",
        -- rust
        -- "rust_analyzer",
        -- c, c++
        "clangd",
        -- docker, docker-compose
        "dockerls",
        "docker_compose_language_service",
        -- nix
        -- "rnix",
        -- yaml
        "yamlls",
        -- json
        "jsonls",
    }

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
        ensure_installed = servers,
    })
end

return M

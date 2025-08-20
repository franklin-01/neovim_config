local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local servers = {
    "pyright",
    "lua_ls",
    "bashls",
    "ts_ls",
    "biome",
    "html",
    "cssls",
    "tailwindcss",
    -- "gopls",
    -- rust
    -- "rust_analyzer",
    -- c, c++
    "clangd",
    -- docker, docker-compose
    "dockerls",
    "docker_compose_language_service",
    "yamlls",
    "jsonls",
    -- "goimports",
    -- "gofumpt",
    -- "gomodifytags",
    -- "impl",
    -- "delve"
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

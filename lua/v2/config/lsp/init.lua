local M = require "base.module"
function M:load()
    require("v2.config.lsp.keymaps"):load()
    vim.pack.add {
        { src = 'https://github.com/neovim/nvim-lspconfig' },
        { src = 'https://github.com/mason-org/mason.nvim' },
        { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    }
    require('mason').setup({
        automatic_enable = {
            exclude = { "dart" }
        }
    })
    require('mason-lspconfig').setup()
    vim.lsp.automatic_servers_installation = false
end

return M

return require("base.plugin"):new({
    name = "mason",
    src = "https://github.com/mason-org/mason.nvim",
    deps = {
        { src = 'https://github.com/neovim/nvim-lspconfig' },
        { src = 'https://github.com/mason-org/mason.nvim' },
        { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    },
    config = function(self)
        self.setup({
            automatic_enable = {
                exclude = { "dart" }
            },
            ui = {
                border = "rounded",
                icons = {
                    package_installed = " ✓ ",
                    package_pending = " ➜ ",
                    package_uninstalled = " ✗ ",
                },
            }
        })
        require('mason-lspconfig').setup()
    end
})

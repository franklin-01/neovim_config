return require("base.plugin"):new({
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    config = function(self)
        self.setup {
            ensure_installed = {
                "lua",
                "bash",
                "python",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "tsx",
                "go",
                "c",
                "sql",
                "yaml",
                "json",
                "html",
                "css",
                "html",
                "gotmpl",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = false },
            auto_install = true,
            sync_install = true,
        }
    end
})

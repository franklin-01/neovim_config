return require("base.plugin"):new({
    name = "onedark",
    src = "https://github.com/navarasu/onedark.nvim",
    deps = nil,
    priority = 1000,
    config = function(self)
        self.setup {
            style = 'warmer'
        }
        self.load()
    end,
    keymaps = nil
})

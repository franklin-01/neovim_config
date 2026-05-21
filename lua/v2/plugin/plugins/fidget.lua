return require("base.plugin"):new({
    name = "fidget",
    src = "https://github.com/j-hui/fidget.nvim",
    config = function(self)
        require("vim._core.ui2").enable({})
        vim.notify = require("fidget.notification").notify
        self.setup({
            notification = {
                window = {
                    border = "rounded",
                },
            },
        })
    end
})

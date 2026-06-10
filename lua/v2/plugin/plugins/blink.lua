return require("base.plugin"):new({
    name = "blink.cmp",
    src = "https://github.com/saghen/blink.cmp",
    deps = {
        { src = "https://github.com/saghen/blink.lib" }
    },
    config = function(self)
        self.build():pwait()
        self.setup({
            completion = { documentation = { auto_show = true } }
        })
    end
})

return require("base.plugin"):new({
    name = "blink.cmp",
    src = "https://github.com/saghen/blink.cmp",
    deps = {
        { src = "https://github.com/saghen/blink.lib" }
    },
    config = function(self)
        self.build():pwait()
        self.setup({
            completion = {
                documentation = { auto_show = false },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
            },
            signature = { enabled = true },
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            }
        })
    end
})

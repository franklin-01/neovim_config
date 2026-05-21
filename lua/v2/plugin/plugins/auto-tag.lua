return require("base.plugin"):new({
    name = "nvim-ts-autotag",
    src = "https://github.com/windwp/nvim-ts-autotag",
    config = function(self)
        self.setup {
            opts = {
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = true, -- Auto close on trailing </
            },
        }
    end
})

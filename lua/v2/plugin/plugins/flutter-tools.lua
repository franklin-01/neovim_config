return require("base.plugin"):new({
    name = "flutter-tools",
    src = "https://github.com/nvim-flutter/flutter-tools.nvim",
    deps = {
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/stevearc/dressing.nvim" },
    },
    config = function(self)
        self.setup {
            widget_guides = {
                enabled = true,
            },
            lsp = {
                color = { -- show the derived colours for dart variables
                    enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                    background = true, -- highlight the background
                    background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
                    foreground = true, -- highlight the foreground
                    virtual_text = true, -- show the highlight using virtual text
                    virtual_text_str = "■", -- the virtual text character to highlight
                }
            }
        }
    end
})

local wk = require("which-key")
local icons = require("user.extra.icons")

return require("base.plugin"):new({
    name = "nvim-navbuddy",
    src = "https://github.com/SmiteshP/nvim-navbuddy",
    deps = {
        { src = "https://github.com/SmiteshP/nvim-navic" },
        { src = "https://github.com/MunifTanjim/nui.nvim" },
    },
    config = function(self)
        wk.add({
            { "<leader>o", "<cmd>Navbuddy<cr>", desc = "Nav" },
        })

        self.setup({
            window = { border = "rounded" },
            icons = icons.kind,
            lsp = { auto_attach = true },
        })
    end,
})

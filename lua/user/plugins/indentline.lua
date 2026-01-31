local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
}

function M.config()
    local icons = require("user.extra.icons")

    require("ibl").setup({
        indent = {
            char = icons.ui.LineMiddle,
        },

        scope = {
            enabled = true,
            char = icons.ui.LineMiddle,
            show_start = false,
            show_end = false,
        },

        exclude = {
            buftypes = { "terminal", "nofile" },
            filetypes = {
                "help",
                "startify",
                "dashboard",
                "lazy",
                "neogitstatus",
                "NvimTree",
                "Trouble",
                "text",
            },
        },
    })
end

return M

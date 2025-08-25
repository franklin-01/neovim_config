local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}

local kind_icons = {
    Text = "󰊄",
    Method = "",
    Function = "󰡱",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = " ",
    Interface = "ﰮ",
    Module = " ",
    Property = " ",
    Unit = " ",
    Value = "",
    Enum = " ",
    Keyword = "",
    Snippet = " ",
    Color = "",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
local border_config = { style = "double" }

function M.config()
    require("noice").setup({
        popupmenu = {
            enabled = true,
            backend = "nui",
            kind_icons = kind_icons,
        },
        views = {
            popup = {
                backend = "popup",
                border = border_config
            },
            cmdline = {
                backend = "cmdline",
                border = border_config
            },
            popupmenu = {
                backend = "popupmenu",
                border = border_config
            },
            split = {
                backend = "split",
                border = border_config
            },
            mini = {
                backend = "mini",
                relative = "editor",
                align = "message-right",
                timeout = 3000,
                reverse = true,
                position = { row = 2, col = "100%" },
                border = border_config,
            },
            hover = {
                border = border_config,
                win_options = {
                    winhighlight = {
                        Normal = "Normal",
                        FloatBorder = "FloatBorder",
                    },
                },
            },
        },
        lsp = {
            hover = { enabled = true, view = "hover" },
            signature = { enabled = true, view = "hover" },
        },
    })
end

return M

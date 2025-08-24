local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- "rcarriga/nvim-notify",
    },
}

function M.config()
    require("noice").setup({
        popupmenu = {
            enabled = true,
        },
        views = {
            hover = {
                border = {
                    style = "rounded",
                },
                win_options = {
                    winhighlight = {
                        Normal = "Normal",
                        FloatBorder = "FloatBorder",
                    },
                },
            },
            popup = {
                backend = "popup",
                relative = "editor",
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                position = "50%",
                size = {
                    width = 60,
                    height = "auto",
                },
                win_options = {
                    winhighlight = {
                        Normal = "Normal",
                        FloatBorder = "FloatBorder",
                    },
                },
            },
            mini = {
                backend = "mini",
                relative = "editor",
                align = "message-left",
                timeout = 3000,
                reverse = true,
                border = {
                    style = "single",
                },
            },
            routes = {
                {
                    filter = { event = "msg_show", kind = "error" },
                    view = "popup",
                },
            },
            lsp = {
                hover = {
                    enabled = true,
                    view = "hover",
                },
                signature = {
                    enabled = true,
                    view = "hover",
                },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    -- ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    -- ["vim.lsp.util.stylize_markdown"] = true,
                    -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                -- bottom_search = true, -- use a classic bottom cmdline for search
                -- command_palette = true, -- position the cmdline and popupmenu together
                -- long_message_to_split = false, -- long messages will be sent to a split
                -- inc_rename = true, -- enables an input dialog for inc-rename.nvim
                -- lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        }
    })
end

return M

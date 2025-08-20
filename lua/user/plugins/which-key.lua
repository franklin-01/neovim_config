---@diagnostic disable: undefined-global
local M = {
    "folke/which-key.nvim",
    lazy = true,
    dependencies = {
        "echasnovski/mini.icons",
    },
}

function M.config()
    local wk = require("which-key")

    wk.add({
        { "<leader>T",  group = "Treesitter" },
        { "<leader>a",  group = "Tab" },
        { "<leader>aN", "<cmd>tabnew %<cr>",   desc = "New Tab" },
        { "<leader>ah", "<cmd>-tabmove<cr>",   desc = "Move Left" },
        { "<leader>al", "<cmd>+tabmove<cr>",   desc = "Move Right" },
        { "<leader>an", "<cmd>$tabnew<cr>",    desc = "New Empty Tab" },
        { "<leader>ao", "<cmd>tabonly<cr>",    desc = "Only" },
        { "<leader>b",  group = "Buffers" },
        { "<leader>d",  group = "Debug" },
        { "<leader>f",  group = "Find" },
        { "<leader>g",  group = "Git" },
        { "<leader>h",  "<cmd>nohlsearch<CR>", desc = "NOHL" },
        { "<leader>l",  group = "LSP" },
        { "<leader>p",  group = "Plugins" },
        { "<leader>q",  "<cmd>confirm q<CR>",  desc = "Quit" },
        {
            "<leader>w",
            function()
                -- vim.lsp.buf.format({ async = false })
                vim.api.nvim_command("w")
            end,
            desc = "Save",
            mode = "n",
        },
    })

    wk.setup({
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = false,
                g = false,
            },
        },
        filter = function(mapping)
            return mapping.desc and mapping.desc ~= ""
        end,
        win = {
            no_overlap = true,
            border = "rounded",
            padding = { 1, 2 },
            zindex = 1000,
            title = true,
            title_pos = "center",
        },
        show_help = false,
        show_keys = false,
        disable = {
            buftypes = {},
            filetypes = { "TelescopePrompt" },
        },
    })
end

return M

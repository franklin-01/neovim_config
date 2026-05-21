return require("base.plugin"):new({
    name = "which-key",
    src = "https://github.com/folke/which-key.nvim",
    deps = { { src = "https://github.com/echasnovski/mini.icons" } },
    config = function(self)
        self.setup {
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
        }

        self.add {
            { "<leader>T",  group = "Treesitter" },
            { "<leader>a",  group = "Tab" },
            { "<leader>b",  group = "Buffers" },
            { "<leader>d",  group = "Debug" },
            { "<leader>f",  group = "Find" },
            { "<leader>G",  group = "Git" },
            { "<leader>g",  group = "Go to" },
            { "<leader>r",  group = "Run" },
            { "<leader>h",  "<cmd>nohlsearch<CR>",       desc = "NOHL" },
            { "<leader>l",  group = "LSP" },
            { "<leader>p",  group = "Plugins" },
            { "<leader>q",  "<cmd>confirm q<CR>",        desc = "Quit" },
            { "<leader>w",  "<cmd> w<CR>", desc = "Save",         mode = "n" },
        }

        -- local runner = require("user.plugins.run-map")
        -- runner.config()
    end,
    keymaps = nil
})

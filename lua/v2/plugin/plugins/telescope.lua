return require("base.plugin"):new({
    name = "telescope",
    src = "https://github.com/nvim-telescope/telescope.nvim",
    deps = {
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    },
    config = function(self)
        local wk = require "which-key"
        wk.add({
            { "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>",                       desc = "Find" },
            { "<leader>fb", "<cmd>Telescope git_branches<cr>",                                  desc = "Checkout branch" },
            { "<leader>fc", "<cmd>Telescope colorscheme<cr>",                                   desc = "Colorscheme" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>",                                    desc = "Find files" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",                                     desc = "Help" },
            { "<leader>fl", "<cmd>Telescope resume<cr>",                                        desc = "Last Search" },
            { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                                      desc = "Recent File" },
            { "<leader>ft", "<cmd>Telescope live_grep<cr>",                                     desc = "Find Text" },
        })

        local icons = require "v2.extra.icons"

        self.setup {
            defaults = {
                reuse_win = false,
                winblend = 0,
                borderchars = {
                    prompt = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }, -- input/prompt
                    results = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }, -- results window
                    preview = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }, -- preview window
                },
                prompt_prefix = icons.ui.Telescope .. " ",
                selection_caret = icons.ui.Forward .. " ",
                entry_prefix = "   ",
                initial_mode = "insert",
                selection_strategy = "reset",
                path_display = { "smart" },
                color_devicons = true,
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--glob=!.git/",
                    "--ignore-vcs" -- <- ESSENCIAL para respeitar o .gitignore
                },
            },
            pickers = {
                live_grep = {
                    theme = "dropdown",
                },

                grep_string = {
                    theme = "dropdown",
                },

                find_files = {
                    theme = "dropdown",
                    previewer = true,
                },

                planets = {
                    show_pluto = true,
                    show_moon = true,
                },

                colorscheme = {
                    enable_preview = true,
                },

                lsp_references = {
                    theme = "dropdown",
                    initial_mode = "normal",
                },

                lsp_definitions = {
                    theme = "dropdown",
                    initial_mode = "normal",
                },

                lsp_declarations = {
                    theme = "dropdown",
                    initial_mode = "normal",
                },

                lsp_implementations = {
                    theme = "dropdown",
                    initial_mode = "normal",
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
            },
        }
    end,
    keymaps = nil
})

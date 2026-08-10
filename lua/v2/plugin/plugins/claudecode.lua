local wk = require("which-key")

return require("base.plugin"):new({
    name = "claudecode",
    src = "https://github.com/coder/claudecode.nvim",
    deps = {
        { src = "https://github.com/folke/snacks.nvim" },
    },
    config = function(self)
        local toggle_key = "<C-,>"
        self.setup({
            terminal = {
                snacks_win_opts = {
                    position = "right",
                    width = 0.4,
                    height = 0.7,
                    keys = {
                        claude_hide = {
                            toggle_key,
                            function(s)
                                s:hide()
                            end,
                            mode = "t",
                            desc = "Hide",
                        },
                    },
                },
            }
        })
        wk.add({
            { "<leader>a",  group = "AI/Claude Code" },
            { "<leader>ac", "<cmd>ClaudeCode<cr>",              desc = "Toggle Claude" },
            { toggle_key,   "<cmd>ClaudeCodeFocus<cr>",         desc = "Focus Claude" },
            { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",     desc = "Resume Claude" },
            { "<leader>aC", "<cmd>ClaudeCode --continue<cr>",   desc = "Continue Claude" },
            { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>",   desc = "Select Claude model" },
            { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",         desc = "Add current buffer" },
            { "<leader>as", "<cmd>ClaudeCodeSend<cr>",          mode = "v",                  desc = "Send to Claude" },
            { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",    desc = "Accept diff" },
            { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",      desc = "Deny diff" },
            { "<leader>ai", "<cmd>ClaudeCodeStatus<cr>",        desc = "Claude status" },
            { "<leader>aD", "<cmd>ClaudeCodeCloseAllDiffs<cr>", desc = "Close all diffs" },
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "NvimTree",
                "neo-tree",
                "oil",
                "minifiles",
                "netrw",
                "snacks_picker_list",
            },
            callback = function(event)
                wk.add({
                    {
                        "<leader>as",
                        "<cmd>ClaudeCodeTreeAdd<cr>",
                        desc = "Add file",
                        buffer = event.buf,
                    },
                })
            end,
        })
    end,
})

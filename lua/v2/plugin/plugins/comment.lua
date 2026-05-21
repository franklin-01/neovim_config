local wk = require("which-key")

return require("base.plugin"):new({
    name = "Comment",
    src = "https://github.com/numToStr/Comment.nvim",
    deps = { { src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" } },
    config = function(self)
        wk.add({
            { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment", mode = "n" },
            { "<leader>/", "<Plug>(comment_toggle_linewise_visual)",  desc = "Comment", mode = "v" },
        })

        vim.g.skip_ts_context_commentstring_module = true
        ---@diagnostic disable: missing-fields
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })

        self.setup {
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
    end
})

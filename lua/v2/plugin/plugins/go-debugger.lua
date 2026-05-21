return require("base.plugin"):new({
    name = "dap",
    src = "https://github.com/mfussenegger/nvim-dap",
    deps = {
        { src = "https://github.com/leoluz/nvim-dap-go" },
        { src = "https://github.com/rcarriga/nvim-dap-ui" },
        { src = "https://github.com/nvim-neotest/nvim-nio" }
    },
    config = function(self)
        local wk = require("which-key")
        local dapui = require("dapui")

        dapui.setup()
        require("dap-go").setup({
            delve = { args = { "--log", "--log-output=debugger" } }
        })

        -- Open UI when session starts
        self.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        -- Close UI when session ends
        self.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        self.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        wk.add({
            { "<leader>dm", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
            { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue" },
            { "<leader>dx", "<cmd>DapTerminate<cr>",        desc = "Terminate" },
            { "<leader>dn", "<cmd>DapStepOver<cr>",         desc = "Step Over" },
            { "<leader>di", "<cmd>DapStepInto<cr>",         desc = "Step Into" }
        })
    end
})

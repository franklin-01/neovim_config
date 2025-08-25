local M = {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
}

function M.config()
    local wk = require("which-key")
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    require("dap-go").setup({
        delve = { args = { "--log", "--log-output=debugger" } }
    })

    -- Open UI when session starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end

    -- Close UI when session ends
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
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

return M

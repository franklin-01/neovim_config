local M = {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
}

function M.config()
    local wk = require "which-key"
    require("dapui").setup()
    require("dap-go").setup()

    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end

    wk.add({
        { "<leader>dm", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
        { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue" },
        { "<leader>dx", "<cmd>DapTerminate<cr>",        desc = "Terminate" },
        { "<leader>dn", "<cmd>DapStepOver<cr>",         desc = "Step Over" }
    })
end

return M

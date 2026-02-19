local M = {
    "local/run-module",
    enabled = false,
}

function M.config()
    local wk = require("which-key")
    wk.add({
        -- { "<leader>rK", "<cmd>TermExec cmd='kotlinc Main.kt -include-runtime -d app.jar && java -jar app.jar'<cr>", desc = "Run kotlin main file" },
        { "<leader>rk", "<cmd>TermExec cmd='./gradlew run -q'<cr>", desc = "Kotlin" },
        { "<leader>rs", "<cmd>TermExec cmd='./gradlew bootRun -q'<cr>", desc = "Kotlin SpringBoot" },
        { "<leader>rg", "<cmd>TermExec cmd='go run main.go'<cr>", desc = "Go" },
        { "<leader>rb", "<cmd>TermExec cmd='bun run dev'<cr>", desc = "Bun" },
    })
end

return M

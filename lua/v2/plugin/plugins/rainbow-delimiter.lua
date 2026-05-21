return require("base.plugin"):new({
    name = "rainbow-delimiters",
    src = "https://github.com/HiPhish/rainbow-delimiters.nvim",
    config = function(self)
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = self.strategy["global"],
                vim = self.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            priority = {
                [""] = 110,
                lua = 210,
            },
            highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            },
        }
    end
})

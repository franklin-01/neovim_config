return require("base.plugin"):new({
    name = "tenaille",
    src = "https://github.com/doums/tenaille.nvim",
    config = function(self)
        self.setup {
            -- disable default key mapping
            default_mapping = false,
        }

        vim.keymap.set("v", '"', function()
            self.wrap({ '"', '"' })
        end)
        vim.keymap.set("v", "'", function()
            self.wrap({ "'", "'" })
        end)
        vim.keymap.set("v", "`", function()
            self.wrap({ "`", "`" })
        end)
        vim.keymap.set("v", "(", function()
            self.wrap({ "(", ")" })
        end)
        vim.keymap.set("v", "[", function()
            self.wrap({ "[", "]" })
        end)
        vim.keymap.set("v", "{", function()
            self.wrap({ "{", "}" })
        end)
        vim.keymap.set("v", "<>", function()
            self.wrap({ "<", ">" })
        end)
    end
})

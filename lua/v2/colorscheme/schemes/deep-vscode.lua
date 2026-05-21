return require("base.plugin"):new({
    name = "vscode",
    src = "https://github.com/franklin-01/deep-vscode.nvim",
    deps = nil,
    priority = 1000,
    config = function(self)
        self.setup {
            --          Enable italic comment
            italic_comments = true,

            --          Underline `@markup.link.*` variants
            underline_links = true,
            --
            --          Disable nvim-tree background color
            disable_nvimtree_bg = true,

            --         Override colors (see ./lua/vscode/colors.lua)
            -- color_overrides = {
            --     vscLineNumber = '#FFFFFF',
            -- },
            --          Override highlight groups (see ./lua/vscode/theme.lua)
            -- group_overrides = {
            --              this supports the same val table as vim.api.nvim_set_hl
            --              use colors from this colorscheme by requiring vscode.colors!
            -- },
        }
        vim.g.background = "dark"
        vim.cmd("colorscheme vscode")
    end,
    keymaps = nil
})

return require("base.plugin"):new({
    name = "gruvbox-material",
    src = "https://github.com/sainnhe/gruvbox-material",
    deps = nil,
    priority = 1000,
    customConfig = function()
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_enable_bold = 0
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_disable_italic = 0
        vim.g.gruvbox_material_disable_italic_comment = 0
        vim.g.gruvbox_material_current_word = "high contrast background"
        vim.g.gruvbox_material_better_performance = 1
        -- vim.g.gruvbox_material_foreground = "original"
        vim.cmd.colorscheme("gruvbox-material")
        vim.api.nvim_set_hl(0, "Normal", {bg = "#000000"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#000000"})
    end,
    keymaps = nil
})

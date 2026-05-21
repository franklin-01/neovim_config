return require("base.plugin"):new({
    name = "nvim-autopairs",
    src = "https://github.com/windwp/nvim-autopairs",
    config = {
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
    }
})

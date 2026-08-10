local M = require 'base.module'

function M:load()
    require("v2.plugin.plugins.which-key")
    require("v2.plugin.plugins.nvim-tree")
    require("v2.plugin.plugins.dev-icons")
    require("v2.plugin.plugins.hardline")
    require("v2.plugin.plugins.project")
    require("v2.plugin.plugins.telescope")
    require("v2.plugin.plugins.lua-line")
    require("v2.plugin.plugins.toggle-term")
    require("v2.plugin.plugins.comment")
    require("v2.plugin.plugins.auto-pair")
    require("v2.plugin.plugins.git-sign")
    require("v2.plugin.plugins.highlight-color")
    require("v2.plugin.plugins.nav-buddy")
    require("v2.plugin.plugins.tenaille")
    require("v2.plugin.plugins.rainbow-delimiter")
    require("v2.plugin.plugins.treesitter")
    require("v2.plugin.plugins.auto-tag")
    require("v2.plugin.plugins.fidget")
    require("v2.plugin.plugins.mason")
    require("v2.plugin.plugins.blink")
    ------------------------------------------------------
    require("v2.plugin.plugins.gopher")
    require("v2.plugin.plugins.go-debugger")
    ------------------------------------------------------
    require("v2.plugin.plugins.flutter-tools")
    ------------------------------------------------------
    -- require("v2.plugin.plugins.rustaceanvim")
    ------------------------------------------------------
    require("v2.plugin.plugins.claudecode")
end

return M

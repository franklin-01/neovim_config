local M = require 'base.module'

function M:load()
    require("v2.config"):load()
    require("v2.colorscheme"):load()
    require("v2.plugin"):load()
    require("v2.config.lsp"):load()
end

return M

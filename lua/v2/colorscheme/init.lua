local M = require "base.module"

local function requireScheme(scheme)
    return require("v2.colorscheme.schemes." .. scheme)
end

function M:load()
    -- requireScheme("gruvbox-material")
    vim.cmd("colorscheme dartpad")
end

return M

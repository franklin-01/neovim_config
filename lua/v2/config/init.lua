--[[
    package: config
    description: load general configs
]]
local M = require 'base.module'

function M:load()
    require("v2.config.options"):load() -- base config
    require("v2.config.keymap"):load()  -- base keymap
    require("v2.config.autocmd"):load()  -- base autocmd
end

return M

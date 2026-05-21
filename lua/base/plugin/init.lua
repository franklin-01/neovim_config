---@module 'base.plugin'
---@class Plugin
---@field name string plugin name, used to import plugin setup
---@field src string plugin repository url
---@field deps? table table with plugin dependencies
---@field disable? boolean disable or enable plugin
---@field config? table|function plugin config table or config function
---@field keymaps? table table with plugin keymap
---@field priority? number plugin priority

local M = require('base.module')
---new
---@param spec Plugin
function M:new(spec)
    assert(type(spec) == 'table', 'Invalid plugin config: ' .. type(spec) .. ' expected: table')
    assert(type(spec.src) == 'string', 'Invalid plugin src: ' .. type(spec) .. 'expected: string')
    assert(type(spec.name) == 'string', 'Invalid plugin name: ' .. type(spec) .. 'expected: string')

    if spec.disable then
        return
    end

    if spec.deps ~= nil then
        vim.pack.add(spec.deps, { confirm = false })
    end

    vim.pack.add({
        {
            src = spec.src,
            name = spec.name,
            priority = spec.priority
        }
    }, { confirm = false })

    local plugin = require(spec.name)
    if spec.config ~= nil then
        if type(spec.config) == 'table' then
            plugin.setup(spec.config)
        else
            spec.config(plugin)
        end
    end

    if spec.keymaps ~= nil then
        assert(type(spec.keymaps) == "table", "keymaps must be a table")
        for _, map in pairs(spec.keymaps) do
            vim.keymap.set(map.mode, map.keys, map.cmd)
        end
    end
end

return M

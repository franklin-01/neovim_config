---@module 'base.plugin'
---@class Plugin
---@field name string Module name used to `require()` the plugin and, when `config` is a table, to call its `setup()` function.
---@field src string Git URL or `vim.pack` source identifier the plugin is installed from.
---@field deps? table[] List of `vim.pack` plugin specs installed as dependencies before this plugin.
---@field disable? boolean When `true`, skips installing and configuring this plugin entirely.
---@field config? table|fun(plugin: table) Setup configuration: a table passed to the plugin's `setup()`, or a function invoked with the required plugin module for manual configuration. Ignored if `customConfig` is set.
---@field customConfig? fun() Escape hatch for plugins that don't follow the `require(name).setup(config)` convention. When set, this runs instead of `config` and is responsible for requiring/configuring the plugin itself.
---@field keymaps? {mode: string|string[], keys: string, cmd: string|function}[] Keymaps registered via `vim.keymap.set` after the plugin is configured.
---@field priority? number Load priority forwarded to `vim.pack.add`; higher values load earlier.

local M = require('base.module')
---Installs a plugin via `vim.pack`, runs its configuration, and registers its keymaps.
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

    if not (spec.customConfig == nil) then
        spec.customConfig()
    else
        local plugin = require(spec.name)
        if spec.config ~= nil and not (plugin == nil) then
            if type(spec.config) == 'table' then
                plugin.setup(spec.config)
            else
                spec.config(plugin)
            end
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

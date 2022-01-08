-- Define module
local packer = nil


-- Init function
local init = function()
    --
    -- Import user config from `plugins`
    local plugins = require('plugins')

    -- Initialize packer
    local has = false
    if packer == nil then
        -- Configure packer
        has, packer = pcall(require, 'packer')
        if not has then return end
        packer.init {
            disable_commands = true,
        }
    end
    packer.reset()

    -- Use plugins from `plugins`
    packer.use(plugins.plugins)
end


-- Return module
return setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

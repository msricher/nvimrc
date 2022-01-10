-- Define module
local plug = nil


-- Init function
local init = function()

    -- Initialize packer
    local has = false
    if plug == nil then
        -- Import packer with `pcall` to ensure it is installed
        has, plug = pcall(require, 'packer')
        if not has then return end
        -- Configure packer
        plug.init {
            disable_commands = true,
        }
    end

    -- Load packer
    plug.reset()

    -- Use plugins from `plug`
    plug.use(require('plug').plugins)
end


-- Return module
return setmetatable({}, {
    __index = function(_, key)
        init()
        return plug[key]
    end,
})

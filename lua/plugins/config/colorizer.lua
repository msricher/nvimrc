-- Define module
colorizer = {}


-- Setup function
colorizer.setup = function()
    --
    -- Configure colorizer
    require('colorizer').setup {'css', 'html', 'javascript'}
end


-- Return module
return colorizer

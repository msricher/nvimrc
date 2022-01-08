-- Define module
startuptime = {}


-- Setup function
startuptime.setup = function()
    vim.g.startuptime_tries = 10
end


-- Return module
return startuptime

-- Define module
neogit = {}


-- Setup function
neogit.setup = function()
    --
    -- Import utils module
    local utils = require('utils')

    -- Configure neogit
    require('neogit').setup()

    -- Keymaps
    utils.keymap('', '<leader>G', '<Cmd>Neogit<Cr>', {noremap = true})
end


-- Return module
return neogit

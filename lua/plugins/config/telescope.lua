-- Define module
telescope = {}


-- Setup function
telescope.setup = function()
    --
    -- Import utils module
    local utils = require('utils')

    -- Load project extension
    require('telescope').load_extension('projects')

    -- Keymaps
    utils.keymap('', '<leader>ff', '<Cmd>Telescope fd<Cr>', {noremap = true})
    utils.keymap('', '<leader>fg', '<Cmd>Telescope live_grep<Cr>', {noremap = true})
    utils.keymap('', '<leader>fb', '<Cmd>Telescope buffers<Cr>', {noremap = true})
    utils.keymap('', '<leader>fh', '<Cmd>Telescope oldfiles<Cr>', {noremap = true})
    utils.keymap('', '<leader>fm', '<Cmd>Telescope marks<Cr>', {noremap = true})
    utils.keymap('', '<leader>fp', '<Cmd>Telescope projects<Cr>', {noremap = true})
    utils.keymap('', '<leader>fr', '<Cmd>Telescope registers<Cr>', {noremap = true})
end


-- Return module
return telescope

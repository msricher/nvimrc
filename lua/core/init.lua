-- Define module
local core = {}


-- Setup function
local setup = function()

    -- Import nvim module
    local nvim = require('nvim')

    -- Import telescope module
    local telescope = require('telescope')

    -- Configure startup timer
    vim.g.startuptime_tries = 10

    -- Load telescope project extension
    telescope.load_extension('projects')

    -- Configure telescope
    telescope.setup()

    -- Set telescope keymaps
    nvim.keymap('', '<leader>ff', '<Cmd>Telescope fd<Cr>', {noremap = true})
    nvim.keymap('', '<leader>fg', '<Cmd>Telescope live_grep<Cr>', {noremap = true})
    nvim.keymap('', '<leader>fb', '<Cmd>Telescope buffers<Cr>', {noremap = true})
    nvim.keymap('', '<leader>fh', '<Cmd>Telescope oldfiles<Cr>', {noremap = true})
    nvim.keymap('', '<leader>fm', '<Cmd>Telescope marks<Cr>', {noremap = true})
    nvim.keymap('', '<leader>fp', '<Cmd>Telescope projects<Cr>', {noremap = true})
    nvim.keymap('', '<leader>fr', '<Cmd>Telescope registers<Cr>', {noremap = true})

end


-- Define plugin
core.plugin = {
    vim.fn.stdpath('config') .. '/lua/' .. ('core'),
    requires = {
        -- Packer
        'wbthomason/packer.nvim',
        -- Fix for CursorHold (until it's fixed upstream)
        {'antoinemadec/FixCursorHold.nvim',
            config = function() vim.g.cursorhold_updatetime = 100 end},
        -- Vim mappings
        'tpope/vim-commentary',
        'tpope/vim-repeat',
        'tpope/vim-surround',
        -- Unix command line utilities
        'tpope/vim-eunuch',
        'tpope/vim-fugitive',
        -- Startup timer
        'dstein64/vim-startuptime',
        -- Fern file manager
        'lambdalisue/fern.vim',
        'lambdalisue/fern-hijack.vim',
        'lambdalisue/fern-git-status.vim',
        'lambdalisue/fern-ssh',
        -- Project manager
        'ahmedkhalf/project.nvim',
        -- Telescope
        {
            'nvim-telescope/telescope.nvim',
            requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
        },
    },
    config = setup,
}


-- Return module
return core

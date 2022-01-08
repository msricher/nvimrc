-- Define module
neorg = {}


-- Setup function
neorg.setup = function()
    --
    -- Configure neorg
    require('neorg').setup {
        load = {
            ['core.defaults'] = {},
            ['core.norg.concealer'] = {},
            ['core.norg.completion'] = {
                config = {
                    engine = 'nvim-cmp',
                },
            },
            ['core.norg.dirman'] = {
                config = {
                    workspaces = {
                        my_workspace = '~/neorg',
                    },
                },
            },
            ['core.keybinds'] = {
                config = {
                    default_keybinds = true,
                    neorg_leader = '<Leader>o',
                },
            },
        },
    }
end


-- Return module
return neorg

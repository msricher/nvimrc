-- Define module
local comp = {}


-- Setup function
local setup = function()

    -- Import cmp module
    local cmp = require('cmp')

    -- Define cmp mappings
    local mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm {select = false},
    }

    -- Configure cmp
    cmp.setup {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = mapping,
        sources = {
            {name = 'nvim_lsp', group_index = 1},
            {name = 'luasnip', group_index = 1},
            {name = 'neorg', group_index = 1},
            {name = 'buffer', group_index = 2},
        },
    }

    -- Use buffer source for `/`
    cmp.setup.cmdline('/', {
        mapping = mapping,
        sources = {
            {name = 'buffer', group_index = 1},
        },
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(':', {
        mapping = mapping,
        sources = {
            {name = 'path', group_index = 1},
            {name = 'cmdline', group_index = 2},
        },
    })

end


-- Define plugin
comp.plugin = {
    vim.fn.stdpath('config') .. '/lua/' .. 'comp',
    requires = {
        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        -- Completion
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/nvim-cmp',
    },
    config = setup,
}


-- Return module
return comp

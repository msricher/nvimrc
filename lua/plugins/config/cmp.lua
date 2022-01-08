-- Define module
cmp_module = {}


-- Setup function
cmp_module.setup = function()
    --
    -- Import cmp
    local cmp = require('cmp')

    -- Define mappings
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


-- Return module
return cmp_module

-- Define module
local ts = {}


-- Setup function
local setup = function()

    -- Import treesitter configs
    local tsconfig = require('nvim-treesitter.configs')

    -- Add neorg parsers
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
    parser_configs.norg = {
        install_info = {
            url = 'https://github.com/nvim-neorg/tree-sitter-norg',
            files = {'src/parser.c', 'src/scanner.cc'},
            branch = 'main',
        },
        maintainers = {'@nvim-neorg'},
    }
    parser_configs.norg_meta = {
        install_info = {
            url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
            files = {'src/parser.c'},
            branch = 'main',
        },
        maintainers = {'@nvim-neorg'},
    }
    parser_configs.norg_table = {
        install_info = {
            url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
            files = {'src/parser.c'},
            branch = 'main',
        },
        maintainers = {'@nvim-neorg'},
    }

    -- Configure treesitter
    tsconfig.setup {
        ensure_installed = 'maintained',
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
            enable = true,
        },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 2048,
        },
    }

end


-- Define plugin
ts.plugin = {
    vim.fn.stdpath('config') .. '/lua/' .. 'ts',
    requires = {
        {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            requires = {
                {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
                {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'},
            },
        },
    },
    after = 'comp',
    config = setup,
}


-- Return module
return ts

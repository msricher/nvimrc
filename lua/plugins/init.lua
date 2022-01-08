-- `sumneko_lua` server doesn't like this file
---@diagnostic disable: different-requires


-- Define module
local plugins = {}


-- Declare plugins
plugins.plugins = {
    --
    -- Packer
    'wbthomason/packer.nvim',

    -- Vim mappings
    'tpope/vim-commentary',
    'tpope/vim-repeat',
    'tpope/vim-surround',

    -- Unix command line utilities
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',

    -- Language support
    'juliaeditorsupport/julia-vim',

    -- Colorscheme
    {
        'ellisonleao/gruvbox.nvim',
        config = require('plugins.config.colorscheme').setup,
    },

    -- Start screen
    {
        'mhinz/vim-startify',
        config = require('plugins.config.startify').setup,
    },

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        config = require('plugins.config.lualine').setup,
    },

    -- Bufferline
    {
        'romgrk/barbar.nvim',
        config = require('plugins.config.barbar').setup,
    },

    -- Gitsigns
    {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = require('plugins.config.gitsigns').setup,
    },

    -- Indent-blankline
    {
        'lukas-reineke/indent-blankline.nvim',
        config = require('plugins.config.indent-blankline').setup,
    },

    -- Colorizer
    {
        'norcalli/nvim-colorizer.lua',
        config = require('plugins.config.colorizer').setup,
    },

    -- Editorconfig support
    {
        'editorconfig/editorconfig-vim',
        config = require('plugins.config.editorconfig').setup,
    },

    -- Startup profiler
    {
        'dstein64/vim-startuptime',
        config = require('plugins.config.startuptime').setup,
    },

    -- File manager
    {
        'lambdalisue/fern.vim',
        requires = {
            'lambdalisue/fern-hijack.vim',
            'lambdalisue/fern-git-status.vim',
            'lambdalisue/fern-ssh',
        },
        config = require('plugins.config.fern').setup,
    },

    -- Project manager
    {
        'ahmedkhalf/project.nvim',
        config = require('plugins.config.project').setup,
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        after = 'project.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        },
        config = require('plugins.config.telescope').setup,
    },

    -- Neogit
    {
        'timuntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = require('plugins.config.neogit').setup,
    },

    -- Neorg
    {
        'nvim-neorg/neorg',
        requires = 'nvim-lua/plenary.nvim',
        config = require('plugins.config.neorg').setup,
    },

    -- Markdown-preview
    {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        config = require('plugins.config.markdown-preview').setup,
    },

    -- Vimtex
    {
        'lervag/vimtex',
        config = require('plugins.config.vimtex').setup,
    },

    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        requires = 'rafamadriz/friendly-snippets',
        config = require('plugins.config.luasnip').setup,
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
        after = 'LuaSnip',
        config = require('plugins.config.cmp').setup,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
            {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'},
        },
        config = require('plugins.config.treesitter').setup,
    },

    -- LSP
    {
        'williamboman/nvim-lsp-installer',
        requires = 'neovim/nvim-lspconfig',
        after = 'nvim-cmp',
        config = require('plugins.config.lsp-installer').setup,
    },
}


-- LSP servers to install
plugins.servers = {
    'bashls',
    'clangd',
    'css',
    'fortls',
    'html',
    'jsonls',
    'pyright',
    'sumneko_lua',
    'texlab',
    'vimls',
    'yamlls',
}


-- Table for providing LSP server -specific options
plugins.enhance_server_opts = {
    --
    ['css'] = function(opts)
        opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    end,

    ['html'] = function(opts)
        opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    end,

    ['json'] = function(opts)
        opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
        opts.commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line('$'), 0})
                end,
            },
        }
    end,

    ['sumneko_lua'] = function(opts)
        opts.settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        'vim',
                    },
                    disable = {
                        'lowercase-global',
                    },
                },
            },
        }
    end,
}


-- Setup function
plugins.setup = function()
    --
    -- Packer install path
    local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    -- Check for packer; if not found, then bootstrap it
    if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
        --
        -- Clone packer repo
        os.execute('git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)

        -- Load packer
        vim.cmd [[packadd packer.nvim]]

        -- Sync user plugins
        require('plugins.packer').sync()
    end

    -- Plugin management commands
    vim.cmd [[command! PlugClean lua require('plugins.packer').clean()]]
    vim.cmd [[command! PlugCompile lua require('plugins.packer').compile()]]
    vim.cmd [[command! PlugInstall lua require('plugins.packer').install()]]
    vim.cmd [[command! PlugStatus lua require('plugins.packer').status()]]
    vim.cmd [[command! PlugSync lua require('plugins.packer').sync()]]
    vim.cmd [[command! PlugUpdate lua require('plugins.packer').update()]]
end


-- Return module
return plugins

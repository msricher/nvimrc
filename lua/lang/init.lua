-- Define module
local lang = {}


-- Setup function
local setup = function()

    -- Configure editorconfig
    vim.cmd [[autocmd FileType gitcommit let b:EditorConfig_disable = 1]]
    vim.g.EditorConfig_exclude_patterns = {'fugitive://.*'}

    -- Configure vimtex
    vim.g.tex_flavor = 'latex'
    vim.g.Tex_DefaultTargetFormat = 'pdf'
    vim.g.vimtex_view_enabled = 1
    vim.g.vimtex_view_automatic = 1
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.vimtex_compiler_latexmk = {callback = 0}
    vim.g.vimtex_quickfix_mode = 0

    -- Configure Markdown-preview
    require('nvim').keymap('', '<leader>P', '<Cmd>MarkdownPreview<Cr>', {noremap = true})

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


-- Define plugin
lang.plugin = {
    vim.fn.stdpath('config') .. '/lua/' .. 'lang',
    requires = {
        -- Editorconfig support
        'editorconfig/editorconfig-vim',
        -- Julia
        'juliaeditorsupport/julia-vim',
        -- Vimtex
        'lervag/vimtex',
        -- Markdown-preview
        {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'},
        -- Neorg
        {'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim'},
    },
    config = setup,
}


-- Return module
return lang

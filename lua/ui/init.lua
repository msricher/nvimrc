-- Define module
local ui = {}


-- Setup function
local setup = function()

    -- Configure gruvbox colorscheme
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_italic = 1

    -- Set gruvbox theme for `bat` utility
    vim.cmd [[let $BAT_THEME = 'gruvbox-dark']]

    -- Set gruvbox colorscheme
    vim.cmd [[silent! colorscheme gruvbox]]

    -- Configure indent-blankline
    vim.g.indent_blankline_char_list = {'|', '¦'}
    vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_filetype_exclude = {'packer', 'startify', 'terminal'}

    -- Configure gitsigns
    require('gitsigns').setup()

    -- Configure colorizer
    require('colorizer').setup {'css', 'html', 'javascript'}

    -- Configure lualine theme
    local theme = require('lualine.themes.gruvbox_dark')
    theme.insert.c = theme.normal.c
    theme.visual.c = theme.normal.c
    theme.replace.c = theme.normal.c
    theme.command.c = theme.normal.c

    -- Configure lualine
    require('lualine').setup {
        options = {
            theme = theme,
            icons_enabled = false,
            section_separators = {left = '', right = ''},
            component_separators = {left = '', right = ''},
            always_divide_middle = true,
        },
        extensions = {
            {
                filetypes = {'fern'},
                sections = {
                    lualine_b = {
                        {'fugitive#head'},
                        {function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end},
                    },
                },
            },
            {
                filetypes = {'startify'},
                sections = {
                    lualine_b = {
                        {'fugitive#head'},
                    },
                },
            },
        },
        sections = {
            lualine_a = {
                {'mode'},
            },
            lualine_b = {
                {'branch'},
                {'diff'},
                {'diagnostics', source = {'nvim'}, sections = {'warn'}},
                {'diagnostics', source = {'nvim'}, sections = {'error'}},
                {'filename', path = 1},
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
                ---@diagnostic disable-next-line:undefined-field
                {function() return vim.opt.fileencoding:get() end},
                {function() return vim.bo.fileformat end},
                {function() return vim.bo.filetype or '' end},
                {'%LL'},
            },
            lualine_z = {
                {'%l:%-v', color = {fg = theme.normal.a.fg, bg = theme.normal.a.bg}},
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {
                {'filename', path = 1},
            },
            lualine_c = {
            },
            lualine_x = {},
            lualine_y = {
                {function() return vim.bo.filetype or '' end},
                {'%LL'},
            },
            lualine_z = {
                {'%l:%-v'},
            },
        },
        tabline = {
            lualine_b = {'buffers'},
            lualine_y = {'tabs'},
        },
    }

    -- Configure startify
    vim.g.startify_lists = {
        {
            type = 'files',
            header = {'   Recent'},
        },
        {
            type = 'dir',
            header = {'   Recent ' .. vim.fn.getcwd()},
        },
        {
            type = 'sessions',
            header = {'   Sessions'},
        },
        {
            type = function()
                local files = vim.fn.systemlist('git ls-files -m 2> /dev/null')
                return vim.fn.map(files, [[{'line': v:val, 'path': v:val}]])
            end,
            header = {'   Git Modified'},
        },
        {
            type = function()
                local files = vim.fn.systemlist('git ls-files -o --exclude-standard 2> /dev/null')
                return vim.fn.map(files, [[{'line': v:val, 'path': v:val}]])
            end,
            header = {'   Git Untracked'},
        },
    }

    -- Set startify header
    vim.g.startify_custom_header = {
        [[                    .]],
        [[      u            @88>]],
        [[     88Nu.   u.    %8P      ..    .     :]],
        [[    '88888.o888c    .     .888: x888  x888.]],
        [[     ^8888  8888  .@88u  ~`8888~'888X`?888f`]],
        [[      8888  8888 ''888E`   X888  888X '888>]],
        [[      8888  8888   888E    X888  888X '888>]],
        [[      8888  8888   888E    X888  888X '888>]],
        [[     .8888b.888P   888E    X888  888X '888>]],
        [[      ^Y8888*""    888&   "*88%""*88" '888!`]],
        [[        `Y"        R888"    `~    "    `"`]],
        [[                    ""]],
    }

end


-- Define plugin
ui.plugin = {
    vim.fn.stdpath('config') .. '/lua/' .. ('ui'),
    requires = {
        -- Colorscheme
        'ellisonleao/gruvbox.nvim',
        -- Indent guides
        'lukas-reineke/indent-blankline.nvim',
        -- Git sign column
        {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'},
        -- Colorizer
        'norcalli/nvim-colorizer.lua',
        -- Statusline
        'nvim-lualine/lualine.nvim',
        -- Start screen
        'mhinz/vim-startify',
    },
    config = setup,
}


-- Return module
return ui

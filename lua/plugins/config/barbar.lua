-- Define module
barbar = {}


-- Setup function
barbar.setup = function()
    --
    -- Import utils module
    local utils = require('utils')

    -- Configure bufferline
    vim.g.bufferline = {
        animation = true,
        auto_hide = true,
        clickable = true,
        closable = true,
        tabpages = true,
        maximum_length = 36,
        maximum_padding = 4,
        icons = 'numbers',
        icon_custom_colors = false,
        icon_pinned = '#',
        icon_close_tab = 'x',
        icon_close_tab_modified = '●',
        icon_separator_active = '▎',
        icon_separator_inactive = '▎',
        semantic_letters = true,
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
        no_name_title = nil,
    }

    -- Keymaps
    local opts = {noremap = true, silent = true}
    utils.keymap('n', '<A-,>', ':BufferPrevious<CR>', opts)
    utils.keymap('n', '<A-.>', ':BufferNext<CR>', opts)
    utils.keymap('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
    utils.keymap('n', '<A->>', ' :BufferMoveNext<CR>', opts)
    utils.keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts)
    utils.keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts)
    utils.keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts)
    utils.keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts)
    utils.keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts)
    utils.keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts)
    utils.keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts)
    utils.keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts)
    utils.keymap('n', '<A-9>', ':BufferGoto 9<CR>', opts)
    utils.keymap('n', '<A-0>', ':BufferLast<CR>', opts)
    utils.keymap('n', '<A-c>', ':BufferClose<CR>', opts)
    utils.keymap('n', '<Leader>bp', ':BufferPick<CR>', opts)
    utils.keymap('n', '<Leader>bb', ':BufferOrderByBufferNumber<CR>', opts)
    utils.keymap('n', '<Leader>bd', ':BufferOrderByDirectory<CR>', opts)
    utils.keymap('n', '<Leader>bl', ':BufferOrderByLanguage<CR>', opts)
end


-- Return module
return barbar

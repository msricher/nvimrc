-- Define module
colorscheme = {}


-- Setup function
colorscheme.setup = function()
    --
    -- Configure gruvbox colorscheme
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_italic = 1

    -- Set gruvbox theme for `bat` utility
    vim.cmd [[let $BAT_THEME = 'gruvbox-dark']]

    -- Set gruvbox colorscheme
    vim.cmd [[silent! colorscheme gruvbox]]
end


-- Return module
return colorscheme

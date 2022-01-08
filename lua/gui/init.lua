-- Define module
local gui = {}


-- Configure GUI font
gui.font = 'Fantasque\\ Sans\\ Mono'
gui.font_size_default = 11


-- Set font size
gui.font_size = gui.font_size_default


-- Helper function to update font
local update_font = function()
    vim.cmd('GuiFont! ' .. gui.font .. ':h' .. gui.font_size)
end


-- Increase font size function
gui.increase_font_size = function()
    gui.font_size = gui.font_size + 1
    update_font()
end


-- Decrease font size function
gui.decrease_font_size = function()
    if gui.font_size > 1 then
        gui.font_size = gui.font_size - 1
    else
        gui.font_size = 1
    end
    update_font()
end


-- Reset font size function
gui.reset_font_size = function()
    gui.font_size = gui.font_size_default
    update_font()
end


-- Setup function
gui.setup = function()
    --
    -- Import utils module
    local utils = require('utils')

    -- Disable GUI popupmenu widget
    if vim.fn.exists(':GuiPopupmenu') then
        vim.cmd [[GuiPopupmenu 0]]
    end

    -- Disable GUI tabline widget
    if vim.fn.exists(':GuiTabline') then
        vim.cmd [[GuiTabline 0]]
    end

    -- Enable GUI scrollbar widget
    if vim.fn.exists(':GuiScrollBar') then
        vim.cmd [[GuiScrollBar 1]]
    end

    -- Resize font keymaps
    utils.keymap('', '<C-+>', '<Cmd>IncreaseFontSize<Cr>', {noremap = true})
    utils.keymap('', '<C-=>', '<Cmd>ResetFontSize<Cr>', {noremap = true})
    utils.keymap('', '<C-->', '<Cmd>DecreaseFontSize<Cr>', {noremap = true})
    utils.keymap('i', '<C-+>', '<Cmd>IncreaseFontSize<Cr>', {noremap = true})
    utils.keymap('i', '<C-=>', '<Cmd>ResetFontSize<Cr>', {noremap = true})
    utils.keymap('i', '<C-->', '<Cmd>DecreaseFontSize<Cr>', {noremap = true})

    -- Resize font commands
    vim.cmd [[command! IncreaseFontSize lua require('gui').increase_font_size()]]
    vim.cmd [[command! DecreaseFontSize lua require('gui').decrease_font_size()]]
    vim.cmd [[command! ResetFontSize lua require('gui').reset_font_size()]]

    -- Update font size
    update_font()
end


-- Return module
return gui

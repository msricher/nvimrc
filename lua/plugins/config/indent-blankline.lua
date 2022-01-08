-- Define module
indent_blankline = {}


-- Setup function
indent_blankline.setup = function()
    --
    -- Configure indent-blankline
    vim.g.indent_blankline_char_list = {'|', '¦'}
    vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_filetype_exclude = {'packer', 'startify', 'terminal'}
end


-- Return module
return indent_blankline

-- Define module
editorconfig = {}


-- Setup function
editorconfig.setup = function()
    -- Configure editorconfig
    vim.cmd [[autocmd FileType gitcommit let b:EditorConfig_disable = 1]]
    vim.g.EditorConfig_exclude_patterns = {'fugitive://.*'}
end


-- Return module
return editorconfig

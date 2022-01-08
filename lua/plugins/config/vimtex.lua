-- Define module
vimtex = {}


-- Setup function
vimtex.setup = function()
    --
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
end


-- Return module
return vimtex

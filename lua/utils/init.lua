-- Define module
local utils = {}


-- Keymap function
utils.keymap = function(mode, key, cmd, opts)
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end


-- Buffer keymap function
utils.buf_keymap = function(bufnr, mode, key, cmd, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
end


-- Buffer set option function
utils.buf_set_option = function(bufnr, ...)
    vim.api.nvim_buf_set_option(bufnr, ...)
end


-- Return module
return utils

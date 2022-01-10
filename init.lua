-- Set nvim version number
vim.g.nvim_version = vim.fn.matchstr(vim.fn.execute('version'), [[NVIM v\zs[^\n]*]])


-- Load vim configuration
require('nvim').setup()


-- Load plugin configuration
require('plug').setup()

-- Define module
local config = {}


-- Setup function
config.setup = function()
    --
    -- Import utils module
    local utils = require('utils')

    -- Nvim version number
    vim.g.nvim_version = vim.fn.matchstr(vim.fn.execute('version'), [[NVIM v\zs[^\n]*]])

    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Enable Vim features
    vim.cmd [[syntax on]]
    vim.cmd [[filetype plugin indent on]]

    -- Configure Vim
    vim.opt.background = 'dark'
    vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
    vim.opt.cursorline = true
    vim.opt.encoding = 'utf-8'
    vim.opt.expandtab = true
    vim.opt.fileencoding = 'utf-8'
    vim.opt.fileformats = {'unix', 'dos', 'mac'}
    vim.opt.formatoptions = 'cjlq1'
    vim.opt.hidden = true
    vim.opt.history = 8192
    vim.opt.hlsearch = false
    vim.opt.ignorecase = true
    vim.opt.laststatus = 2
    vim.opt.listchars = {eol = '$', tab = '>-', trail = '~', extends = '>', precedes = '<'}
    vim.opt.mouse = 'a'
    vim.opt.number = true
    vim.opt.scrolljump = 4
    vim.opt.scrolloff = 4
    vim.opt.shiftround = true
    vim.opt.shiftwidth = 4
    vim.opt.shortmess = 'aoOtTIcF'
    vim.opt.showmatch = true
    vim.opt.showmode = false
    vim.opt.signcolumn = 'number'
    vim.opt.smartcase = true
    vim.opt.smarttab = true
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.tabstop = 4
    vim.opt.termguicolors = true
    vim.opt.textwidth = 100
    vim.opt.timeout = false
    vim.opt.title = true
    vim.opt.updatetime = 1000
    vim.opt.wildignore = {'*.o', '*.obj', '*.so', '*.gch', '*.exe', '*.class'}

    -- Configure terminal buffers
    vim.cmd [[augroup neovim_terminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * set nonumber norelativenumber
    augroup end]]

    -- New buffers default to text mode
    vim.cmd [[autocmd BufNewFile,BufRead * setfiletype text]]

    -- Makefiles use tabs
    vim.cmd [[autocmd FileType make setlocal noexpandtab]]

    -- Window keymaps
    utils.keymap('', '<C-h>', '<Cmd>wincmd h<Cr>', {noremap = true})
    utils.keymap('', '<C-j>', '<Cmd>wincmd j<Cr>', {noremap = true})
    utils.keymap('', '<C-k>', '<Cmd>wincmd k<Cr>', {noremap = true})
    utils.keymap('', '<C-l>', '<Cmd>wincmd l<Cr>', {noremap = true})

    -- Leader keymaps
    utils.keymap('', '<Space>', '<Nop>', {noremap = true})
    utils.keymap('', '<Space>', '<leader>', {})
    utils.keymap('', '<leader>c', '"+', {noremap = true})
    utils.keymap('', '<leader>C', '"*', {noremap = true})
    utils.keymap('', '<leader>nn', '<Cmd>set number!<Cr>', {noremap = true})
    utils.keymap('', '<leader>nr', '<Cmd>set relativenumber!<Cr>', {noremap = true})
    utils.keymap('', '<leader>t', '<Cmd>terminal<Cr>', {noremap = true})
    utils.keymap('', '<leader>wl', '<Cmd>set list!<Cr>', {noremap = true})
    utils.keymap('', '<leader>ww', '<Cmd>%s/\\s\\+$//ge<Cr>', {noremap = true})
    utils.keymap('', '<leader>qq', '<Cmd>quit!<Cr>', {noremap = true})
    utils.keymap('', '<leader>QQ', '<Cmd>quitall!<Cr>', {noremap = true})
end


-- Return module
return config

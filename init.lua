-- vim:ts=2:sw=2:tw=100:cc=101:fdm=marker:fmr={{{,}}}:fdl=1

-- {{{ Configure vim

-- Set nvim version number
vim.g.nvim_version = vim.fn.matchstr(vim.fn.execute('version'), [[NVIM v\zs[^\n]*]])

-- Enable vim features
vim.cmd [[syntax on]]
vim.cmd [[filetype plugin indent on]]

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Configure Vim
vim.opt.background = 'dark'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.cursorline = false
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
vim.opt.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.shortmess = 'aoOtTIcF'
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 1
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
vim.api.nvim_set_keymap('', '<C-h>', '<Cmd>wincmd h<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<C-j>', '<Cmd>wincmd j<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<C-k>', '<Cmd>wincmd k<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<C-l>', '<Cmd>wincmd l<Cr>', {noremap = true})

-- Leader keymaps
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Space>', '<leader>', {})
vim.api.nvim_set_keymap('', '<leader>c', '"+', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>C', '"*', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>nn', '<Cmd>set number!<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>nr', '<Cmd>set relativenumber!<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>t', '<Cmd>terminal<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>wl', '<Cmd>set list!<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>ww', '<Cmd>%s/\\s\\+$//ge<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>qq', '<Cmd>quit!<Cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>QQ', '<Cmd>quitall!<Cr>', {noremap = true})

-- }}}

-- {{{ Load plugin manager

-- Packer upstream URL
local packer_url = 'https://github.com/wbthomason/packer.nvim'

-- Path in which to install packer
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- If packer is not already installed, then bootstrap it
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then

  -- Download packer
  vim.fn.system {'git', 'clone', '--depth', '1', packer_url, packer_path}

  -- Load packer.nvim plugin
  vim.cmd [[packadd packer.nvim]]

  -- Sync plugins
  require('plugins').sync()

end

-- }}}

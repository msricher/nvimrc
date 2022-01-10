-- Define module
local nvim = {}


-- Keymap function
nvim.keymap = function(mode, key, cmd, opts)
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end


-- Buffer keymap function
nvim.buf_keymap = function(bufnr, mode, key, cmd, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
end


-- Buffer set option function
nvim.buf_set_option = function(bufnr, ...)
    vim.api.nvim_buf_set_option(bufnr, ...)
end


-- Setup function
nvim.setup = function()

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
    nvim.keymap('', '<C-h>', '<Cmd>wincmd h<Cr>', {noremap = true})
    nvim.keymap('', '<C-j>', '<Cmd>wincmd j<Cr>', {noremap = true})
    nvim.keymap('', '<C-k>', '<Cmd>wincmd k<Cr>', {noremap = true})
    nvim.keymap('', '<C-l>', '<Cmd>wincmd l<Cr>', {noremap = true})

    -- Leader keymaps
    nvim.keymap('', '<Space>', '<Nop>', {noremap = true})
    nvim.keymap('', '<Space>', '<leader>', {})
    nvim.keymap('', '<leader>c', '"+', {noremap = true})
    nvim.keymap('', '<leader>C', '"*', {noremap = true})
    nvim.keymap('', '<leader>nn', '<Cmd>set number!<Cr>', {noremap = true})
    nvim.keymap('', '<leader>nr', '<Cmd>set relativenumber!<Cr>', {noremap = true})
    nvim.keymap('', '<leader>t', '<Cmd>terminal<Cr>', {noremap = true})
    nvim.keymap('', '<leader>wl', '<Cmd>set list!<Cr>', {noremap = true})
    nvim.keymap('', '<leader>ww', '<Cmd>%s/\\s\\+$//ge<Cr>', {noremap = true})
    nvim.keymap('', '<leader>qq', '<Cmd>quit!<Cr>', {noremap = true})
    nvim.keymap('', '<leader>QQ', '<Cmd>quitall!<Cr>', {noremap = true})

end


-- Return module
return nvim

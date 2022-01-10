-- Define module
local plug = {}


-- Declare plugins
plug.plugins = {
    require('core').plugin,
    require('ui').plugin,
    require('lang').plugin,
    require('comp').plugin,
    require('ts').plugin,
    require('lsp').plugin,
}


-- Setup function
plug.setup = function()

    -- Packer install path
    local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    -- Check for packer; if not found, then bootstrap it
    if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
        --
        -- Clone packer repo
        os.execute('git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)

        -- Load packer
        vim.cmd [[packadd packer.nvim]]

        -- Sync user plugins
        require('plug.plug').sync()
    end

    -- Plugin management commands
    vim.cmd [[command! PlugClean lua require('plug.plug').clean()]]
    vim.cmd [[command! PlugCompile lua require('plug.plug').compile()]]
    vim.cmd [[command! PlugInstall lua require('plug.plug').install()]]
    vim.cmd [[command! PlugStatus lua require('plug.plug').status()]]
    vim.cmd [[command! PlugSync lua require('plug.plug').sync()]]
    vim.cmd [[command! PlugUpdate lua require('plug.plug').update()]]

end


-- Return module
return plug

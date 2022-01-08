-- Define module
lsp_installer_module = {}


-- Setup function
lsp_installer_module.setup = function()
    --
    -- Import LSP installer modules
    local lsp_installer = require('nvim-lsp-installer')

    -- Import user config from `plugins`
    local plugins = require('plugins')

    -- LSP client capabilities
    local capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    )

    -- Function to run on attaching to an LSP server
    local on_attach = function(client, bufnr)
        --
        -- Import utils module
        local utils = require('utils')

        -- Omnifunc
        utils.buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Keymaps
        local buf_keymap = function(mode, key, cmd)
            utils.buf_keymap(bufnr, mode, key, cmd, {noremap = true, silent = true})
        end
        buf_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<Cr>')
        buf_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<Cr>')
        buf_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<Cr>')
        buf_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<Cr>')
        buf_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<Cr>')
        buf_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<Cr>')
        buf_keymap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<Cr>')
        buf_keymap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<Cr>')
        buf_keymap('n', '<Space>D', '<Cmd>lua vim.lsp.buf.type_definition()<Cr>')
        buf_keymap('n', '<Space>rn', '<Cmd>lua vim.lsp.buf.rename()<Cr>')
        buf_keymap('n', '<Space>ca', '<Cmd>lua vim.lsp.buf.code_action()<Cr>')
        buf_keymap('n', '<Space>e', '<Cmd>lua vim.diagnostic.open_float()<Cr>')
        buf_keymap('n', '<Space>q', '<Cmd>lua vim.diagnostic.setloclist()<Cr>')
        buf_keymap('n', '<Space>f', '<Cmd>lua vim.lsp.buf.formatting()<Cr>')
        buf_keymap('n', '<Space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<Cr>')
        buf_keymap('n', '<Space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<Cr>')
        buf_keymap('n', '<Space>wl',
            '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<Cr>')
        if client.resolved_capabilities.document_formatting then
            buf_keymap('n', '<Space>f', '<Cmd>lua vim.lsp.buf.formatting()<Cr>')
        elseif client.resolved_capabilities.document_range_formatting then
            buf_keymap('n', '<Space>f', '<Cmd>lua vim.lsp.buf.range_formatting()<Cr>')
        end

        -- Autocommands
        if client.resolved_capabilities.document_highlight then
            vim.cmd [[augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup end]]
        end
    end

    -- Function to configure installed LSP servers
    lsp_installer.on_server_ready(function(server)
        -- Specify the default options used to setup all servers
        local opts = {
            capabilities = capabilities,
            on_attach = on_attach,
        }
        -- Supply option enhancements
        if plugins.enhance_server_opts[server.name] then
            plugins.enhance_server_opts[server.name](opts)
        end
        -- Setup server
        server:setup(opts)
    end)

    -- Ensure LSP servers from `plugins.config` are installed
    for _, name in pairs(plugins.servers) do
        local server_is_found, server = lsp_installer.get_server(name)
        if server_is_found then
            if not server:is_installed() then
                print("Installing " .. name)
                server:install()
            end
        end
    end
end


-- Return module
return lsp_installer_module

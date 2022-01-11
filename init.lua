-- vim:ts=2:sw=2:tw=100:cc=101:fdm=marker:fmr={{{,}}}:fdl=0

------------------
-- Introduction --
------------------

-- These programs are required to run this configuration:
--
--    git, node.js, npm, yarn, python, pip3
--
-- To use certain `telescope.nvim` features, these programs are required:
--
--    bat, fd, ripgrep
--
-- This configuration is compatible with Neovim ≥0.6.0 and Unix-based OSes.

-------------------
-- Configure vim --
-------------------

-- {{{

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

---------------------
-- Declare plugins --
---------------------

-- {{{

vim_user_plugins = {

  ------------------
  -- Core plugins --
  ------------------

  -- {{{

  -- Packer
  {'wbthomason/packer.nvim'},

  -- Additional vim keymaps
  {'tpope/vim-commentary'},
  {'tpope/vim-repeat'},
  {'tpope/vim-surround'},

  -- Fix for CursorHold (temporary)
  {
    'antoinemadec/FixCursorHold.nvim',

    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },

  -- }}}

  --------------------
  -- User interface --
  --------------------

  -- {{{

  -- Colorscheme
  {
    'ellisonleao/gruvbox.nvim',

    config = function()

      -- Configure gruvbox colorscheme
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_italic = 1

      -- Set gruvbox theme for `bat` utility
      vim.cmd [[let $BAT_THEME = 'gruvbox-dark']]

      -- Set gruvbox colorscheme
      vim.cmd [[silent! colorscheme gruvbox]]

    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    requires = 'tpope/vim-fugitive',

    config = function()

      -- Configure lualine theme
      local theme = require('lualine.themes.gruvbox')
      theme.insert.c = theme.normal.c
      theme.visual.c = theme.normal.c
      theme.replace.c = theme.normal.c
      theme.command.c = theme.normal.c

      -- Configure lualine
      require('lualine').setup {
        options = {
          theme = theme,
          icons_enabled = false,
          section_separators = {left = '', right = ''},
          component_separators = {left = '', right = ''},
          always_divide_middle = true,
        },
        extensions = {
          {
            filetypes = {'fern'},
            sections = {
              lualine_b = {
                {'fugitive#head'},
                {function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end},
              },
            },
          },
          {
            filetypes = {'startify'},
            sections = {
              lualine_b = {
                {'fugitive#head'},
              },
            },
          },
        },
        sections = {
          lualine_a = {
            {'mode'},
          },
          lualine_b = {
            {'branch'},
            {'diff'},
            {'diagnostics', source = {'nvim'}, sections = {'warn'}},
            {'diagnostics', source = {'nvim'}, sections = {'error'}},
            {'filename', path = 1},
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {
            ---@diagnostic disable-next-line:undefined-field
            {function() return vim.opt.fileencoding:get() end},
            {function() return vim.bo.fileformat end},
            {function() return vim.bo.filetype or '' end},
            {'%LL'},
          },
          lualine_z = {
            {'%l:%-v', color = {fg = theme.normal.a.fg, bg = theme.normal.a.bg}},
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {
            {'filename', path = 1},
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {
            {function() return vim.bo.filetype or '' end},
            {'%LL'},
          },
          lualine_z = {
            {'%l:%-v'},
          },
        },
        tabline = {
          lualine_b = {'buffers'},
          lualine_y = {'tabs'},
        },
      }

    end,
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',

    config = function()

      vim.g.indent_blankline_char_list = {'|', '¦'}
      vim.g.indent_blankline_use_treesitter = true
      vim.g.indent_blankline_show_current_context = true
      vim.g.indent_blankline_filetype_exclude = {'packer', 'startify', 'terminal'}

    end,
  },

  -- Git sign column
  {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',

    config = function()

      require('gitsigns').setup()

    end,
  },

  -- Colorize color codes
  {
    'norcalli/nvim-colorizer.lua',

    config = function()

      require('colorizer').setup {'css', 'html', 'javascript'}

    end,
  },

  -- }}}

  ----------------------
  -- Language support --
  ----------------------

  -- {{{

  -- Editorconfig support
  {
    'editorconfig/editorconfig-vim',

    config = function()

      vim.cmd [[autocmd FileType gitcommit let b:EditorConfig_disable = 1]]
      vim.g.EditorConfig_exclude_patterns = {'fugitive://.*'}

    end,
  },


  -- Julia
  {
    'juliaeditorsupport/julia-vim',
  },

  -- Vimtex
  {
    'lervag/vimtex',

    config = function()

      vim.g.tex_flavor = 'latex'
      vim.g.Tex_DefaultTargetFormat = 'pdf'
      vim.g.vimtex_view_enabled = 1
      vim.g.vimtex_view_automatic = 1
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.vimtex_compiler_latexmk = {callback = 0}
      vim.g.vimtex_quickfix_mode = 0

    end,
  },

  -- Markdown-preview
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',

    config = function()

      vim.api.nvim_set_keymap('', '<leader>P', '<Cmd>MarkdownPreview<Cr>', {noremap = true})

    end,
  },

  -- Neorg
  {
    'nvim-neorg/neorg',
    requires = 'nvim-lua/plenary.nvim',
    after = 'nvim-cmp',

    config = function()

      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.norg.concealer'] = {},
          ['core.norg.completion'] = {
            config = {engine = 'nvim-cmp'},
          },
          ['core.norg.dirman'] = {
            config = {
              workspaces = {my_workspace = '~/neorg'},
            },
          },
          ['core.keybinds'] = {
            config = {
              default_keybinds = true,
              neorg_leader = '<Leader>o',
            },
          },
        },
      }

    end,

  },

  -- }}}

  ------------------
  -- Applications --
  ------------------

  -- {{{

  -- Unix command line utilities
  {
    'tpope/vim-eunuch',
  },

  -- Git command line utilities
  {
    'tpope/vim-fugitive',
  },

  -- Startup timer
  {
    'dstein64/vim-startuptime',

    config = function()

      vim.g.startuptime_tries = 10

    end,
  },

  -- Start screen
  {
    'mhinz/vim-startify',

    config = function()

      -- Configure startify
      vim.g.startify_lists = {
        {
          type = 'files',
          header = {'   Recent'},
        },
        {
          type = 'dir',
          header = {'   Recent ' .. vim.fn.getcwd()},
        },
        {
          type = 'sessions',
          header = {'   Sessions'},
        },
        {
          type = function()
            local files = vim.fn.systemlist('git ls-files -m 2> /dev/null')
            return vim.fn.map(files, [[{'line': v:val, 'path': v:val}]])
          end,
          header = {'   Git Modified'},
        },
        {
          type = function()
            local files = vim.fn.systemlist('git ls-files -o --exclude-standard 2> /dev/null')
            return vim.fn.map(files, [[{'line': v:val, 'path': v:val}]])
          end,
          header = {'   Git Untracked'},
        },
      }

      -- Set startify header
      vim.g.startify_custom_header = {
        [[                    .]],
        [[      u            @88>]],
        [[     88Nu.   u.    %8P      ..    .     :]],
        [[    '88888.o888c    .     .888: x888  x888.]],
        [[     ^8888  8888  .@88u  ~`8888~'888X`?888f`]],
        [[      8888  8888 ''888E`   X888  888X '888>]],
        [[      8888  8888   888E    X888  888X '888>]],
        [[      8888  8888   888E    X888  888X '888>]],
        [[     .8888b.888P   888E    X888  888X '888>]],
        [[      ^Y8888*""    888&   "*88%""*88" '888!`]],
        [[        `Y"        R888"    `~    "    `"`]],
        [[                    ""]],
      }

    end,
  },

  -- Fern file manager
  {
    'lambdalisue/fern.vim',
    requires = {
      'lambdalisue/fern-hijack.vim',
      'lambdalisue/fern-git-status.vim',
      'lambdalisue/fern-ssh',
    },
  },

  -- Project manager
  {
    'ahmedkhalf/project.nvim',

    config = function()

      require('project_nvim').setup()

    end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
    after = 'project.nvim',

    config = function()

      -- Load telescope project extension
      require('telescope').load_extension('projects')

      -- Configure telescope
      require('telescope').setup()

    end,
  },

  -- }}}

  ----------------
  -- Completion --
  ----------------

  -- {{{

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    requires = 'rafamadriz/friendly-snippets',
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    after = 'LuaSnip',

    config = function()

      -- Import cmp module
      local cmp = require('cmp')

      -- Define cmp mappings
      local mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm {select = false},
      }

      -- Configure cmp
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = mapping,
        sources = {
          {name = 'nvim_lsp', group_index = 1},
          {name = 'luasnip', group_index = 1},
          {name = 'neorg', group_index = 1},
          {name = 'buffer', group_index = 2},
        },
      }

      -- Use buffer source for `/`
      cmp.setup.cmdline(
        '/',
        {
          mapping = mapping,
          sources = {
            {name = 'buffer', group_index = 1},
          },
        }
      )

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(
        ':',
        {
          mapping = mapping,
          sources = {
            {name = 'path', group_index = 1},
            {name = 'cmdline', group_index = 2},
          },
        }
      )

    end,
  },

  -- }}}

  ----------------
  -- Treesitter --
  ----------------

  -- {{{

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
      {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'},
    },
    run = ':TSUpdate',

    config = function()

      -- Import treesitter configs
      local tsconfig = require('nvim-treesitter.configs')

      -- Add neorg parsers
      local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
      parser_configs.norg = {
        install_info = {
          url = 'https://github.com/nvim-neorg/tree-sitter-norg',
          files = {'src/parser.c', 'src/scanner.cc'},
          branch = 'main',
        },
        maintainers = {'@nvim-neorg'},
      }
      parser_configs.norg_meta = {
        install_info = {
          url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
          files = {'src/parser.c'},
          branch = 'main',
        },
        maintainers = {'@nvim-neorg'},
      }
      parser_configs.norg_table = {
        install_info = {
          url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
          files = {'src/parser.c'},
          branch = 'main',
        },
        maintainers = {'@nvim-neorg'},
      }

      -- Configure treesitter
      tsconfig.setup {
        ensure_installed = 'maintained',
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = {
          enable = true,
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
          enable = true,
        },
        -- nvim-ts-rainbow
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 2048,
        },
      }

    end,
  },

  -- }}}

  ------------------------------
  -- Language server protocol --
  ------------------------------

  -- {{{

  -- LSP installer
  {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
    after = 'nvim-cmp',

    config = function()

      -- Import LSP installer module
      local lsp_installer = require('nvim-lsp-installer')

      -- LSP servers to install
      local servers = {
        'bashls',
        'clangd',
        'css',
        'fortls',
        'html',
        'jsonls',
        'pyright',
        'sumneko_lua',
        'texlab',
        'vimls',
        'yamlls',
      }

      -- Table for providing LSP server -specific options
      local enhance_server_opts = {
        ['css'] = function(opts)
          opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
        end,
        ['html'] = function(opts)
          opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
        end,
        ['json'] = function(opts)
          opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
          opts.commands = {
            Format = {
              function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line('$'), 0})
              end,
            },
          }
        end,
        ['sumneko_lua'] = function(opts)
          opts.settings = {
            Lua = {
              diagnostics = {
                globals = {
                  'vim',
                },
                disable = {
                  'lowercase-global',
                },
              },
            },
          }
        end,
      }

      -- LSP client capabilities
      local capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      -- Function to run on attaching to an LSP server
      local on_attach = function(client, bufnr)

        -- Omnifunc
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Keymaps
        local buf_keymap = function(mode, key, cmd)
          vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, {noremap = true, silent = true})
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
      lsp_installer.on_server_ready(
        function(server)

          -- Specify the default options used to setup all servers
          local opts = {
            capabilities = capabilities,
            on_attach = on_attach,
          }

          -- Supply option enhancements
          if enhance_server_opts[server.name] then
            enhance_server_opts[server.name](opts)
          end

          -- Setup server
          server:setup(opts)

        end
      )

      -- Ensure LSP servers are installed
      for _, name in pairs(servers) do
        local server_is_found, server = lsp_installer.get_server(name)
        if server_is_found then
          if not server:is_installed() then
            print("Installing " .. name)
            server:install()
          end
        end
      end

    end,
  },

  -- }}}

}

-- }}}

-------------------------
-- Load plugin manager --
-------------------------

-- {{{

-- Packer upstream URL
local packer_url = 'https://github.com/wbthomason/packer.nvim'

-- Path in which to install packer
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- If packer is not already installed, then bootstrap it
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim_user_bootstrap = vim.fn.system {'git', 'clone', '--depth', '1', packer_url, packer_path}
  vim.cmd [[packadd packer.nvim]]
end

-- Load the plugin manager
require('packer').startup {

  function()

    -- Use the declared plugins
    ---@diagnostic disable-next-line:undefined-global
    use(vim_user_plugins)

    -- Sync packages if `vim_user_bootstrap` was set
    if vim_user_bootstrap then
      require('packer').sync()
    end

  end,

  config = {
    profile = {enable = false},
  },

}

-- Delete the PackerProfile command since it's disabled
vim.cmd [[delcommand PackerProfile]]

-- Delete `vim_user_{x}` globals
vim_user_plugins = nil
vim_user_bootstrap = nil

-- }}}

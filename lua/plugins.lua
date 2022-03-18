-- vim:ts=2:sw=2:tw=100:cc=101:fdm=marker:fmr={{{,}}}:fdl=1

-- Declare plugins {{{

local plugins = {

  -- {{{ Core plugins

  -- Packer
  {
    'wbthomason/packer.nvim',

    config = function()

      vim.cmd [[command! PackerStatus lua require('plugins').status()]]
      vim.cmd [[command! PackerProfile lua require('plugins').profile_output()]]
      vim.cmd [[command! PackerCompile lua require('plugins').compile()]]
      vim.cmd [[command! PackerInstall lua require('plugins').install()]]
      vim.cmd [[command! PackerUpdate lua require('plugins').update()]]
      vim.cmd [[command! PackerClean lua require('plugins').clean()]]
      vim.cmd [[command! PackerSync lua require('plugins').sync()]]

    end,
  },

  -- Fix for CursorHold (temporary)
  {
    'antoinemadec/FixCursorHold.nvim',

    config = function()

      vim.g.cursorhold_updatetime = 100

    end,
  },

  -- }}}

  -- {{{ User interface

  -- Additional vim keymaps
  {'tpope/vim-repeat'},
  {'tpope/vim-surround'},
  {'wellle/targets.vim'},

  -- Commenting keymaps
  {
    'numToStr/Comment.nvim',

    config = function()

      require('Comment').setup {

        pre_hook = function(ctx)

          -- Only calculate commentstring for tsx filetypes
          if vim.bo.filetype == 'typescriptreact' then
            local U = require('Comment.utils')

            -- Detemine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.block then
              location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
              location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
              key = type,
              location = location,
            })
          end

        end,

      }

    end
  },

  -- Colorscheme
  {
    'sainnhe/gruvbox-material',

    config = function()

      -- Configure gruvbox colorscheme
      vim.g.gruvbox_material_palette = 'mix'
      vim.g.gruvbox_material_background = 'hard'

      -- Set gruvbox theme for `bat` utility
      vim.cmd [[let $BAT_THEME = 'gruvbox-dark']]

      -- Set gruvbox colorscheme
      vim.cmd [[silent! colorscheme gruvbox-material]]

    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    requires = 'sainnhe/gruvbox-material',

    config = function()

      -- Import lualine theme
      local theme = require('lualine.themes.gruvbox-material')

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
            filetypes = {'startify'},
            sections = {
              lualine_b = {
                {'branch'},
              },
            },
          },
          {
            filetypes = {'NvimTree'},
            sections = {
              lualine_b = {
                {'branch'},
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

  -- {{{ Language support

  -- Editorconfig support
  {
    'editorconfig/editorconfig-vim',

    config = function()

      vim.cmd [[autocmd FileType gitcommit let b:EditorConfig_disable = 1]]

    end,
  },


  -- Julia
  {
    'juliaeditorsupport/julia-vim',
  },

  -- Nim
  {
    'alaviss/nim.nvim',
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

      vim.api.nvim_set_keymap('', '<Leader>P', '<Cmd>MarkdownPreview<Cr>', {noremap = true})

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

  -- {{{ Applications

  -- Start screen
  {
    'mhinz/vim-startify',

    config = function()

      -- Configure startify
      vim.g.startify_lists = {
        {type = 'files', header = {'   Recent'}},
        {type = 'dir', header = {'   Recent ' .. vim.fn.getcwd()}},
        {type = 'sessions', header = {'   Sessions'}},
        {type = 'bookmarks', header = {'   Bookmarks'}},
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
      vim.g.startify_custom_header = {'   NVIM ' .. vim.g.nvim_version}

    end,
  },

  -- Nvim-tree file manager
  {
    'kyazdani42/nvim-tree.lua',

    config = function()

      -- Configure nvim-tree
      require('nvim-tree').setup {}

      -- Keymaps
      vim.api.nvim_set_keymap('', '<Leader>t', '<Cmd>NvimTreeToggle<Cr>', {noremap = true})

    end,
  },

  -- Register peek
  {
    'gennaro-tedesco/nvim-peekup',
  },

  -- FZF
  {
    'ibhagwan/fzf-lua',

    config = function()

      vim.api.nvim_set_keymap('', '<Leader>fb', '<Cmd>FzfLua buffers<Cr>', {noremap = true})
      vim.api.nvim_set_keymap('', '<Leader>ff', '<Cmd>FzfLua files<Cr>', {noremap = true})
      vim.api.nvim_set_keymap('', '<Leader>fg', '<Cmd>FzfLua live_grep<Cr>', {noremap = true})
      vim.api.nvim_set_keymap('', '<Leader>fh', '<Cmd>FzfLua help_tags<Cr>', {noremap = true})
      vim.api.nvim_set_keymap('', '<Leader>fo', '<Cmd>FzfLua oldfiles<Cr>', {noremap = true})

    end,
  },

  -- Neogit
  {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',

    config = function()

      -- Configure neogit
      require('neogit').setup()

      -- Keymaps
      vim.api.nvim_set_keymap('', '<Leader>G', '<Cmd>Neogit<Cr>', {noremap = true})

    end,
  },

  -- Unix command line utilities
  {
    'tpope/vim-eunuch',
  },

  -- }}}

  -- {{{ Completion

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

  -- {{{ Treesitter

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

  -- {{{ Language server protocol

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

      -- Install some servers manually
      local lspconfig = require('lspconfig')
      lspconfig.julials.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

    end,
  },

  -- }}}

}

-- }}}

-- Configure packer {{{

-- Initialize packer module
local packer = nil

-- Packer init function
local init = function()

  -- Initialize packer on first run
  if packer == nil then

    -- Import packer
    packer = require('packer')

    -- Configure packer
    packer.init {
      disable_commands = true,
      profile = {enable = true},
      display = {
        open_fn = function()
          return require('packer.util').float {border = 'rounded'}
        end,
      },
    }

  end

  -- Load packer
  packer.reset()

  -- Use declared plugins
  packer.use(plugins)

end

-- Return packer module
return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

-- }}}

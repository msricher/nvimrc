-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/michael/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/michael/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/michael/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/michael/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/michael/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\2ß\3\0\1\6\0\22\00064\1\0\0007\1\1\0017\1\2\1\a\1\3\0T\0010€4\1\4\0%\2\5\0>\1\2\0027\2\6\0007\3\6\0017\3\a\3\5\2\3\0T\2\2€%\2\b\0T\3\1€%\2\t\0)\3\0\0007\4\6\0007\5\6\0017\5\n\5\5\4\5\0T\4\a€4\4\4\0%\5\v\0>\4\2\0027\4\f\4>\4\1\2\16\3\4\0T\4\16€7\4\r\0007\5\r\0017\5\14\5\4\4\5\0T\4\5€7\4\r\0007\5\r\0017\5\15\5\5\4\5\0T\4\6€4\4\4\0%\5\v\0>\4\2\0027\4\16\4>\4\1\2\16\3\4\0004\4\4\0%\5\17\0>\4\2\0027\4\18\0043\5\19\0:\2\20\5:\3\21\5@\4\2\0G\0\1\0\rlocation\bkey\1\0\0\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\16__multiline\14__default\tline\nctype\18Comment.utils\frequire\20typescriptreact\rfiletype\abo\bvimN\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0001\2\3\0:\2\5\1>\0\2\1G\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1d\0:\1\2\0G\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["editorconfig-vim"] = {
    config = { "\27LJ\1\2]\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0>autocmd FileType gitcommit let b:EditorConfig_disable = 1\bcmd\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\1\2²\3\0\0\5\0\19\0)4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\n\0%\3\v\0003\4\f\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\r\0%\3\14\0003\4\15\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\16\0%\3\17\0003\4\18\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\29<Cmd>FzfLua oldfiles<Cr>\15<Leader>fo\1\0\1\fnoremap\2\30<Cmd>FzfLua help_tags<Cr>\15<Leader>fh\1\0\1\fnoremap\2\30<Cmd>FzfLua live_grep<Cr>\15<Leader>fg\1\0\1\fnoremap\2\26<Cmd>FzfLua files<Cr>\15<Leader>ff\1\0\1\fnoremap\2\28<Cmd>FzfLua buffers<Cr>\15<Leader>fb\5\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    config = { "\27LJ\1\2Ø\1\0\0\2\0\t\0\0174\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\6\0%\1\a\0>\0\2\0014\0\0\0007\0\6\0%\1\b\0>\0\2\1G\0\1\0)silent! colorscheme gruvbox-material$let $BAT_THEME = 'gruvbox-dark'\bcmd\thard gruvbox_material_background\bmix\29gruvbox_material_palette\6g\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2ú\1\0\0\2\0\b\0\0174\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\1\0)\1\2\0:\1\5\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0G\0\1\0\1\4\0\0\vpacker\rstartify\rterminal&indent_blankline_filetype_exclude*indent_blankline_show_current_context$indent_blankline_use_treesitter\1\3\0\0\6|\aÂ¦\31indent_blankline_char_list\6g\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/julia-vim",
    url = "https://github.com/juliaeditorsupport/julia-vim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\4\0\0064\0\0\0007\0\1\0007\0\2\0\16\1\0\0007\0\3\0@\0\2\0\bget\17fileencoding\bopt\bvim)\0\0\1\0\3\0\0044\0\0\0007\0\1\0007\0\2\0H\0\2\0\15fileformat\abo\bvim4\0\0\1\0\4\0\a4\0\0\0007\0\1\0007\0\2\0\14\0\0\0T\1\1€%\0\3\0H\0\2\0\5\rfiletype\abo\bvim4\0\0\1\0\4\0\a4\0\0\0007\0\1\0007\0\2\0\14\0\0\0T\1\1€%\0\3\0H\0\2\0\5\rfiletype\abo\bvimð\b\1\0\b\0>\0\0014\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\0013\2\n\0003\3\4\0:\0\5\0033\4\6\0:\4\a\0033\4\b\0:\4\t\3:\3\v\0022\3\3\0003\4\r\0003\5\f\0:\5\14\0043\5\16\0002\6\3\0003\a\15\0;\a\1\6:\6\17\5:\5\18\4;\4\1\0033\4\20\0003\5\19\0:\5\14\0043\5\22\0002\6\3\0003\a\21\0;\a\1\6:\6\17\5:\5\18\4;\4\2\3:\3\23\0023\3\25\0002\4\3\0003\5\24\0;\5\1\4:\4\26\0032\4\6\0003\5\27\0;\5\1\0043\5\28\0;\5\2\0043\5\29\0003\6\30\0:\6\31\0053\6 \0:\6\18\5;\5\3\0043\5!\0003\6\"\0:\6\31\0053\6#\0:\6\18\5;\5\4\0043\5$\0;\5\5\4:\4\17\0032\4\0\0:\4%\0032\4\0\0:\4&\0032\4\5\0002\5\3\0001\6'\0;\6\1\5;\5\1\0042\5\3\0001\6(\0;\6\1\5;\5\2\0042\5\3\0001\6)\0;\6\1\5;\5\3\0043\5*\0;\5\4\4:\4+\0032\4\3\0003\5,\0003\0060\0007\a-\0007\a.\a7\a/\a:\a/\0067\a-\0007\a.\a7\a1\a:\a1\6:\0062\5;\5\1\4:\0043\3:\3\18\0023\0034\0002\4\0\0:\4\26\0032\4\3\0003\0055\0;\5\1\4:\4\17\0032\4\0\0:\4%\0032\4\0\0:\4&\0032\4\3\0002\5\3\0001\0066\0;\6\1\5;\5\1\0043\0057\0;\5\2\4:\4+\0032\4\3\0003\0058\0;\5\1\4:\0043\3:\0039\0023\3;\0003\4:\0:\4\17\0033\4<\0:\4+\3:\3=\2>\1\2\1G\0\1\0\ftabline\1\2\0\0\ttabs\1\0\0\1\2\0\0\fbuffers\22inactive_sections\1\2\0\0\v%l:%-v\1\2\0\0\b%LL\0\1\2\1\0\rfilename\tpath\3\1\1\0\0\14lualine_z\ncolor\abg\1\0\0\afg\6a\vnormal\1\2\0\0\v%l:%-v\14lualine_y\1\2\0\0\b%LL\0\0\0\14lualine_x\14lualine_c\1\2\1\0\rfilename\tpath\3\1\1\2\0\0\nerror\1\2\0\0\tnvim\1\2\0\0\16diagnostics\1\2\0\0\twarn\vsource\1\2\0\0\tnvim\1\2\0\0\16diagnostics\1\2\0\0\tdiff\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\15extensions\1\0\0\1\2\0\0\vbranch\1\0\0\1\2\0\0\rNvimTree\rsections\14lualine_b\1\0\0\1\2\0\0\vbranch\14filetypes\1\0\0\1\2\0\0\rstartify\foptions\1\0\0\25component_separators\1\0\2\tleft\bî‚µ\nright\bî‚·\23section_separators\1\0\2\tleft\bî‚´\nright\bî‚¶\ntheme\1\0\2\25always_divide_middle\2\18icons_enabled\1\nsetup\flualine$lualine.themes.gruvbox-material\frequire\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\1\2s\0\0\5\0\a\0\t4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\29<Cmd>MarkdownPreview<Cr>\14<Leader>P\5\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neogit = {
    config = { "\27LJ\1\2“\1\0\0\5\0\n\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\20<Cmd>Neogit<Cr>\14<Leader>G\5\20nvim_set_keymap\bapi\bvim\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neorg = {
    config = { "\27LJ\1\2Ý\2\0\0\6\0\20\0\0274\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\18\0003\2\3\0002\3\0\0:\3\4\0022\3\0\0:\3\5\0023\3\a\0003\4\6\0:\4\b\3:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\b\3:\3\14\0023\3\16\0003\4\15\0:\4\b\3:\3\17\2:\2\19\1>\0\2\1G\0\1\0\tload\1\0\0\18core.keybinds\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\25core.norg.completion\vconfig\1\0\0\1\0\1\vengine\rnvim-cmp\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["nim.nvim"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/nim.nvim",
    url = "https://github.com/alaviss/nim.nvim"
  },
  ["nvim-cmp"] = {
    after = { "neorg", "nvim-lsp-installer" },
    config = { "\27LJ\1\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequire‰\6\1\0\a\0+\0X4\0\0\0%\1\1\0>\0\2\0023\1\5\0007\2\2\0007\3\2\0007\3\3\3'\4üÿ>\3\2\0023\4\4\0>\2\3\2:\2\6\0017\2\2\0007\3\2\0007\3\3\3'\4\4\0>\3\2\0023\4\a\0>\2\3\2:\2\b\0017\2\2\0007\3\2\0007\3\t\3>\3\1\0023\4\n\0>\2\3\2:\2\v\0017\2\f\0007\2\r\2:\2\14\0017\2\2\0003\3\16\0007\4\2\0007\4\15\4>\4\1\2:\4\17\0037\4\2\0007\4\18\4>\4\1\2:\4\19\3>\2\2\2:\2\20\0017\2\2\0007\2\21\0023\3\22\0>\2\2\2:\2\23\0017\2\24\0003\3\28\0003\4\26\0001\5\25\0:\5\27\4:\4\29\3:\1\2\0032\4\5\0003\5\30\0;\5\1\0043\5\31\0;\5\2\0043\5 \0;\5\3\0043\5!\0;\5\4\4:\4\"\3>\2\2\0017\2\24\0007\2#\2%\3$\0003\4%\0:\1\2\0042\5\3\0003\6&\0;\6\1\5:\5\"\4>\2\3\0017\2\24\0007\2#\2%\3'\0003\4(\0:\1\2\0042\5\3\0003\6)\0;\6\1\0053\6*\0;\6\2\5:\5\"\4>\2\3\1G\0\1\0\1\0\2\16group_index\3\2\tname\fcmdline\1\0\2\16group_index\3\1\tname\tpath\1\0\0\6:\1\0\2\16group_index\3\1\tname\vbuffer\1\0\0\6/\fcmdline\fsources\1\0\2\16group_index\3\2\tname\vbuffer\1\0\2\16group_index\3\1\tname\nneorg\1\0\2\16group_index\3\1\tname\fluasnip\1\0\2\16group_index\3\1\tname\rnvim_lsp\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\bcmp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/michael/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2S\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\4\0\0\bcss\thtml\15javascript\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    config = { '\27LJ\1\2f\0\1\3\0\5\0\a7\1\0\0007\1\1\0017\1\2\0017\1\3\1)\2\2\0:\2\4\1G\0\1\0\19snippetSupport\19completionItem\15completion\17textDocument\17capabilitiesf\0\1\3\0\5\0\a7\1\0\0007\1\1\0017\1\2\0017\1\3\1)\2\2\0:\2\4\1G\0\1\0\19snippetSupport\19completionItem\15completion\17textDocument\17capabilitiesy\0\0\6\0\t\0\0154\0\0\0007\0\1\0007\0\2\0007\0\3\0002\1\0\0003\2\4\0003\3\b\0004\4\0\0007\4\5\0047\4\6\4%\5\a\0>\4\2\2;\4\1\3>\0\4\1G\0\1\0\1\3\0\0\0\3\0\6$\tline\afn\1\3\0\0\3\0\3\0\21range_formatting\bbuf\blsp\bvim’\1\1\1\4\0\t\0\r7\1\0\0007\1\1\0017\1\2\0017\1\3\1)\2\2\0:\2\4\0013\1\a\0002\2\3\0001\3\6\0;\3\1\2:\2\b\1:\1\5\0G\0\1\0\vFormat\1\0\0\0\rcommands\19snippetSupport\19completionItem\15completion\17textDocument\17capabilities‚\1\0\1\5\0\n\0\v3\1\b\0003\2\6\0003\3\2\0003\4\1\0:\4\3\0033\4\4\0:\4\5\3:\3\a\2:\2\t\1:\1\0\0G\0\1\0\bLua\1\0\0\16diagnostics\1\0\0\fdisable\1\2\0\0\21lowercase-global\fglobals\1\0\0\1\2\0\0\bvim\rsettingsa\0\3\t\1\4\0\n4\3\0\0007\3\1\0037\3\2\3+\4\0\0\16\5\0\0\16\6\1\0\16\a\2\0003\b\3\0>\3\6\1G\0\1\0\1À\1\0\2\vsilent\2\fnoremap\2\24nvim_buf_set_keymap\bapi\bvim–\a\1\2\a\0\27\0:4\2\0\0007\2\1\0027\2\2\2\16\3\1\0%\4\3\0%\5\4\0>\2\4\0011\2\5\0\16\3\2\0%\4\6\0%\5\a\0%\6\b\0>\3\4\1\16\3\2\0%\4\6\0%\5\t\0%\6\n\0>\3\4\1\16\3\2\0%\4\6\0%\5\v\0%\6\f\0>\3\4\1\16\3\2\0%\4\6\0%\5\r\0%\6\14\0>\3\4\1\16\3\2\0%\4\6\0%\5\15\0%\6\16\0>\3\4\1\16\3\2\0%\4\6\0%\5\17\0%\6\18\0>\3\4\1\16\3\2\0%\4\6\0%\5\19\0%\6\20\0>\3\4\1\16\3\2\0%\4\6\0%\5\21\0%\6\22\0>\3\4\0017\3\23\0007\3\24\3\15\0\3\0T\4\4€4\3\0\0007\3\25\3%\4\26\0>\3\2\0010\0\0€G\0\1\0ì\1augroup lsp_document_highlight\n          autocmd! * <buffer>\n          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n          augroup end\bcmd\23document_highlight\26resolved_capabilities,<Cmd>lua vim.diagnostic.goto_next()<Cr>\a]d,<Cmd>lua vim.diagnostic.goto_prev()<Cr>\a[d.<Cmd>lua vim.lsp.buf.signature_help()<Cr>\n<C-k>%<Cmd>lua vim.lsp.buf.hover()<Cr>\6K*<Cmd>lua vim.lsp.buf.references()<Cr>\agr.<Cmd>lua vim.lsp.buf.implementation()<Cr>\agi*<Cmd>lua vim.lsp.buf.definition()<Cr>\agd+<Cmd>lua vim.lsp.buf.declaration()<Cr>\agD\6n\0\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim‚\1\0\1\5\3\5\0\0203\1\0\0+\2\0\0:\2\1\1+\2\1\0:\2\2\1+\2\2\0007\3\3\0006\2\3\2\15\0\2\0T\3\5€+\2\2\0007\3\3\0006\2\3\2\16\3\1\0>\2\2\1\16\3\0\0007\2\4\0\16\4\1\0>\2\3\1G\0\1\0\3À\4À\2À\nsetup\tname\14on_attach\17capabilities\1\0\0ü\4\1\0\15\0#\0D4\0\0\0%\1\1\0>\0\2\0023\1\2\0003\2\4\0001\3\3\0:\3\5\0021\3\6\0:\3\a\0021\3\b\0:\3\t\0021\3\n\0:\3\v\0024\3\0\0%\4\f\0>\3\2\0027\3\r\0034\4\14\0007\4\15\0047\4\16\0047\4\17\4>\4\1\0=\3\0\0021\4\18\0007\5\19\0001\6\20\0>\5\2\0014\5\21\0\16\6\1\0>\5\2\4D\b\18€7\n\22\0\16\v\t\0>\n\2\3\15\0\n\0T\f\r€\16\r\v\0007\f\23\v>\f\2\2\14\0\f\0T\f\b€4\f\24\0%\r\25\0\16\14\t\0$\r\14\r>\f\2\1\16\r\v\0007\f\26\v>\f\2\1B\b\3\3N\bì4\5\0\0%\6\27\0>\5\2\0027\6\28\0057\6\29\0063\a\30\0:\3\31\a:\4 \a>\6\2\0017\6!\0057\6\29\0063\a"\0:\3\31\a:\4 \a>\6\2\0010\0\0€G\0\1\0\1\0\0\18rust_analyzer\14on_attach\17capabilities\1\0\0\nsetup\fjulials\14lspconfig\finstall\16Installing \nprint\17is_installed\15get_server\npairs\0\20on_server_ready\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\16sumneko_lua\0\tjson\0\thtml\0\bcss\1\0\0\0\1\f\0\0\vbashls\vclangd\bcss\vfortls\thtml\vjsonls\fpyright\16sumneko_lua\vtexlab\nvimls\vyamlls\23nvim-lsp-installer\frequire\0' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/michael/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2ž\1\0\0\5\0\n\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\28<Cmd>NvimTreeToggle<Cr>\14<Leader>t\5\20nvim_set_keymap\bapi\bvim\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-context-commentstring", "nvim-ts-rainbow" },
    loaded = true,
    only_config = true
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/michael/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/michael/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["packer.nvim"] = {
    config = { "\27LJ\1\2„\4\0\0\2\0\t\0\0294\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\1\0%\1\5\0>\0\2\0014\0\0\0007\0\1\0%\1\6\0>\0\2\0014\0\0\0007\0\1\0%\1\a\0>\0\2\0014\0\0\0007\0\1\0%\1\b\0>\0\2\1G\0\1\0006command! PackerSync lua require('plugins').sync()8command! PackerClean lua require('plugins').clean():command! PackerUpdate lua require('plugins').update()<command! PackerInstall lua require('plugins').install()<command! PackerCompile lua require('plugins').compile()Ccommand! PackerProfile lua require('plugins').profile_output():command! PackerStatus lua require('plugins').status()\bcmd\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startify"] = {
    config = { "\27LJ\1\2…\1\0\0\4\0\6\0\v4\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\0024\1\0\0007\1\1\0017\1\4\1\16\2\0\0%\3\5\0@\1\3\0#{'line': v:val, 'path': v:val}\bmap!git ls-files -m 2> /dev/null\15systemlist\afn\bvim˜\1\0\0\4\0\6\0\v4\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\0024\1\0\0007\1\1\0017\1\4\1\16\2\0\0%\3\5\0@\1\3\0#{'line': v:val, 'path': v:val}\bmap4git ls-files -o --exclude-standard 2> /dev/null\15systemlist\afn\bvimÏ\3\1\0\6\0\24\00024\0\0\0007\0\1\0002\1\a\0003\2\3\0003\3\4\0:\3\5\2;\2\1\0013\2\6\0002\3\3\0%\4\a\0004\5\0\0007\5\b\0057\5\t\5>\5\1\2$\4\5\4;\4\1\3:\3\5\2;\2\2\0013\2\n\0003\3\v\0:\3\5\2;\2\3\0013\2\f\0003\3\r\0:\3\5\2;\2\4\0013\2\15\0001\3\14\0:\3\16\0023\3\17\0:\3\5\2;\2\5\0013\2\19\0001\3\18\0:\3\16\0023\3\20\0:\3\5\2;\2\6\1:\1\2\0004\0\0\0007\0\1\0002\1\3\0%\2\22\0004\3\0\0007\3\1\0037\3\23\3$\2\3\2;\2\1\1:\1\21\0G\0\1\0\17nvim_version\r   NVIM \27startify_custom_header\1\2\0\0\21   Git Untracked\1\0\0\0\1\2\0\0\20   Git Modified\ttype\1\0\0\0\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\vgetcwd\afn\15   Recent \1\0\1\ttype\bdir\vheader\1\2\0\0\14   Recent\1\0\1\ttype\nfiles\19startify_lists\6g\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimtex = {
    config = { "\27LJ\1\2†\3\0\0\2\0\16\0%4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0%\1\t\0:\1\b\0004\0\0\0007\0\1\0%\1\t\0:\1\n\0004\0\0\0007\0\1\0%\1\f\0:\1\v\0004\0\0\0007\0\1\0003\1\14\0:\1\r\0004\0\0\0007\0\1\0'\1\0\0:\1\15\0G\0\1\0\25vimtex_quickfix_mode\1\0\1\rcallback\3\0\28vimtex_compiler_latexmk\bnvr\29vimtex_compiler_progname\23vimtex_view_method\fzathura\31vimtex_view_general_viewer\26vimtex_view_automatic\24vimtex_view_enabled\bpdf\28Tex_DefaultTargetFormat\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = true,
    path = "/home/michael/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\2ß\3\0\1\6\0\22\00064\1\0\0007\1\1\0017\1\2\1\a\1\3\0T\0010€4\1\4\0%\2\5\0>\1\2\0027\2\6\0007\3\6\0017\3\a\3\5\2\3\0T\2\2€%\2\b\0T\3\1€%\2\t\0)\3\0\0007\4\6\0007\5\6\0017\5\n\5\5\4\5\0T\4\a€4\4\4\0%\5\v\0>\4\2\0027\4\f\4>\4\1\2\16\3\4\0T\4\16€7\4\r\0007\5\r\0017\5\14\5\4\4\5\0T\4\5€7\4\r\0007\5\r\0017\5\15\5\5\4\5\0T\4\6€4\4\4\0%\5\v\0>\4\2\0027\4\16\4>\4\1\2\16\3\4\0004\4\4\0%\5\17\0>\4\2\0027\4\18\0043\5\19\0:\2\20\5:\3\21\5@\4\2\0G\0\1\0\rlocation\bkey\1\0\0\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\16__multiline\14__default\tline\nctype\18Comment.utils\frequire\20typescriptreact\rfiletype\abo\bvimN\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0001\2\3\0:\2\5\1>\0\2\1G\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: FixCursorHold.nvim
time([[Config for FixCursorHold.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1d\0:\1\2\0G\0\1\0\26cursorhold_updatetime\6g\bvim\0", "config", "FixCursorHold.nvim")
time([[Config for FixCursorHold.nvim]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\1\2²\3\0\0\5\0\19\0)4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\n\0%\3\v\0003\4\f\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\r\0%\3\14\0003\4\15\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\16\0%\3\17\0003\4\18\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\29<Cmd>FzfLua oldfiles<Cr>\15<Leader>fo\1\0\1\fnoremap\2\30<Cmd>FzfLua help_tags<Cr>\15<Leader>fh\1\0\1\fnoremap\2\30<Cmd>FzfLua live_grep<Cr>\15<Leader>fg\1\0\1\fnoremap\2\26<Cmd>FzfLua files<Cr>\15<Leader>ff\1\0\1\fnoremap\2\28<Cmd>FzfLua buffers<Cr>\15<Leader>fb\5\20nvim_set_keymap\bapi\bvim\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2ž\1\0\0\5\0\n\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\28<Cmd>NvimTreeToggle<Cr>\14<Leader>t\5\20nvim_set_keymap\bapi\bvim\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2ú\1\0\0\2\0\b\0\0174\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\1\0)\1\2\0:\1\5\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0G\0\1\0\1\4\0\0\vpacker\rstartify\rterminal&indent_blankline_filetype_exclude*indent_blankline_show_current_context$indent_blankline_use_treesitter\1\3\0\0\6|\aÂ¦\31indent_blankline_char_list\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2º\6\0\0\5\0 \0,4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\1>\1\1\0023\2\b\0003\3\5\0003\4\6\0:\4\a\3:\3\t\0023\3\n\0:\3\v\2:\2\4\0013\2\15\0003\3\r\0003\4\14\0:\4\a\3:\3\t\0023\3\16\0:\3\v\2:\2\f\0013\2\20\0003\3\18\0003\4\19\0:\4\a\3:\3\t\0023\3\21\0:\3\v\2:\2\17\0017\2\22\0003\3\23\0003\4\24\0:\4\25\0033\4\26\0:\4\27\0033\4\28\0:\4\29\0033\4\30\0:\4\31\3>\2\2\1G\0\1\0\frainbow\1\0\3\19max_file_lines\3€\16\18extended_mode\2\venable\2\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\21use_languagetree\2\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\1\2\0\0\16@nvim-neorg\1\0\0\1\2\0\0\17src/parser.c\1\0\2\vbranch\tmain\burl9https://github.com/nvim-neorg/tree-sitter-norg-table\15norg_table\1\2\0\0\16@nvim-neorg\1\0\0\1\2\0\0\17src/parser.c\1\0\2\vbranch\tmain\burl8https://github.com/nvim-neorg/tree-sitter-norg-meta\14norg_meta\16maintainers\1\2\0\0\16@nvim-neorg\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\vbranch\tmain\burl3https://github.com/nvim-neorg/tree-sitter-norg\tnorg\23get_parser_configs\28nvim-treesitter.parsers\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2S\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\4\0\0\bcss\thtml\15javascript\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\1\2…\1\0\0\4\0\6\0\v4\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\0024\1\0\0007\1\1\0017\1\4\1\16\2\0\0%\3\5\0@\1\3\0#{'line': v:val, 'path': v:val}\bmap!git ls-files -m 2> /dev/null\15systemlist\afn\bvim˜\1\0\0\4\0\6\0\v4\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\0024\1\0\0007\1\1\0017\1\4\1\16\2\0\0%\3\5\0@\1\3\0#{'line': v:val, 'path': v:val}\bmap4git ls-files -o --exclude-standard 2> /dev/null\15systemlist\afn\bvimÏ\3\1\0\6\0\24\00024\0\0\0007\0\1\0002\1\a\0003\2\3\0003\3\4\0:\3\5\2;\2\1\0013\2\6\0002\3\3\0%\4\a\0004\5\0\0007\5\b\0057\5\t\5>\5\1\2$\4\5\4;\4\1\3:\3\5\2;\2\2\0013\2\n\0003\3\v\0:\3\5\2;\2\3\0013\2\f\0003\3\r\0:\3\5\2;\2\4\0013\2\15\0001\3\14\0:\3\16\0023\3\17\0:\3\5\2;\2\5\0013\2\19\0001\3\18\0:\3\16\0023\3\20\0:\3\5\2;\2\6\1:\1\2\0004\0\0\0007\0\1\0002\1\3\0%\2\22\0004\3\0\0007\3\1\0037\3\23\3$\2\3\2;\2\1\1:\1\21\0G\0\1\0\17nvim_version\r   NVIM \27startify_custom_header\1\2\0\0\21   Git Untracked\1\0\0\0\1\2\0\0\20   Git Modified\ttype\1\0\0\0\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\vgetcwd\afn\15   Recent \1\0\1\ttype\bdir\vheader\1\2\0\0\14   Recent\1\0\1\ttype\nfiles\19startify_lists\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\1\2†\3\0\0\2\0\16\0%4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0%\1\t\0:\1\b\0004\0\0\0007\0\1\0%\1\t\0:\1\n\0004\0\0\0007\0\1\0%\1\f\0:\1\v\0004\0\0\0007\0\1\0003\1\14\0:\1\r\0004\0\0\0007\0\1\0'\1\0\0:\1\15\0G\0\1\0\25vimtex_quickfix_mode\1\0\1\rcallback\3\0\28vimtex_compiler_latexmk\bnvr\29vimtex_compiler_progname\23vimtex_view_method\fzathura\31vimtex_view_general_viewer\26vimtex_view_automatic\24vimtex_view_enabled\bpdf\28Tex_DefaultTargetFormat\nlatex\15tex_flavor\6g\bvim\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\4\0\0064\0\0\0007\0\1\0007\0\2\0\16\1\0\0007\0\3\0@\0\2\0\bget\17fileencoding\bopt\bvim)\0\0\1\0\3\0\0044\0\0\0007\0\1\0007\0\2\0H\0\2\0\15fileformat\abo\bvim4\0\0\1\0\4\0\a4\0\0\0007\0\1\0007\0\2\0\14\0\0\0T\1\1€%\0\3\0H\0\2\0\5\rfiletype\abo\bvim4\0\0\1\0\4\0\a4\0\0\0007\0\1\0007\0\2\0\14\0\0\0T\1\1€%\0\3\0H\0\2\0\5\rfiletype\abo\bvimð\b\1\0\b\0>\0\0014\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\0013\2\n\0003\3\4\0:\0\5\0033\4\6\0:\4\a\0033\4\b\0:\4\t\3:\3\v\0022\3\3\0003\4\r\0003\5\f\0:\5\14\0043\5\16\0002\6\3\0003\a\15\0;\a\1\6:\6\17\5:\5\18\4;\4\1\0033\4\20\0003\5\19\0:\5\14\0043\5\22\0002\6\3\0003\a\21\0;\a\1\6:\6\17\5:\5\18\4;\4\2\3:\3\23\0023\3\25\0002\4\3\0003\5\24\0;\5\1\4:\4\26\0032\4\6\0003\5\27\0;\5\1\0043\5\28\0;\5\2\0043\5\29\0003\6\30\0:\6\31\0053\6 \0:\6\18\5;\5\3\0043\5!\0003\6\"\0:\6\31\0053\6#\0:\6\18\5;\5\4\0043\5$\0;\5\5\4:\4\17\0032\4\0\0:\4%\0032\4\0\0:\4&\0032\4\5\0002\5\3\0001\6'\0;\6\1\5;\5\1\0042\5\3\0001\6(\0;\6\1\5;\5\2\0042\5\3\0001\6)\0;\6\1\5;\5\3\0043\5*\0;\5\4\4:\4+\0032\4\3\0003\5,\0003\0060\0007\a-\0007\a.\a7\a/\a:\a/\0067\a-\0007\a.\a7\a1\a:\a1\6:\0062\5;\5\1\4:\0043\3:\3\18\0023\0034\0002\4\0\0:\4\26\0032\4\3\0003\0055\0;\5\1\4:\4\17\0032\4\0\0:\4%\0032\4\0\0:\4&\0032\4\3\0002\5\3\0001\0066\0;\6\1\5;\5\1\0043\0057\0;\5\2\4:\4+\0032\4\3\0003\0058\0;\5\1\4:\0043\3:\0039\0023\3;\0003\4:\0:\4\17\0033\4<\0:\4+\3:\3=\2>\1\2\1G\0\1\0\ftabline\1\2\0\0\ttabs\1\0\0\1\2\0\0\fbuffers\22inactive_sections\1\2\0\0\v%l:%-v\1\2\0\0\b%LL\0\1\2\1\0\rfilename\tpath\3\1\1\0\0\14lualine_z\ncolor\abg\1\0\0\afg\6a\vnormal\1\2\0\0\v%l:%-v\14lualine_y\1\2\0\0\b%LL\0\0\0\14lualine_x\14lualine_c\1\2\1\0\rfilename\tpath\3\1\1\2\0\0\nerror\1\2\0\0\tnvim\1\2\0\0\16diagnostics\1\2\0\0\twarn\vsource\1\2\0\0\tnvim\1\2\0\0\16diagnostics\1\2\0\0\tdiff\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\15extensions\1\0\0\1\2\0\0\vbranch\1\0\0\1\2\0\0\rNvimTree\rsections\14lualine_b\1\0\0\1\2\0\0\vbranch\14filetypes\1\0\0\1\2\0\0\rstartify\foptions\1\0\0\25component_separators\1\0\2\tleft\bî‚µ\nright\bî‚·\23section_separators\1\0\2\tleft\bî‚´\nright\bî‚¶\ntheme\1\0\2\25always_divide_middle\2\18icons_enabled\1\nsetup\flualine$lualine.themes.gruvbox-material\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\1\2“\1\0\0\5\0\n\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\20<Cmd>Neogit<Cr>\14<Leader>G\5\20nvim_set_keymap\bapi\bvim\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: packer.nvim
time([[Config for packer.nvim]], true)
try_loadstring("\27LJ\1\2„\4\0\0\2\0\t\0\0294\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\1\0%\1\5\0>\0\2\0014\0\0\0007\0\1\0%\1\6\0>\0\2\0014\0\0\0007\0\1\0%\1\a\0>\0\2\0014\0\0\0007\0\1\0%\1\b\0>\0\2\1G\0\1\0006command! PackerSync lua require('plugins').sync()8command! PackerClean lua require('plugins').clean():command! PackerUpdate lua require('plugins').update()<command! PackerInstall lua require('plugins').install()<command! PackerCompile lua require('plugins').compile()Ccommand! PackerProfile lua require('plugins').profile_output():command! PackerStatus lua require('plugins').status()\bcmd\bvim\0", "config", "packer.nvim")
time([[Config for packer.nvim]], false)
-- Config for: gruvbox-material
time([[Config for gruvbox-material]], true)
try_loadstring("\27LJ\1\2Ø\1\0\0\2\0\t\0\0174\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\6\0%\1\a\0>\0\2\0014\0\0\0007\0\6\0%\1\b\0>\0\2\1G\0\1\0)silent! colorscheme gruvbox-material$let $BAT_THEME = 'gruvbox-dark'\bcmd\thard gruvbox_material_background\bmix\29gruvbox_material_palette\6g\bvim\0", "config", "gruvbox-material")
time([[Config for gruvbox-material]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\1\2s\0\0\5\0\a\0\t4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\29<Cmd>MarkdownPreview<Cr>\14<Leader>P\5\20nvim_set_keymap\bapi\bvim\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: editorconfig-vim
time([[Config for editorconfig-vim]], true)
try_loadstring("\27LJ\1\2]\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0>autocmd FileType gitcommit let b:EditorConfig_disable = 1\bcmd\bvim\0", "config", "editorconfig-vim")
time([[Config for editorconfig-vim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\1\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequire‰\6\1\0\a\0+\0X4\0\0\0%\1\1\0>\0\2\0023\1\5\0007\2\2\0007\3\2\0007\3\3\3'\4üÿ>\3\2\0023\4\4\0>\2\3\2:\2\6\0017\2\2\0007\3\2\0007\3\3\3'\4\4\0>\3\2\0023\4\a\0>\2\3\2:\2\b\0017\2\2\0007\3\2\0007\3\t\3>\3\1\0023\4\n\0>\2\3\2:\2\v\0017\2\f\0007\2\r\2:\2\14\0017\2\2\0003\3\16\0007\4\2\0007\4\15\4>\4\1\2:\4\17\0037\4\2\0007\4\18\4>\4\1\2:\4\19\3>\2\2\2:\2\20\0017\2\2\0007\2\21\0023\3\22\0>\2\2\2:\2\23\0017\2\24\0003\3\28\0003\4\26\0001\5\25\0:\5\27\4:\4\29\3:\1\2\0032\4\5\0003\5\30\0;\5\1\0043\5\31\0;\5\2\0043\5 \0;\5\3\0043\5!\0;\5\4\4:\4\"\3>\2\2\0017\2\24\0007\2#\2%\3$\0003\4%\0:\1\2\0042\5\3\0003\6&\0;\6\1\5:\5\"\4>\2\3\0017\2\24\0007\2#\2%\3'\0003\4(\0:\1\2\0042\5\3\0003\6)\0;\6\1\0053\6*\0;\6\2\5:\5\"\4>\2\3\1G\0\1\0\1\0\2\16group_index\3\2\tname\fcmdline\1\0\2\16group_index\3\1\tname\tpath\1\0\0\6:\1\0\2\16group_index\3\1\tname\vbuffer\1\0\0\6/\fcmdline\fsources\1\0\2\16group_index\3\2\tname\vbuffer\1\0\2\16group_index\3\1\tname\nneorg\1\0\2\16group_index\3\1\tname\fluasnip\1\0\2\16group_index\3\1\tname\rnvim_lsp\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\bcmp\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd nvim-lsp-installer ]]

-- Config for: nvim-lsp-installer
try_loadstring('\27LJ\1\2f\0\1\3\0\5\0\a7\1\0\0007\1\1\0017\1\2\0017\1\3\1)\2\2\0:\2\4\1G\0\1\0\19snippetSupport\19completionItem\15completion\17textDocument\17capabilitiesf\0\1\3\0\5\0\a7\1\0\0007\1\1\0017\1\2\0017\1\3\1)\2\2\0:\2\4\1G\0\1\0\19snippetSupport\19completionItem\15completion\17textDocument\17capabilitiesy\0\0\6\0\t\0\0154\0\0\0007\0\1\0007\0\2\0007\0\3\0002\1\0\0003\2\4\0003\3\b\0004\4\0\0007\4\5\0047\4\6\4%\5\a\0>\4\2\2;\4\1\3>\0\4\1G\0\1\0\1\3\0\0\0\3\0\6$\tline\afn\1\3\0\0\3\0\3\0\21range_formatting\bbuf\blsp\bvim’\1\1\1\4\0\t\0\r7\1\0\0007\1\1\0017\1\2\0017\1\3\1)\2\2\0:\2\4\0013\1\a\0002\2\3\0001\3\6\0;\3\1\2:\2\b\1:\1\5\0G\0\1\0\vFormat\1\0\0\0\rcommands\19snippetSupport\19completionItem\15completion\17textDocument\17capabilities‚\1\0\1\5\0\n\0\v3\1\b\0003\2\6\0003\3\2\0003\4\1\0:\4\3\0033\4\4\0:\4\5\3:\3\a\2:\2\t\1:\1\0\0G\0\1\0\bLua\1\0\0\16diagnostics\1\0\0\fdisable\1\2\0\0\21lowercase-global\fglobals\1\0\0\1\2\0\0\bvim\rsettingsa\0\3\t\1\4\0\n4\3\0\0007\3\1\0037\3\2\3+\4\0\0\16\5\0\0\16\6\1\0\16\a\2\0003\b\3\0>\3\6\1G\0\1\0\1À\1\0\2\vsilent\2\fnoremap\2\24nvim_buf_set_keymap\bapi\bvim–\a\1\2\a\0\27\0:4\2\0\0007\2\1\0027\2\2\2\16\3\1\0%\4\3\0%\5\4\0>\2\4\0011\2\5\0\16\3\2\0%\4\6\0%\5\a\0%\6\b\0>\3\4\1\16\3\2\0%\4\6\0%\5\t\0%\6\n\0>\3\4\1\16\3\2\0%\4\6\0%\5\v\0%\6\f\0>\3\4\1\16\3\2\0%\4\6\0%\5\r\0%\6\14\0>\3\4\1\16\3\2\0%\4\6\0%\5\15\0%\6\16\0>\3\4\1\16\3\2\0%\4\6\0%\5\17\0%\6\18\0>\3\4\1\16\3\2\0%\4\6\0%\5\19\0%\6\20\0>\3\4\1\16\3\2\0%\4\6\0%\5\21\0%\6\22\0>\3\4\0017\3\23\0007\3\24\3\15\0\3\0T\4\4€4\3\0\0007\3\25\3%\4\26\0>\3\2\0010\0\0€G\0\1\0ì\1augroup lsp_document_highlight\n          autocmd! * <buffer>\n          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n          augroup end\bcmd\23document_highlight\26resolved_capabilities,<Cmd>lua vim.diagnostic.goto_next()<Cr>\a]d,<Cmd>lua vim.diagnostic.goto_prev()<Cr>\a[d.<Cmd>lua vim.lsp.buf.signature_help()<Cr>\n<C-k>%<Cmd>lua vim.lsp.buf.hover()<Cr>\6K*<Cmd>lua vim.lsp.buf.references()<Cr>\agr.<Cmd>lua vim.lsp.buf.implementation()<Cr>\agi*<Cmd>lua vim.lsp.buf.definition()<Cr>\agd+<Cmd>lua vim.lsp.buf.declaration()<Cr>\agD\6n\0\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim‚\1\0\1\5\3\5\0\0203\1\0\0+\2\0\0:\2\1\1+\2\1\0:\2\2\1+\2\2\0007\3\3\0006\2\3\2\15\0\2\0T\3\5€+\2\2\0007\3\3\0006\2\3\2\16\3\1\0>\2\2\1\16\3\0\0007\2\4\0\16\4\1\0>\2\3\1G\0\1\0\3À\4À\2À\nsetup\tname\14on_attach\17capabilities\1\0\0ü\4\1\0\15\0#\0D4\0\0\0%\1\1\0>\0\2\0023\1\2\0003\2\4\0001\3\3\0:\3\5\0021\3\6\0:\3\a\0021\3\b\0:\3\t\0021\3\n\0:\3\v\0024\3\0\0%\4\f\0>\3\2\0027\3\r\0034\4\14\0007\4\15\0047\4\16\0047\4\17\4>\4\1\0=\3\0\0021\4\18\0007\5\19\0001\6\20\0>\5\2\0014\5\21\0\16\6\1\0>\5\2\4D\b\18€7\n\22\0\16\v\t\0>\n\2\3\15\0\n\0T\f\r€\16\r\v\0007\f\23\v>\f\2\2\14\0\f\0T\f\b€4\f\24\0%\r\25\0\16\14\t\0$\r\14\r>\f\2\1\16\r\v\0007\f\26\v>\f\2\1B\b\3\3N\bì4\5\0\0%\6\27\0>\5\2\0027\6\28\0057\6\29\0063\a\30\0:\3\31\a:\4 \a>\6\2\0017\6!\0057\6\29\0063\a"\0:\3\31\a:\4 \a>\6\2\0010\0\0€G\0\1\0\1\0\0\18rust_analyzer\14on_attach\17capabilities\1\0\0\nsetup\fjulials\14lspconfig\finstall\16Installing \nprint\17is_installed\15get_server\npairs\0\20on_server_ready\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\16sumneko_lua\0\tjson\0\thtml\0\bcss\1\0\0\0\1\f\0\0\vbashls\vclangd\bcss\vfortls\thtml\vjsonls\fpyright\16sumneko_lua\vtexlab\nvimls\vyamlls\23nvim-lsp-installer\frequire\0', "config", "nvim-lsp-installer")

vim.cmd [[ packadd neorg ]]

-- Config for: neorg
try_loadstring("\27LJ\1\2Ý\2\0\0\6\0\20\0\0274\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\18\0003\2\3\0002\3\0\0:\3\4\0022\3\0\0:\3\5\0023\3\a\0003\4\6\0:\4\b\3:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\b\3:\3\14\0023\3\16\0003\4\15\0:\4\b\3:\3\17\2:\2\19\1>\0\2\1G\0\1\0\tload\1\0\0\18core.keybinds\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\25core.norg.completion\vconfig\1\0\0\1\0\1\vengine\rnvim-cmp\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")

vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd nvim-ts-rainbow ]]
time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

-- Define module
lualine = {}


-- Setup function
lualine.setup = function()
    --
    -- Setup lualine theme
    local theme = require('lualine.themes.gruvbox_dark')
    theme.insert.c = theme.normal.c
    theme.visual.c = theme.normal.c
    theme.replace.c = theme.normal.c
    theme.command.c = theme.normal.c

    -- Helper function for drawing separators
    local empty = require('lualine.component'):extend()
    function empty:draw(default_highlight)
        self.status = ''
        self.applied_separator = ''
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
    end

    -- Helper function to put separators and gaps between components in sections
    local process_sections = function(sections)
        for name, section in pairs(sections) do
            local left = name:sub(9, 10) < 'x'
            for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
                table.insert(section, pos * 2, {
                    empty,
                    color = {
                        fg = theme.normal.c.fg,
                        bg = theme.normal.c.bg,
                    },
                })
            end
            for id, comp in ipairs(section) do
                if type(comp) ~= 'table' then
                    comp = {comp}
                    section[id] = comp
                end
                comp.separator = left and { right = '' } or { left = '' }
            end
        end
        return sections
    end

    -- Setup lualine
    require('lualine').setup {
        options = {
            theme = theme,
            icons_enabled = false,
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            always_divide_middle = true,
        },
        extensions = {
            -- fern
            {
                sections = {
                    lualine_b = {
                        {function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end},
                    },
                },
                filetypes = {'fern'},
            },
            -- startify
            {
                sections = {
                    lualine_b = {'branch'},
                },
                filetypes = {'startify'},
            },
        },
        sections = process_sections {
            lualine_a = {
                {'mode'},
            },
            lualine_b = {
                {'branch'},
                {'diff'},
                {'diagnostics', source = {'nvim'}, sections = {'error'}},
                {'diagnostics', source = {'nvim'}, sections = {'warn'}},
                {'filename', file_status = false},
                {function() return '+' end, cond = function() return vim.bo.modified end},
                {function() return 'RO' end, cond = function() return vim.bo.readonly end},
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
                {'encoding'},
                {'fileformat'},
                {'filetype'},
                {'%LL'},
            },
            lualine_z = {
                {'%l:%-v'},
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {'filename'},
            },
            lualine_x = {
                {'filetype'},
                {'%LL'},
                {'%l:%-v'},
            },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
    }
end


-- Return module
return lualine

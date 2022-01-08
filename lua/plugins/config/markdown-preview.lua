-- Define module
markdown_preview = {}


-- Setup function
markdown_preview.setup = function()
    --
    -- Import utils module
    local utils = require('utils')

    -- Keymaps
    utils.keymap('', '<leader>P', '<Cmd>MarkdownPreview<Cr>', {noremap = true})
end


-- Return module
return markdown_preview

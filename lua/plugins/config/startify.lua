-- Define module
startify = {}


-- Setup function
startify.setup = function()
    --
    -- List modified git files
    local git_modified = function()
        local files = vim.fn.systemlist('git ls-files -m 2> /dev/null')
        return vim.fn.map(files, [[{'line': v:val, 'path': v:val}]])
    end

    -- List files untracked by git
    local git_untracked = function()
        local files = vim.fn.systemlist('git ls-files -o --exclude-standard 2> /dev/null')
        return vim.fn.map(files, [[{'line': v:val, 'path': v:val}]])
    end

    -- Configure startify
    vim.g.startify_lists = {
        {type = 'files', header = {'   Recent'}},
        {type = 'dir', header = {'   Recent ' .. vim.fn.getcwd()}},
        {type = 'sessions', header = {'   Sessions'}},
        {type = git_modified, header = {'   Git Modified'}},
        {type = git_untracked, header = {'   Git Untracked'}},
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
end


-- Return module
return startify

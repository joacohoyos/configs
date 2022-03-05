local Path = require('plenary.path')

local directories = directories
    or {
        { mma = { path = '~/podchain/mma-treasures/app/develop' } },
        { mma = { path = '~/podchain/mma-treasures/api/develop' } },
        { mma = { path = '~/podchain/mma-treasures/contracts' } },
    }

local function directory_contains(match)
    return not not (string.find(vim.loop.cwd(), match, 1, true))
end

local function get_project()
    if directory_contains('podchain/mma-treasures') then
        return 'mma'
    end
    return nil
end

local function get_current()
    if directory_contains('podchain/mma-treasures/app') then
        return directories[1].mma
    end
    if directory_contains('podchain/mma-treasures/api') then
        return directories[2].mma
    end
    if directory_contains('podchain/mma-treasures/contracts') then
        return directories[3].mma
    end
    return nil
end

local function normalize_path(path)
    return Path:new(path):make_relative(vim.loop.cwd())
end

local W = {}

W.load_directory = function(index)
    project_key = get_project()
    directory = directories[index]
    if directory then
        project = directory[project_key]
        if project then
            current_project = get_current()
            local buf_name = vim.api.nvim_buf_get_name(0)
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            current_project.buf = normalize_path(buf_name)
            current_project.row = cursor_pos[1]
            current_project.col = cursor_pos[2]
            vim.api.nvim_set_current_dir(project.path)
            if project.buf then
                local buf_id = vim.fn.bufnr(project.buf, true)
                local set_row = not vim.api.nvim_buf_is_loaded(buf_id)
                vim.api.nvim_set_current_buf(buf_id)
                if set_row and project.row and project.col then
                    vim.cmd(string.format(':call cursor(%d, %d)', project.row, project.col))
                end
                require('harpoon.term').clear_all()
                return
            end
            vim.cmd('e .')
        end
    end
end

return W

local Worktree = require('git-worktree')
local Common = require('clarkyex.worktree.common')
local JPG = {}

local function get_dir(repo)
    return '/home/joaquin/Documents/Proyectos/jpg' .. repo
end

local function is_jpg_server()
    return not not (string.find(vim.loop.cwd(), get_dir('server'), 1, true))
end

function JPG.on_tree_change(op, path, upstream, dir)
    if op == Worktree.Operations.Switch and is_jpg_server() then
        Common.kill_pane('jpg:run-server')
        Common.add_window(
            'jpg',
            'run-server',
            get_dir('server/' .. Common.get_branch(dir)),
            'yarn start:dev'
        )
    end

    if op == Worktree.Operations.Create and is_jpg_server() then
        os.execute(string.format('cp -r ~/jpg/server/staging/.husky ~/jpg/server/%s', dir))
        os.execute(string.format('cp -r ~/jpg/server/staging/node_modules ~/jpg/server/%s', dir))
        os.execute(string.format('cp -r ~/jpg/server/staging/.env ~/jpg/server/%s', dir))
    end
end

return JPG

local Worktree = require('git-worktree')
local Common = require('clarkyex.worktree.common')
local MMA = {}

local function get_dir(repo)
    return '/home/joaquin/Documents/Proyectos/podchain/mma-treasures/' .. repo
end

local function is_mma_api()
    return not not (string.find(vim.loop.cwd(), get_dir('api'), 1, true))
end

local function is_mma_app()
    return not not (string.find(vim.loop.cwd(), get_dir('app'), 1, true))
end

function MMA.on_tree_change(op, path, upstream, dir)
    if op == Worktree.Operations.Switch and is_mma_api() then
        Common.kill_pane('mma:run.0')
        Common.add_window(
            'mma',
            'run-api',
            get_dir('api/' .. Common.get_branch(dir)),
            './stop.sh && ./start.sh up'
        )
        Common.join_panes('mma:run-api', 'mma:run')
        os.execute(string.format('tmux swap-pane -s mma:run.0 -t mma:run.1'))
        os.execute(string.format('tmux select-window -t mma:nvim'))
    end

    if op == Worktree.Operations.Switch and is_mma_app() then
        print('hola')
        Common.kill_pane('mma:run.1')
        Common.add_window(
            'mma',
            'run-app',
            get_dir('app/' .. Common.get_branch(dir)),
            'npm run dev'
        )
        Common.join_panes('mma:run-app', 'mma:run')
        os.execute(string.format('tmux select-window -t mma:nvim'))
    end

    if op == Worktree.Operations.Create and is_mma_api() then
        os.execute(
            string.format(
                'cp -r $PODCHAIN_PATH/mma-treasures/api/develop/.husky $PODCHAIN_PATH/mma-treasures/api/%s',
                dir
            )
        )
        os.execute(
            string.format(
                'cp -r $PODCHAIN_PATH/mma-treasures/api/develop/node_modules $PODCHAIN_PATH/mma-treasures/api/%s',
                dir
            )
        )
        os.execute(
            string.format(
                'cp -r $PODCHAIN_PATH/mma-treasures/api/develop/.env $PODCHAIN_PATH/mma-treasures/api/%s',
                dir
            )
        )
    end

    if op == Worktree.Operations.Create and is_mma_app() then
        os.execute(
            string.format(
                'cp -r $PODCHAIN_PATH/mma-treasures/app/develop/.husky $PODCHAIN_PATH/mma-treasures/app/%s',
                dir
            )
        )
        os.execute(
            string.format(
                'cp -r $PODCHAIN_PATH/mma-treasures/app/develop/node_modules $PODCHAIN_PATH/mma-treasures/app/%s',
                dir
            )
        )
        os.execute(
            string.format(
                'cp -r $PODCHAIN_PATH/mma-treasures/app/develop/.env $PODCHAIN_PATH/mma-treasures/app/%s',
                dir
            )
        )
    end
end

return MMA

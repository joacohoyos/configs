local Worktree = require("git-worktree")
local Job = require("plenary.job")
local Path = require("plenary.path")

local function is_pc_api()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/api",1, true))
end

local function is_pc_app()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/app",1, true))
end

local function is_pc_www()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/www",1, true))
end

local function kill_window(session_name)
    os.execute(string.format("tmux kill-window -t %s", session_name))
end

local function add_window(session, window, dir, cmd)
    os.execute(string.format("tmux neww -t %s: -n %s -d  -c %s", session, window , dir))
    os.execute(string.format("tmux send-keys -t %s:%s \"%s\" C-m",session,window, cmd))
end

Worktree.on_tree_change(function(op, path, upstream)
    if op == Worktree.Operations.Switch and is_pc_api() then
      kill_window("peer:run-api")
      add_window("peer", "run-api", path["path"], "docker-compose -f docker/docker-compose.yml up --build")
    end

    if op == Worktree.Operations.Switch and is_pc_app() then
      kill_window("peer:run-app")
      add_window("peer", "run-app", path["path"], "npm start")
    end

    if op == Worktree.Operations.Switch and is_pc_www() then
      kill_window("peer:run-www")
      add_window("peer", "run-www", path["path"], "npm start")
    end

    if op == Worktree.Operations.Create and is_pc_www() then
        os.execute(string.format("cp -r $PC_PATH/www/master/node_modules $PC_PATH/www/%s", path["path"]))
        os.execute(string.format("cp -r $PC_PATH/www/master/.env.development $PC_PATH/www/%s", path["path"]))
    end

    if op == Worktree.Operations.Create and is_pc_app() then
        os.execute(string.format("cp -r $PC_PATH/app/master/node_modules $PC_PATH/app/%s", path["path"]))
        os.execute(string.format("cp -r $PC_PATH/app/master/.env $PC_PATH/app/%s", path["path"]))
    end

    if op == Worktree.Operations.Create and is_pc_api() then
        os.execute(string.format("cp -r $PC_PATH/api/master/.env $PC_PATH/api/%s", path["path"]))
        os.execute(string.format("cp -r  $PC_PATH/api/%s/config/database.sample.yml $PC_PATH/api/%s/config/database.yml", path["path"], path["path"]))
    end

end)

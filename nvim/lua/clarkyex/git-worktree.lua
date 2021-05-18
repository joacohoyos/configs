local Worktree = require("git-worktree")

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

local function is_absolute_path(path)
  return not not (string.find(path, "/", 1, true))
end

local function add_window(session, window, dir, cmd)
    os.execute(string.format("tmux neww -t %s: -n %s -d  -c %s", session, window , dir))
    os.execute(string.format("tmux send-keys -t %s:%s \"%s\" C-m",session,window, cmd))
end

local function get_dir(path, project)
  if is_absolute_path(path) then
     return path
  end
  return vim.env.PC_PATH .. "/" .. project .. "/" .. path
end

Worktree.on_tree_change(function(op, path, upstream)
    dir = path["path"]
    if op == Worktree.Operations.Switch and is_pc_api() then
      kill_window("peer-api:run")
      tree_dir = get_dir(dir, "api")
      add_window("peer-api", "run", tree_dir, "docker-compose -f docker/docker-compose.yml up --build")
    end

    if op == Worktree.Operations.Switch and is_pc_app() then
      tree_dir = get_dir(dir, "app")
      kill_window("peer-app:run")
      add_window("peer-app", "run", tree_dir, "npm start")
    end

    if op == Worktree.Operations.Switch and is_pc_www() then
      tree_dir = get_dir(dir, "www")
      kill_window("peer-www:run")
      add_window("peer-www", "run", tree_dir, "npm start")
    end

    if op == Worktree.Operations.Create and is_pc_www() then
        os.execute(string.format("cp -r $PC_PATH/www/master/node_modules $PC_PATH/www/%s", dir))
        os.execute(string.format("cp -r $PC_PATH/www/master/.env.development $PC_PATH/www/%s", dir))
    end

    if op == Worktree.Operations.Create and is_pc_app() then
        os.execute(string.format("cp -r $PC_PATH/app/master/node_modules $PC_PATH/app/%s", dir))
        os.execute(string.format("cp -r $PC_PATH/app/master/.env $PC_PATH/app/%s", dir))
    end

    if op == Worktree.Operations.Create and is_pc_api() then
        os.execute(string.format("cp -r $PC_PATH/api/master/.env $PC_PATH/api/%s", dir))
        os.execute(string.format("cp -r  $PC_PATH/api/%s/config/database.sample.yml $PC_PATH/api/%s/config/database.yml", dir, dir))
    end

end)

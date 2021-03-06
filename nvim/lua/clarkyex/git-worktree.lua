local Worktree = require("git-worktree")

local function is_pc_api_rails()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/api-rails",1, true))
end

local function is_pc_api_node()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/api-node",1, true))
end

local function is_pc_app()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/app",1, true))
end

local function is_pc_www()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/www",1, true))
end

local function is_pc_cms()
    return not not (string.find(vim.loop.cwd(), vim.env.PC_PATH .. "/cms",1, true))
end

local function is_pe_api()
    return not not (string.find(vim.loop.cwd(), vim.env.PE_PATH .. "/api",1, true))
end

local function is_pe_app()
    return not not (string.find(vim.loop.cwd(), vim.env.PE_PATH .. "/app",1, true))
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

local function get_branch(path)
  if is_absolute_path(path) then
    str = path .. "/"
    for a in str:gmatch("(.-)/")  do
      branch = a
    end
    return branch
  end 
  return path
end
local function get_dir_pe(path, project)
  if is_absolute_path(path) then
     return path
  end
  return "/home/joaquin/Documents/Proyectos/PairEyewear/" .. project .. "/" .. path
end

Worktree.on_tree_change(function(op, path, upstream)
    dir = path["path"]
    if op == Worktree.Operations.Switch and is_pc_api_rails() then
      kill_window("peer-api-rails:run")
      tree_dir = get_dir(dir, "api-rails")
      add_window("peer-api-rails", "run", tree_dir, "docker-compose -f docker/docker-compose.yml up --build")
    end
    if op == Worktree.Operations.Switch and is_pc_app() then
      tree_dir = get_dir(dir, "app")
      kill_window("peer-app:run")
      add_window("peer-app", "run", tree_dir, "npm start")
    end

    if op == Worktree.Operations.Switch and is_pc_www() then
      tree_dir = get_dir(dir, "www")
      kill_window("peer-www:run-www")
      add_window("peer-www", "run-www", tree_dir, "npm start")
    end

    if op == Worktree.Operations.Switch and is_pc_cms() then
      tree_dir = get_dir(dir, "cms")
      kill_window("peer-www:run-cms")
      add_window("peer-www", "run-cms", tree_dir, "npm start")
    end

    if op == Worktree.Operations.Switch and is_pc_api_node() then
      tree_dir = get_dir(dir, "api-node")
      kill_window("peer-api-node:run")
      add_window("peer-api-node", "run", tree_dir, "docker-compose -f docker/docker-compose.yaml up --build")
    end

    if op == Worktree.Operations.Switch and is_pe_api() then
      kill_window("eyewear:run")
      vim.g.pe_api_branch = get_branch(dir) 
      add_window("eyewear", "run", vim.env.PE_PATH .. "/docker", string.format("./scripts/start.bash.clark -s %s -f %s", vim.g.pe_api_branch, vim.g.pe_app_branch))
    end

    if op == Worktree.Operations.Switch and is_pe_app() then
      kill_window("eyewear:run")
      vim.g.pe_app_branch = get_branch(dir) 
      add_window("eyewear", "run", vim.env.PE_PATH .. "/docker", string.format("./scripts/start.bash.clark -s %s -f %s", vim.g.pe_api_branch, vim.g.pe_app_branch))
    end

    if op == Worktree.Operations.Create and is_pc_www() then
        os.execute(string.format("cp -r $PC_PATH/www/master/node_modules $PC_PATH/www/%s", dir))
        os.execute(string.format("cp -r $PC_PATH/www/master/.env.development $PC_PATH/www/%s", dir))
    end

    if op == Worktree.Operations.Create and is_pc_app() then
        os.execute(string.format("cp -r $PC_PATH/app/master/node_modules $PC_PATH/app/%s", dir))
        os.execute(string.format("cp -r $PC_PATH/app/master/.env $PC_PATH/app/%s", dir))
    end

    if op == Worktree.Operations.Create and is_pc_api_node() then
        os.execute(string.format("cp -r $PC_PATH/api-node/master/node_modules $PC_PATH/api-node/%s", dir))
        os.execute(string.format("cp -r $PC_PATH/api-node/master/.env $PC_PATH/api-node/%s", dir))
    end

    if op == Worktree.Operations.Create and is_pc_api_rails() then
        os.execute(string.format("cp -r $PC_PATH/api-rails/master/.env $PC_PATH/api-rails/%s", dir))
        os.execute(string.format("cp -r  $PC_PATH/api-rails/%s/config/database.sample.yml $PC_PATH/api-rails/%s/config/database.yml", dir, dir))
    end

    if op == Worktree.Operations.Create and is_pe_api() then
        os.execute(string.format("cp -r $PE_PATH/api/develop/docker/local $PE_PATH/api/%s/docker", dir))
        os.execute(string.format("cp -r $PE_PATH/api/develop/.husky $PE_PATH/api/%s", dir))
        os.execute(string.format("cp -r $PE_PATH/api/develop/node_modules $PE_PATH/api/%s", dir))
        os.execute(string.format("cp -r $PE_PATH/api/develop/.env $PE_PATH/api/%s", dir))
    end

    if op == Worktree.Operations.Create and is_pe_app() then
        os.execute(string.format("cp -r $PE_PATH/app/develop/docker/local $PE_PATH/app/%s/docker", dir))
        os.execute(string.format("cp -r $PE_PATH/app/develop/.husky $PE_PATH/app/%s", dir))
        os.execute(string.format("cp -r $PE_PATH/app/develop/node_modules $PE_PATH/app/%s", dir))
        os.execute(string.format("cp -r $PE_PATH/app/develop/.env $PE_PATH/app/%s", dir))
    end

end)

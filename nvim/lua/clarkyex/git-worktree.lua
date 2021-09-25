local Worktree = require("git-worktree")

local function is_pe_api()
    return not not (string.find(vim.loop.cwd(), vim.env.PE_PATH .. "/api",1, true))
end

local function is_pe_app()
    return not not (string.find(vim.loop.cwd(), vim.env.PE_PATH .. "/app",1, true))
end

local function is_kiddom_app()
    return not not (string.find(vim.loop.cwd(), vim.env.KIDDOM_PATH .. "/app",1, true))
end

local function is_kiddom_api()
    return not not (string.find(vim.loop.cwd(), vim.env.KIDDOM_GO_PATH,1, true))
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

local function get_dir_kiddom_api(path)
  if is_absolute_path(path) then
    return path
  end
  return vim.env.KIDDOM_GO_PATH .. "/" .. path
end

local function get_dir_kiddom(path, project)
  if is_absolute_path(path) then
    return path
  end
  return vim.env.KIDDOM_PATH .. "/" .. project .. "/" .. path
end

Worktree.on_tree_change(function(op, path, upstream)
    dir = path["path"]
    if op == Worktree.Operations.Switch then
      require("harpoon.term").clear_all()
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

    if op == Worktree.Operations.Switch and is_kiddom_api() then
      tree_dir = get_dir_kiddom_api(dir)
      kill_window("kiddom:run-api")
      add_window("kiddom", "run-api", tree_dir,  vim.env.KIDDOM_RUN_GO)
    end

    if op == Worktree.Operations.Switch and is_kiddom_app() then
      tree_dir = get_dir_kiddom(dir, "web")
      kill_window("kiddom:run-web")
      add_window("kiddom", "run-web", tree_dir, "npm start")
    end
    if op == Worktree.Operations.Create and is_kiddom_api() then
        os.execute(string.format("cp -r $KIDDOM_GO_PATH/master/application/config/app.json %s", dir .. "/application/config/app.json"))
        os.execute(string.format("cp -r $KIDDOM_GO_PATH/master/application/config/test.json %s", dir .. "/application/config/test.json"))
    end

    if op == Worktree.Operations.Create and is_kiddom_app() then
        os.execute(string.format("cp -r $KIDDOM_PATH/web/master/node_modules $KIDDOM_PATH/app/%s", dir))
        os.execute(string.format("cp -r $KIDDOM_PATH/web/master/config/local.config.js $KIDDOM_PATH/web/%s/config/local.config.js", dir))
    end

end)

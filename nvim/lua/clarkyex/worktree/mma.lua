local Worktree = require("git-worktree")
local Common = require("clarkyex.worktree.common")
local MMA = {}

local function get_dir(repo) 
  return vim.env.PODCHAIN_PATH .. "/mma-treasures/" .. repo
end

local function is_mma_api()
    return not not (string.find(vim.loop.cwd(), get_dir("api"),1, true))
end

local function is_mma_app()
    return not not (string.find(vim.loop.cwd(), get_dir("app"),1, true))
end

function MMA.on_tree_change(op, path, upstream, dir) 
    if op == Worktree.Operations.Switch and is_mma_api() then
      Common.kill_window("mma-api:run")
      Common.add_window("mma-api", "run", get_dir("api/" .. Common.get_branch(dir)), "./stop.sh && ./start.sh up")
    end

    if op == Worktree.Operations.Switch and is_mma_app() then
      print(dir)
      Common.kill_window("mma-app:run")
      Common.add_window("mma-app", "run", get_dir("app/" .. Common.get_branch(dir)), "npm run dev")
    end

    if op == Worktree.Operations.Create and is_mma_api() then
        os.execute(string.format("cp -r $PODCHAIN_PATH/mma-treasures/api/develop/.husky $PODCHAIN_PATH/mma-treasures/api/%s", dir))
        os.execute(string.format("cp -r $PODCHAIN_PATH/mma-treasures/api/develop/node_modules $PODCHAIN_PATH/mma-treasures/api/%s", dir))
        os.execute(string.format("cp -r $PODCHAIN_PATH/mma-treasures/api/develop/.env $PODCHAIN_PATH/mma-treasures/api/%s", dir))
    end

    if op == Worktree.Operations.Create and is_mma_app() then
        os.execute(string.format("cp -r $PODCHAIN_PATH/mma-treasures/app/develop/.husky $PODCHAIN_PATH/mma-treasures/app/%s", dir))
        os.execute(string.format("cp -r $PODCHAIN_PATH/mma-treasures/app/develop/node_modules $PODCHAIN_PATH/mma-treasures/app/%s", dir))
        os.execute(string.format("cp -r $PODCHAIN_PATH/mma-treasures/app/develop/.env $PODCHAIN_PATH/mma-treasures/app/%s", dir))
    end
end

return MMA

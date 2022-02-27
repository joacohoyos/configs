local Worktree = require("git-worktree")
local MMA = require("clarkyex.worktree.mma")

Worktree.on_tree_change(function(op, path, upstream)
    dir = path["path"]
    if op == Worktree.Operations.Switch then
      require("harpoon.term").clear_all()
    end
    MMA.on_tree_change(op, path, upstream, dir)
end)

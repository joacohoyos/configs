local Worktree = require('git-worktree')
local JPG = require('clarkyex.worktree.jpg')

Worktree.on_tree_change(function(op, path, upstream)
    dir = path['path']
    if op == Worktree.Operations.Switch then
        require('harpoon.term').clear_all()
    end
    JPG.on_tree_change(op, path, upstream, dir)
end)

local Common = {}

function Common.kill_window(session_name)
    os.execute(string.format("tmux kill-window -t %s", session_name))
end

function Common.kill_pane(pane_name)
    os.execute(string.format("tmux kill-pane -t %s", pane_name))
end

function Common.is_absolute_path(path)
  return not not (string.find(path, "/", 1, true))
end

function Common.add_window(session, window, dir, cmd)
    os.execute(string.format("tmux neww -t %s: -n %s -d  -c %s", session, window , dir))
    os.execute(string.format("tmux send-keys -t %s:%s \"%s\" C-m",session,window, cmd))
end

function Common.join_panes(source_pane, target_pane)
    os.execute(string.format("tmux join-pane -h -s %s -t %s", source_pane,target_pane))
end

function Common.get_dir(path, project, repo)
  if Common.is_absolute_path(path) then
     return path
  end
  return project .. "/" .. repo .. "/" .. path
end

function Common.get_branch(path)
  if Common.is_absolute_path(path) then
    str = path .. "/"
    for a in str:gmatch("(.-)/")  do
      branch = a
    end
    return branch
  end 
  return path
end

return Common

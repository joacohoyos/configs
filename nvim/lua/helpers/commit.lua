local commit = {}

function commit.commit()
  message = vim.fn.input("Commit message: ")
  if message == "" then
    cmd = "git commit \n"
  else
  cmd = "gcm \"" .. message .. "\"\n"
  end
  require("harpoon.term").sendCommand(1 ,cmd)
  require("harpoon.term").gotoTerminal(1)
end

function commit.ammend()
  cmd = "git commit --amend \n"
  require("harpoon.term").sendCommand(1 ,cmd)
  require("harpoon.term").gotoTerminal(1)
end

return commit

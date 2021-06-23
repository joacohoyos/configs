local commit = {}

function commit.command()
  message = vim.fn.input("Commit message: ")
  cmd = "gcm \"" .. message .. "\"\n"
  require("harpoon.term").sendCommand(1 ,cmd)
  require("harpoon.term").gotoTerminal(1)
end

return commit

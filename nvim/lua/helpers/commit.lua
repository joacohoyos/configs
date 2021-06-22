local commit = {}

function commit.command()
  message = vim.fn.input("Commit message: ")
  cmd = "gcm \"" .. message .. "\""
  require("harpoon.term").sendCommand(1 ,cmd)
end

return commit

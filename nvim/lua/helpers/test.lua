local test = {}

function test.command(runAll)
  if runAll then
    cmd = "npm run test -- -u --coverage " .. "\n"
  else
    dir = vim.fn.expand("%:p:h")
    cmd = "npm run test -- -u " .. dir .. "\n"
  end
  require("harpoon.term").sendCommand(2 ,cmd)
  require("harpoon.term").gotoTerminal(2)
end

return test

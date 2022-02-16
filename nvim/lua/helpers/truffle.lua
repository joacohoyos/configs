local truffle = {}

function truffle.compile()
  cmd = "truffle compile \n" 
  require("harpoon.term").sendCommand(1 ,cmd)
  require("harpoon.term").gotoTerminal(1)
end


return truffle

-- Install GUI if not present
local files = fs.list("/")

local function checkList(item, list)
  for i=1,#list do
    if list[i] == item then
      return true
    end
    
  end
  return false
end

local function printAll(list)
  for i=1,#list do
    print(list[i])
  end
end

if not checkList("blockify.lua", files) or true then
  print("Blockify is already installed! Would you like to repair installation?")
  ans = read()
  if ans == "n" then
    return
  else
    shell.run("rm /blockify.lua")
    shell.run("rm /aukit.lua")
    shell.run("rm /austream.lua")
    term.clear()
    term.setCursorPos()
  end
end
shell.run("wget https://raw.githubusercontent.com/MCJack123/AUKit/master/aukit.lua aukit.lua")
shell.run("wget https://raw.githubusercontent.com/MCJack123/AUKit/master/austream.lua austream.lua")
shell.run("wget https://raw.githubusercontent.com/imjusthereforminecraft/blockify-CCT/main/blockify.lua blockify.lua")
print("Blockify is now installed.")

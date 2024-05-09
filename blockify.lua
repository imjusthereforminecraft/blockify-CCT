local function send(file, id)
    local file = fs.open(file, "r")
    local data = file.readAll()
    file.close()
    rednet.send(id, {name = file, data = data})
end

local function receive()
    local sender, data = rednet.receive()
    local sender, name = rednet.receive()
    local file = fs.open(mainname, "w")
    file.write(data.data)
    file.close()
    return data.name
end
rednet.open("back")
::loop::
mainname = read()
term.clear()
term.setCursorPos(1,1)
if mainname ~= "list" then
    rednet.send(47, mainname)
    receive()
    if pocket then
    pocket.equipBack()
    end
    shell.run("austream "..mainname.." streamData = true")
    if pocket then
    pocket.equipBack()
    end
else
    rednet.send(47, mainname)
    thing = ""
end
while thing ~= "end" do
    sender, thing = rednet.receive()
    print(thing)
end
goto loop

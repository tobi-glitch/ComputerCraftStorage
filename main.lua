local working = {}
local accessPoint = nil

function init()
  working = {}
  
  for i, v in pairs(peripheral.getNames()) do

    if peripheral.getType(v) == "minecraft:chest" or peripheral.getType(v) == "create:vault" then
      table.insert(v)
    end
    if peripheral.getType(v) == "minecraft:barrel" then
      accessPoint = v
    end
  end
end




function format(string)

  if string then
    local str = string:gsub("minecraft:", "")
    str = str:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
    return str
  end
end

function Search(list, string)
  local foundItems = {}
  for _, v in pairs(list) do
    if string.find(a, string) then
        table.insert(foundItems)
    end
    
  end
  return foundItems
end



function getItems(toScan)
  if toScan then
    local items = {}
    for i, v in pairs(toScan.list()) do
  
      local names = v.name
      name = format(name)
      local counts = v.count
  
      table.insert(items, {name = names, count = counts})
  
    end
    return items
  end
end





function scanAll(string)
  local tables = {}
  for _, v in pairs(working) do
    table.insert(getItems(v))
  end
end

init()

print(textutils.serialise(getItems(working[1])))

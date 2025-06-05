local working = {}
local accessPoint = nil

function init()
  working = {}
  
  for i, v in pairs(peripheral.getNames()) do

    if peripheral.getType(v) == "minecraft:chest" or peripheral.getType(v) == "create:vault" then
      table.insert(working, peripheral.wrap(v))
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

function Search(list, str)
  local foundItems = {}
  for _, v in pairs(list) do
    for d, k in pairs(list) do
      if string.find(string.upper(k), string.upper(str)) then
        table.insert(foundItems, k)
    end

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





function scanAll(str)
  local total = {}
  for _, v in pairs(working) do
    table.insert(total, Search(getItems(v), str))
  end
  return total
end

init()

print(textutils.serialise(scanAll("oak")))


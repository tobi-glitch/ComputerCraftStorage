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
  if list and str then
    local foundItems = {}
    for _, v in pairs(list) do
        if string.find(string.upper(v.name), string.upper(str)) then
          table.insert(foundItems, v)
      end
    end
    if #foundItems > 0 then
        return foundItems
    end
    
  end
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
    if #items > 0 then
        return items
    end
    
  end
end





function scanAll(str)
  if str then
    local total = {}
    for _, v in pairs(working) do
  
      local items = Search(getItems(v), str)
      
      if #items > 0 then
        table.insert(total, items)
      end
    end
    return total
  end
end

init()

print(textutils.serialise(scanAll("oak")))


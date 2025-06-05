local working = {}


function init()
  working = {}
  for i, v in pairs(peripheral.getNames()) do

    if peripheral.getType(v) == "minecraft:chest" or peripheral.getType(v) == "create:vault"
      table.insert(v)
    end
  end
end




function format(string)

  local str = string:gsub("minecraft:", "")
  str = str:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
  return str
  
end


function getItems(toScan)
  local items = {}
  for i, v in pairs(toScan.list()) do

    local names = v.name
    name = format(name)
    local counts = v.count

    table.insert(items, {name = names, count = counts})

  end
  return items
end

  

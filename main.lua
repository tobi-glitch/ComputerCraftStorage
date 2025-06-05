local activePeripherals = peripheral.find("inventory")

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

print(peripheral.getName(activePeripherals))
  

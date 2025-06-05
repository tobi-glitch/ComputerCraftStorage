local activePeripherals = peripheral.find("inventory")

function format(string)

  local str = string:gsub("minecraft:", "")
  str = str:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
  return str
  
end


function getItems(toScan)
  local items = []
  for i, v in pairs(peri.list()) do

    local names = v.name
    name = format(name)
    local counts = v.count

    table.insert(items, {name = names, count = counts})

  end
  return items
end

for i, v in pairs(activePeripherals) do
  print(peripheral.getName(v))
  for o, b in pairs(getItems)
    print(b.name, b.count)
  end
end
  


function format(string)

  local str = string:gsub("minecraft:", "")
  str = str = str:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
  return str
  
end


function getItems(toScan)
  local peri = peripheral.wrap(toScan)

  for i, v in pairs(peri.list()) do

    local name = v.name
    name = format(name)
    local count = v.count
    print(name.." - "..count)

  end
end

getItems()
  

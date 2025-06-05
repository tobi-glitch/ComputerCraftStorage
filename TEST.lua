for i, _ in pairs(peripheral.getNames()) do

  if peripheral.getType(_) == "inventory" then
    print(_)
  end
  
end

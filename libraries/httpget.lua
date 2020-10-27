print("Loading HTTPGET libary by Sylvezar")
local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end
function random(length)
  math.randomseed(os.time())

  if length > 0 then
    return random(length - 1) .. charset[math.random(1, #charset)]
  else
    return ""
  end
end
local function httpget(url)
return game:HttpGet(url..?random(10).."="..random(10),true)
end

return httpget
print("Loading Libraries...")
-- libraries
local librarylist = {}
librarylist.gui = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/gui.lua"
librarylist.httpget = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/httpget.lua"
local librariesabc = {}
local function httpget(url)
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
return game:HttpGet(url..?random(10).."="..random(10),true)
end
local function include(libraryname,library)
librariesabc[libraryname] = library
end
for libraryname,library in pairs(librarylist) do
	spawn(function()
		print(libraryname,library)
		include(libraryname,loadstring(httpget(library))())
	end)
end
_G.framz = librariesabc
return librariesabc
print("Loading Libraries...")
-- libraries
local librarylist = {}
librarylist.gui = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/gui.lua"
librarylist.httpget = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/httpget.lua"
local librariesabc = {}
local function httpget(url)
return game:HttpGet(url,true)
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
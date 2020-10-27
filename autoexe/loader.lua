print("Loading Libraries...")
-- libraries
local librarylist = {}
librarylist.gui = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/gui.lua"
librarylist.httpget = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/httpget.lua"


print("debug")
local libraries = {}
local function httpget(url)
return game:HttpGet(url,true)
end
local function include(libraryname,library)
libraries[libraryname] = library
end
for libraryname,library in pairs(librarylist) do
	print(libraryname,library)
	include(libraryname,loadstring(httpget(library))())
end
_G.libraries = libraries
return libraries
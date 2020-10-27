print("Loading Libraries...")
-- libraries
local librarylist = {}
librarylist.gui = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/gui.lua"
librarylist.httpget = "https://raw.githubusercontent.com/Sylvezar/a/main/libraries/httpget.lua"



local libraries = {}
local function httpget(url)
return game:HttpGet(url,true)
end
local function include(libraryname,library)
libraries[libraryname] = library
end
for libraryname,library in pairs(librarylist) do
	include(libraryname,loadstring(httpget(library))())
end
print("Loaded "..#libraries)
_G.libraries = libraries
return libraries
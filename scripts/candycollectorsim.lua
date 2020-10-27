local settings = {
	Anti_Afk = false,
	Purchase_Pet = false,
	Purchase_Suit = false,
	Rebirth = false,
	Money = false,
	Auto_Delete_Pets = false,
	Auto_Delete_Suit = false
}
 
local modules = game.ReplicatedStorage.Modules
local network = require(modules.Network_Module)
-- check if it works
-- local petlist = require(modules.PetList)
local dorun = true
pcall(function()_G.cancelAutorun()end)
_G.cancelAutorun = function()
dorun = false
end
 
local autorun = function(functionrun)
	spawn(function()
		while dorun do
			functionrun()
			wait()
		end
	end)
end
if true then
	local a=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
		if settings.Anti_Afk then
			a:CaptureController()
			a:ClickButton2(Vector2.new())
		end
	end)
end
autorun(function()
	if settings.Purchase_Pet then
		network:FireServer("OpenEgg","AngelEgg")
		wait(0.5)
	end
end)
 
autorun(function()
	if settings.Purchase_Suit then
		network:FireServer("OpenChest","GreenChest")
		wait(0.5)
	end
end)
autorun(function()
	if settings.Rebirth then
		network:FireServer("Rebirth")
		wait(1)
	end
end)
autorun(function()
	if settings.Money then
		network:FireServer("SellCandy",math.huge)
	end
end)
 
 
local sc = Instance.new("ScreenGui",game.CoreGui)
local mainframe = Instance.new("Frame",sc)
local buttonframe = Instance.new("Frame",mainframe)
for a,b in pairs(settings) do
	local button = Instance.new("TextButton",buttonframe)
	local function buttontext(val)
		if val then
			button.Text = string.gsub(a,"_"," ").." ON"
		else
			button.Text = string.gsub(a,"_"," ").." OFF"
		end
	end
	buttontext(b)
	button:MouseButton1Click:Connect(function(...)
		settings[a] = not settings[a]
		buttontext(settings[a])
	end)
end
local list = buttonframe:GetChildren()
for a,b in pairs(buttonframe:GetChildren()) do
local size = 1/#list
local aminus1 = a-1
b.Size = Udim2.new(1,-10,size,-10)
b.Position = Udim2.new(0,5,size*aminus1,5)
end
local mainx,mainy = 600,900
mainframe.Active = true
mainframe.Draggable = true
buttonframe.Draggable = false
buttonframe.Size = Udim2.new(1,0,0.9,0)
buttonframe.Position = Udim2.new(0,0,0.1,0)
mainframe.Size = Udim2.new(0,mainx,0,mainy)
mainframe.Position = Udim2.new(0.5,mainx/2,mainy/2)
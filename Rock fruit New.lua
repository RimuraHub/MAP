------[[ function ]]------

local function GetN_Child(Folder, Class)
    local names = {}
    for _, v in pairs(Folder:GetChildren()) do
        if v:IsA(Class) then
            table.insert(names, v.Name)
        end
    end
    return names
end
local function GetN_Des(Folder, Class)
    local names = {}
    for _, v in pairs(Folder:GetDescendants()) do
        if v:IsA(Class) then
            table.insert(names, v.Name)
        end
    end
    return names
end
local function AddDropdown(q,w,e,r,t,y)
q:AddDropdown({Name=w,Options=e,Default=r,Flag=t,Callback=y})
end
local function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end

------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Easter = GetN_Child(workspace.npcClick,"Part")
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
local _gv = getgenv()

------[[ Ui library ]]------

local Window = redzlib:MakeWindow({
    Title = "Rimuru Hub : " .. NameMap,
    SubTitle = "",
    SaveFolder = "",
})
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) },
})
local T1 = Window:MakeTab({"Discord", "Info"})
local T4 = Window:MakeTab({"Teleport", "Signal"})
T1:AddDiscordInvite({
    Name = "Rimura Hub | Community",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
AddDropdown(T4, "Select Easter Eggs", Easter, "nil", "Easter", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Easter Egg", function()
   for _, v in pairs(workspace.npcClick:GetDescendants()) do
      if v.Name == _gv.SLS then
        TP(v.CFrame * CFrame.new(0,0,0))
      end
    end
  end
})


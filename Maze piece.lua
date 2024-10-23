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
local function AddDropdownn(q,w,e,r,t,y)
q:AddDropdown({Name=w,Options=e,Default=r,Flag=t,Callback=y})
end
function _Attack()
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158),game:GetService("Workspace").Camera.CFrame)
end
function EquipTool()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") and v.Name == _G.Weapon then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
    end
  end
end
local function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end
function Up(a, b)
game:GetService("ReplicatedStorage").Events.Add:FireServer(a, b)
end

------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local island = GetN_Child(workspace.Map.Island,"Model")
local Shop = GetN_Child(workspace.Map.Shop,"Model")
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Godmey/Redz-Ui/refs/heads/main/Ui.lua"))()
local _gv = getgenv()
for _, v in pairs(workspace.Map.Mon:GetChildren()) do
  if v:IsA("Model") then
    table.insert(Mon, v.Name)
  end
end

------[[ Ui library ]]------

local Window = redzlib:MakeWindow({
    Title = "Rimura Hub : " .. NameMap, -- muyoug piece
    SubTitle = "",
    SaveFolder = "",
})
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) },
})
T1 = Window:MakeTab({"Discord", "Info"})
T2 = Window:MakeTab({"Auto Farm", "Home"})
--T6 = Window:MakeTab({"Event", "Sword"})
T3 = Window:MakeTab({"Stats", "Signal"})
T4 = Window:MakeTab({"Teleport", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub | Community",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
T2:AddSection({"| Auto Farm"})
AddDropdownn(T2, "Select Monster", Mon, "nil", "Mon", function(q)
_gv.SLM = q
end)
T2:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(w)
      _gv.ATF = w
    end
})
--[[T6:AddSection({"| Farm Mon"})
T6:AddToggle({
    Name = "Farm Zombie Set1",
    Default = false,
    Callback = function(wmm)
      _gv.ATFMonev1 = wmm
    end
})
T6:AddToggle({
    Name = "Farm Zombie Set2",
    Default = false,
    Callback = function(wmml)
      _gv.ATFMonev2 = wmml
    end
})
T6:AddSection({"| Farm Boss"})
T6:AddToggle({
    Name = "Farm Hollow Boss",
    Default = false,
    Callback = function(wmmll)
      _gv.ATFBossev = wmmll
    end
})]]
T3:AddSection({"| Up Stats"})
T3:AddToggle({
  Name = "Up Melee",
  Default = false,
  Callback = function(Melee)
    _G.Melee = Melee
      while _G.Melee do wait()
        Up("Str", 1)
      end
  end
})
T3:AddToggle({
  Name = "Up Sword",
  Default = false,
  Callback = function(Sword)
    _G.Sword = Sword
      while _G.Sword do wait()
        Up("Swo", 1)
      end
  end
})
T3:AddToggle({
  Name = "Up Defense",
  Default = false,
  Callback = function(Defense)
    _G.Defense = Defense
      while _G.Defense do wait()
        Up("Def", 1)
      end
  end
})
T3:AddToggle({
  Name = "Up DevilFruit",
  Default = false,
  Callback = function(DevilFruit)
    _G.DevilFruit = DevilFruit
      while _G.DevilFruit do wait()
        Up("Fur", 1)
      end
  end
})
T3:AddSection({"| Stats -100000000"})
T3:AddButton({"Meler", function()
Up("Str", -100000000)
end})
T3:AddButton({"Sword", function()
Up("Swo", -100000000)
end})
T3:AddButton({"Defense", function()
Up("Def", -100000000)
end})
T3:AddButton({"DevilFruit", function()
Up("Fur", -100000000)
end})
T4:AddSection({"| Island"})
AddDropdownn(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for i, v in pairs(game.workspace.Map.Island:GetChildren()) do
      if v.Name == _gv.SLIS then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot * CFrame.new(0, 0, 0)
      end
    end
  end
})
T4:AddSection({"| Shop"})
AddDropdownn(T4, "Select Shop", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(workspace.Map.Shop:GetChildren()) do
      if v.Name == _gv.SLS then
        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
      end
    end
  end
})
T5:AddSection({"| Weapon"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _G.Weapon = ooooo
end)
T5:AddButton({"NoCooldownSkill", function()
z = hookfunction(wait, function(seconds)
return z()
end)
end})


------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = game.workspace.Map.Mon
                for _, v in pairs(Monster:GetChildren()) do
                    if v.Name == _gv.SLM then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                      v.HumanoidRootPart.Transparency = 0.9
                      v.HumanoidRootPart.CanCollide = false
                      v.Head.CanCollide = false
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.ATF and humanoid.Health > 1 then
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                end
                            until not _gv.ATF or humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _gv.ATF or _gv.ATB then
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and not hrp:FindFirstChild("BodyClip") then
                local noclip = Instance.new("BodyVelocity")
                noclip.Name = "BodyClip"
                noclip.Parent = hrp
                noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                noclip.Velocity = Vector3.new(0, 0, 0)
            end
        else
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChild("BodyClip") then
                hrp.BodyClip:Destroy()
            end
        end
    end)
end)
--[[
local args = {
    [1] = "Str",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Add:FireServer(unpack(args))
local args = {
    [1] = "Def",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Add:FireServer(unpack(args))
local args = {
    [1] = "Swo",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Add:FireServer(unpack(args))
local args = {
    [1] = "Fur",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Add:FireServer(unpack(args))

workspace.Map.Island
workspace.Map.Mon
workspace.Map.Shop
workspace["Hollow Boss Levels.5000"]
workspace.Map.Mon["Zombie Set 1"]
workspace.Map.Mon["Zombie Set2"]
workspace.Map.Mon["Punk Jack Levels.???"].HumanoidRootPart
Curse Orb
]]

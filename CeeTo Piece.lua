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
local function setPlayerSimulationRadius(radius)
    local player = game.Players.LocalPlayer
    if player then
        local success, err = pcall(function()
            sethiddenproperty(player, "SimulationRadius", radius)
            sethiddenproperty(player, "MaxSimulationRadius", radius)
        end)
        if not success then
            warn("Could not set SimulationRadius: " .. err)
        end
    end
end
local function handleChestAndEnemy(autoKey, chestName, enemyFolder, enemyName, chestPosition, enemyPosition)
    spawn(function()
        while wait() do
            pcall(function()
                if _G[autoKey] then
                    setPlayerSimulationRadius(112412400000)
                    local chest = workspace:FindFirstChild(chestName)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chestPosition
                    
                    local enemy
                    if enemyFolder == nil then
                        enemy = workspace:FindFirstChild(enemyName)
                    else
                        enemy = workspace:FindFirstChild(enemyFolder):FindFirstChild(enemyName)
                    end

                    if enemy then
                        enemy.Humanoid.Health = 0
                    end

                    if chest then
                        for _, v in pairs(chest:GetDescendants()) do
                            if v:IsA("ProximityPrompt") then
                                fireproximityprompt(v, 30)
                            end
                        end
                    end
                end
            end)
        end
    end)
end

------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local island = GetN_Child(workspace.Island,"Model")
local Shop = GetN_Child(Wsp.Sell,"Model")
local Mon = {}
local itemsName = {"Sword", "DevilFruit"}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Godmey/Redz-Ui/refs/heads/main/Ui.lua"))()
local _gv = getgenv()
for _, v in pairs(Wsp.Mon:GetDescendants()) do
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
local T1 = Window:MakeTab({"Discord", "Info"})
local T2 = Window:MakeTab({"Auto Farm", "Home"})
local T3 = Window:MakeTab({"item", "Sword"})
local T4 = Window:MakeTab({"Teleport", "Signal"})
local T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub | Community",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
T2:AddSection({"| Auto Farm"})
AddDropdown(T2, "Select Monster", Mon, "nil", "Mon", function(q)
_gv.SLM = q
end)
T2:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(w)
      _gv.ATF = w
    end
})
T3:AddSection({"| AutoChest"})
T3:AddToggle({
    Name = "MeehawkV2",
    Default = false,
    Callback = function(MeehawkV2)
        _G.AutoChestMeehawkV2 = MeehawkV2
    end
})
T3:AddToggle({
    Name = "MeehawkV1",
    Default = false,
    Callback = function(MeehawkV1)
        _G.AutoChestMeehawkV1 = MeehawkV1
    end
})
T3:AddToggle({
    Name = "Dummy Snow",
    Default = false,
    Callback = function(SnowChest)
        _G.AutoChestSnow = SnowChest
    end
})
T3:AddSection({"| 🎃 Halloween Event 🎃"})
T3:AddToggle({
    Name = "PumkinBoss",
    Default = false,
    Callback = function(PumkinBossChesttoggle)
        _G.PumkinBossChest = PumkinBossChesttoggle
    end
})
T4:AddSection({"| Island"})
AddDropdown(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for i, v in pairs(game:GetService("Workspace").Island:GetDescendants()) do
      if v.Name == _gv.SLIS then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot * CFrame.new(0, 100, 0)
      end
    end
  end
})
T4:AddSection({"| Shop"})
AddDropdown(T4, "Select Shop", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(Wsp.Sell[_gv.SLS]:GetDescendants()) do
      if v:IsA("Part") then
        TP(v.CFrame * CFrame.new(0,10,0))
      end
    end
  end
})
T5:AddSection({"| Weapon"})
AddDropdown(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _G.Weapon = ooooo
end)
T5:AddSection({"| Skill"})
T5:AddToggle({
    Name = "Z",
    Default = false,
    Callback = function(Z)
      _G.Z = Z
    end
})
T5:AddToggle({
    Name = "X",
    Default = false,
    Callback = function(X)
      _G.X = X
    end
})
T5:AddToggle({
    Name = "C",
    Default = false,
    Callback = function(C)
      _G.C = C
    end
})
T5:AddToggle({
    Name = "V",
    Default = false,
    Callback = function(V)
      _G.V = V
    end
})
T5:AddButton({"NoCooldown", function()
z = hookfunction(wait, function(seconds)
return z()
end)
end})
T5:AddTextBox({
  Name = "Delay",
  Description = "", 
  PlaceholderText = "",
  Callback = function(Num)
    _G.Delay = Num
  end
})
AddDropdown(T5, "Select Weapon", itemsName, "Sword", "Weapon", function(itemsNamee)
    _G.itemName = itemsNamee -- เก็บค่าอาวุธที่เลือกใน _G.itemName
end)

------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = game:GetService("Workspace").Mon
                for _, v in pairs(Monster:GetDescendants()) do
                    if v.Name == _gv.SLM then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v.HumanoidRootPart.Size = Vector3.new(10, 20, 10)
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
coroutine.wrap(function()
    while true do
        task.wait(0)
        if _G.AutoChestMeehawkV1 then
            handleChestAndEnemy(
                "AutoChestMeehawkV1",
                "MeehawkChest",
                "Mon",
                "Meehawk  LV10000",
                CFrame.new(-538.1447, 137.0595, 1083.0084),
                CFrame.new(0, 0, 5)
            )
        end
    end
end)()
coroutine.wrap(function()
    while true do
        task.wait(0)
        if _G.AutoChestMeehawkV2 then
            handleChestAndEnemy(
                "AutoChestMeehawkV2",
                "MeehawkV2Chest",
                "Mon",
                "MeehawkV2  LV10000",
                CFrame.new(-1570.245, 87.7786, -368.3696),
                CFrame.new(0, 0, 5)
            )
        end
    end
end)()
coroutine.wrap(function()
    while true do
        task.wait(0)
        if _G.AutoChestSnow then
            handleChestAndEnemy(
                "AutoChestSnow",
                "DummySnowChest",
                "Mon",
                "MeehawkV2  LV10000",
                CFrame.new(-1855.7095, 100.1431, 510.1954),
                CFrame.new(0, 0, 5)
            )
        end
    end
end)()
coroutine.wrap(function()
    while true do
        task.wait(0)
        if _G.AutoPumkinBossChest then
            handleChestAndEnemy(
                "AutoPumkinBossChest",
                "PumkinBossChest",
                nil,
                "PumkinBoss  LV20000",
                CFrame.new(-1308.737060546875, 91.65947723388672, -1529.1876220703125),
                CFrame.new(0, 0, 5)
            )
        end
    end
end)()
spawn(function()
    while true do
        task.wait(_G.Delay or 0)
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player.PlayerGui
        if _G.Z then
            game:GetService("Players")[player.Name].PlayerGui[player.Name .. _G.itemName].MobileZ.LocalScript.RemoteEvent:FireServer()
        elseif _G.X then
            game:GetService("Players")[player.Name].PlayerGui[player.Name .. _G.itemName].MobileX.LocalScript.RemoteEvent:FireServer()
        elseif _G.C then
            game:GetService("Players")[player.Name].PlayerGui[player.Name .. _G.itemName].MobileC.LocalScript.RemoteEvent:FireServer()
        elseif _G.V then
            game:GetService("Players")[player.Name].PlayerGui[player.Name .. _G.itemName].MobileV.LocalScript.RemoteEvent:FireServer()
        end
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

local _SpeedPiece = 74193535211122
local _DungeonID = 7716726054068
local _DungeonID2 = 77167260540689
local _gv = getgenv()
if game.PlaceId == _SpeedPiece then
  
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
    game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function EquipTool()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == _gv.Weapon then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end
function EquipToolSele(NameWeapon)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == NameWeapon then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end
function TP(cframe,v)
    pcall(function()
      if v then
        local character = game.Players.LocalPlayer.Character
           if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
           end
      else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        end
    end)
end
function sendNotification(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration
    })
end
function fpp()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
        end
    end
end
function identifyexploit()
    local ieSuccess, ieResult = pcall(identifyexecutor)
    if ieSuccess then return ieResult end
    return (SENTINEL_LOADED and "Sentinel") or (XPROTECT and "SirHurt") or (PROTOSMASHER_LOADED and "Protosmasher") or "Unknown"
end
function Up(a,b)
game:GetService("ReplicatedStorage").RemoteEvent.Stats:FireServer(a,b)
end
function HandleKeyPress()
    if _gv.Z then
        SendKeyEvent(122)
    end
    if _gv.X then
        SendKeyEvent(120)
    end
    if _gv.V then
        SendKeyEvent(118)
    end
    if _gv.C then
        SendKeyEvent(99)
    end
end
function SendKeyEvent(keyCode)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, keyCode, false, game)
end

------[[ Local Global ]]------

local Wsp = game.workspace
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local island = GetN_Child(game.workspace.Island,"Model")
local Shop = {}
local Mon = GetN_Des(game.workspace.Monster,"Model")
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
for _, v in pairs(workspace.NPC:GetChildren()) do
    if v.Name then
        table.insert(Shop, v.Name)
    end
end

------[[ Ui library ]]------

local Window = redzlib:MakeWindow({
    Title = "Rimura Hub : " .. NameMap,
    SubTitle = "Executor : " .. identifyexploit(),
    SaveFolder = "",
})
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) },
})
T1 = Window:MakeTab({"Discord", "Info"})
T2 = Window:MakeTab({"Auto Farm", "Home"})
T3 = Window:MakeTab({"Stats", "Signal"})
T4 = Window:MakeTab({"Teleport", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
T2:AddSection({"| Auto Farm"})
AddDropdownn(T2, "Select Monster", Mon, "nil", "Mon", function(q)
_gv.SLM = q
end)
T2:AddToggle({
    Name = "Farm Mon Select",
    Default = false,
    Callback = function(w)
      _gv.ATF = w
    end
})
T2:AddToggle({
    Name = "Farm All Mon",
    Default = false,
    Callback = function(wml)
      _gv.ATFA = wml
    end
})
T2:AddSection({"| Dungeon"})
T2:AddButton({"Teleport TO Dungeon", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Other["Dungeon Portal"].CFrame
end})
T2:AddSection({"| Fishing"})
T2:AddButton({"Unlock gamepass AutoFish", function()
  game:GetService("Players").LocalPlayer.Gamepass["Auto Fish"].Value = true
end})
--[[
T2:AddTextBox({
  Name = "Dupe Count",
  Description = "", 
  PlaceholderText = "",
  Callback = function(Value)
    _gv.Count = Value
  end})
T2:AddButton({"DUPE", function()
for i = 1, _gv.Count do
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character

    if character and character:FindFirstChild("Fishing rod") then
        local fishingRod = character:FindFirstChild("Fishing rod")
        if fishingRod:FindFirstChild("Main") and fishingRod.Main:FindFirstChild("RemoteFunction") then
            fishingRod.Main.RemoteFunction:InvokeServer("Reward")
         else
           EquipToolSele("Fishing rod")
        end
    end
end
end})
T2:AddToggle({
    Name = "Fishing Dupe",
    Default = false,
    Callback = function(klm)
      _gv.dupe = klm
    end
})]]
T2:AddSection({"| Auto Skill"})
AddDropdownn(T2, "Select Mod", {"Farm","skill"}, "Farm", "Modskill", function(selekey)
_gv.keysele = selekey
end)
T2:AddToggle({
  Name = "Auto shoot Pink Tea Gun[AimbotMon]",
  Default = false,
  Callback = function(aim)
    _gv.Aimbot = aim
  end
})
T2:AddToggle({
  Name = "Z",
  Default = true,
  Callback = function(Z)
    _gv.Z = Z
  end
})
T2:AddToggle({
  Name = "X",
  Default = true,
  Callback = function(X)
    _gv.X = X
  end
})
T2:AddToggle({
  Name = "C",
  Default = true,
  Callback = function(C)
    _gv.C = C
  end
})
T2:AddToggle({
  Name = "V",
  Default = true,
  Callback = function(V)
    _gv.V = V
  end
})
T3:AddSection({"| Up Stats"})
T3:AddSlider({"UP", 1, 100, 1, 1, function(VALUE)
_gv.StatsNum = VALUE
end})
T3:AddToggle({
  Name = "Up Melee",
  Default = false,
  Callback = function(Strength)
    _gv.Strength = Strength
      while _gv.Strength do task.wait()
        Up("Melee",StatsNum)
      end
  end
})
T3:AddToggle({
  Name = "Up Defence",
  Default = false,
  Callback = function(Defense)
    _gv.Defense = Defense
      while _gv.Defense do task.wait()
        Up("Defence",StatsNum)
      end
  end
})
T3:AddToggle({
  Name = "Up Sword",
  Default = false,
  Callback = function(Weapon)
    _gv.Weapon = Weapon
      while _gv.Weapon do task.wait()
        Up("Sword",StatsNum)
      end
  end
})
T3:AddToggle({
  Name = "Up Power",
  Default = false,
  Callback = function(Royal)
    _gv.Royal = Royal
      while _gv.Royal do task.wait()
        Up("Power",StatsNum)
      end
  end
})
T4:AddSection({"| Island"})
AddDropdownn(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for _, v in pairs(workspace.Island:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLIS then
       TP(v.WorldPivot,false)
      end
    end
  end
})
T4:AddSection({"| NPC"})
AddDropdownn(T4, "Select NPC", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport NPC", function()
pcall(function()
    for _, v in pairs(workspace.NPC:GetChildren()) do
        if v.Name == _gv.SLS then
            pcall(function()
                TP(v.WorldPivot, false)
            end)
            pcall(function()
                TP(v.CFrame, true)
            end)
        end
    end
end)
  end
})
T5:AddSection({"| Settings"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _gv.Weapon = ooooo
end)
T5:AddToggle({
    Name = "One Shot",
    Default = false,
    Callback = function(_One)
        _gv.OneHit = _One
    end
})

------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = workspace.Monster
                for _, v in pairs(Monster:GetDescendants()) do
                    if v:IsA("Model") and v.Name == _gv.SLM then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                local Humanoids = v:FindFirstChildOfClass("Humanoid")
                                if _gv.OneHit and Humanoids.Health < Humanoids.MaxHealth and Humanoids.Health > 0 then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                      task.wait(0.1)
                                    Humanoids.Health = 0
                                end
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.ATF and humanoid.Health > 1 then
                                  if v:FindFirstChild("HumanoidRootPart") then
                                     TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                  else
                                     TP(v.WorldPivot * CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(-90), 0, 0),false)
                                   end
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
    while true do
        task.wait()
        pcall(function()
            if _gv.ATFA then
                local Monster = workspace.Monster
                for _, v in pairs(Monster:GetDescendants()) do
                    if v:IsA("Model") and v.Name then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                local Humanoids = v:FindFirstChildOfClass("Humanoid")
                                if _gv.OneHit and Humanoids.Health < Humanoids.MaxHealth and Humanoids.Health > 0 then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                      task.wait(0.1)
                                    Humanoids.Health = 0
                                end
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.ATFA and humanoid.Health > 1 then
                                  if v:FindFirstChild("HumanoidRootPart") then
                                     TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                  else
                                     TP(v.WorldPivot * CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(-90), 0, 0),false)
                                   end
                                end
                            until not _gv.ATFA or humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while true do
      task.wait()
         pcall(function()
            if _gv.keysele == "skill" then
               HandleKeyPress()
            end
        end)
    end
end)
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _gv.Aimbot then
                local GUNRANGE = 100
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("Pink Tea Gun") then
                    local gun = character["Pink Tea Gun"]
                    local remote = gun:FindFirstChild("A") and gun.A:FindFirstChild("RemoteEvent")
                    if remote then
                        local closestMonster = nil
                        local closestDistance = GUNRANGE
                        for _, v in ipairs(workspace.Monster:GetDescendants()) do
                            if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
                                local distance = (character.HumanoidRootPart.Position - v.Position).Magnitude
                                if distance <= closestDistance then
                                    closestDistance = distance
                                    closestMonster = v
                                end
                            end
                        end
                        if closestMonster then
                            remote:FireServer(closestMonster.CFrame)
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while true do
      task.wait()
         pcall(function()
           if _gv.dupe then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishing rod") then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishing rod").Main.RemoteFunction:InvokeServer("Reward")
                else
                  EquipToolSele("Fishing rod")
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _gv.ATF or _gv.ATFA or _gv.ATFSD then
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
workspace.Monster.Boss["Six kagayno [Lv.1500]"]
workspace.NPC["???"].EPart.ProximityPrompt
Shadow Orb
]]
else

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
    game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function EquipTool()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == _gv.Weapon then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end
function TP(cframe,v)
    pcall(function()
        if v then
          local character = game.Players.LocalPlayer.Character
            if character and character.PrimaryPart then
               character:SetPrimaryPartCFrame(cframe)
            end
        else
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        end
    end)
end
function sendNotification(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration
    })
end
function identifyexploit()
    local ieSuccess, ieResult = pcall(identifyexecutor)
    if ieSuccess then return ieResult end
    return (SENTINEL_LOADED and "Sentinel") or (XPROTECT and "SirHurt") or (PROTOSMASHER_LOADED and "Protosmasher") or "Unknown"
end
function HandleKeyPress()
    if _gv.Z then
        SendKeyEvent(122)
    end
    if _gv.X then
        SendKeyEvent(120)
    end
    if _gv.V then
        SendKeyEvent(118)
    end
    if _gv.C then
        SendKeyEvent(99)
    end
end
function SendKeyEvent(keyCode)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, keyCode, false, game)
end

------[[ Local Global ]]------

local Wsp = game.workspace
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()

------[[ Ui library ]]------

local Window = redzlib:MakeWindow({
    Title = "Rimura Hub : " .. NameMap,
    SubTitle = "Executor : " .. identifyexploit(),
    SaveFolder = "",
})
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) },
})
T1 = Window:MakeTab({"Discord", "Info"})
T6 = Window:MakeTab({"Dungeon", "Gamepad"})
T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
T6:AddSection({"| Dungeon"})
T6:AddToggle({
  Name = "Farm Mob",
  Default = false,
  Callback = function(ZMl)
    _gv.AFD = ZMl
  end
})
T6:AddButton({"Hop join", function()
game:GetService("TeleportService"):Teleport(game.PlaceI)
end})
T6:AddSection({"| Auto Skill"})
AddDropdownn(T6, "Select Mod", {"Farm","skill"}, "Farm", "Modskill", function(selekey)
_gv.keysele = selekey
end)
T6:AddToggle({
  Name = "Auto shoot Pink Tea Gun[AimbotMon]",
  Default = false,
  Callback = function(aim)
    _gv.Aimbot = aim
  end
})
T6:AddToggle({
  Name = "Z",
  Default = false,
  Callback = function(Z)
    _gv.Z = Z
  end
})
T6:AddToggle({
  Name = "X",
  Default = false,
  Callback = function(X)
    _gv.X = X
  end
})
T6:AddToggle({
  Name = "C",
  Default = false,
  Callback = function(C)
    _gv.C = C
  end
})
T6:AddToggle({
  Name = "V",
  Default = false,
  Callback = function(V)
    _gv.V = V
  end
})
T5:AddSection({"| Settings"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _gv.Weapon = ooooo
end)

------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.AFD then
                for _, v in pairs(workspace.Monster:GetChildren()) do
                    if v:IsA("Model") and v.Name then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v.HumanoidRootPart.Size = Vector3.new(10, 30, 10)
                      v.HumanoidRootPart.Transparency = 0.9
                      v.HumanoidRootPart.CanCollide = false
                      v.Head.CanCollide = false
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.AFD and humanoid.Health > 1 then
                                  if v:FindFirstChild("HumanoidRootPart") then
                                     TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                  else
                                     TP(v.WorldPivot * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),false)
                                  end
                               end
                            until not _gv.AFD or humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while true do
      task.wait()
         pcall(function()
            if _gv.keysele == "skill" then
               HandleKeyPress()
            end
        end)
    end
end)
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _gv.Aimbot then
                local GUNRANGE = 50
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("Pink Tea Gun") then
                    local gun = character["Pink Tea Gun"]
                    local remote = gun:FindFirstChild("A") and gun.A:FindFirstChild("RemoteEvent")
                    if remote then
                        local closestMonster = nil
                        local closestDistance = GUNRANGE
                        for _, v in ipairs(workspace.Monster:GetDescendants()) do
                            if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
                                local distance = (character.HumanoidRootPart.Position - v.Position).Magnitude
                                if distance <= closestDistance then
                                    closestDistance = distance
                                    closestMonster = v
                                end
                            end
                        end
                        if closestMonster then
                            remote:FireServer(closestMonster.CFrame)
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _gv.ATD then
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
end
-- ainbot gun

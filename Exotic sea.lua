--[[ steal = Gay ]]--

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
function Eqtool(Wapmo)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == Wapmo then
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
function isntpp()
      for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:FindFirstChild("ProximityPrompt") then
            fireproximityprompt(v.ProximityPrompt, 10)
        end
    end
end

------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local Shop = GetN_Des(workspace.AllGames.Seller,"Model")
local Shopev = {"Shadow Monarch", "Kazumi The Crafter", "Jack , The GraveKeeper", "The Strongest of today", "The Strongest in History"}
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Godmey/Redz-Ui/refs/heads/main/Ui.lua"))()
local _gv = getgenv()
for _, v in pairs(workspace.AllGames.Island:GetChildren()) do
    if v:FindFirstChild("Enemy") then
        for _, item in pairs(v.Enemy:GetChildren()) do
            table.insert(Mon, item.Name)
        end
    end
end

------[[ Ui library ]]------

local Window = redzlib:MakeWindow({
    Title = "Rimura Hub : " .. NameMap,
    SubTitle = "By : cayvaii",
    SaveFolder = "",
})
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://122413984562434", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) },
})
T1 = Window:MakeTab({"Discord", "Info"})
T2 = Window:MakeTab({"Auto Farm", "Home"})
T6 = Window:MakeTab({"Event", "Sword"})
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
    Name = "Mon Farm",
    Default = false,
    Callback = function(w)
      _gv.ATF = w
    end
})

T2:AddSection({"| Boss spawn[Soon]"})

T6:AddSection({"| Mon Farm"})
T6:AddToggle({
    Name = "Events Mon Farm",
    Default = false,
    Callback = function(wm)
        _G.ATFSha = wm
    end 
})
T6:AddToggle({
    Name = "Halloween Farm",
    Default = false,
    Callback = function(wkkmk)
        _G.ATFhawo = wkkmk
    end 
})
T6:AddSection({"| Boss Farm"})
--[[
T6:AddToggle({
    Name = "Shadow Boss Farm",
    Default = false,
    Callback = function(lknk)
        _G.autobossevshadoen = lknk
    end 
})]]
T6:AddToggle({
    Name = "Halloween Boss Farm",
    Default = false,
    Callback = function(wmklmk)
        _G.autobossevHaloew = wmklmk
    end 
})
T6:AddSection({"| Candy"})
T6:AddToggle({
    Name = "Auto Trick or Treat",
    Default = false,
    Callback = function(wmll)
        _G.AuyoTot = wmll
    end 
})
T6:AddSection({"| Shop"})
AddDropdownn(T6, "Select Shop", Shopev, "nil", "Shopev", function(Sismm)
_gv.SLSev = Sismm
end)
T6:AddButton({"Teleport Shop", function()
   for _, v in pairs(workspace.AllGames:GetDescendants()) do
      if v.Name == _gv.SLSev and v:IsA("Model") then
        TP(v.WorldPivot * CFrame.new(0,10,0))
      end
    end
  end
})
T6:AddSection({"| Island"})
T6:AddButton({"Events Island", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1144.94385, 282.879974, 629.762024, -0.0163918976, 0, -0.999865651, 0, 1, 0, 0.999865651, 0, -0.0163918976)
end})
T6:AddButton({"Halloween Island", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2882.78174, 89.0025787, -297.369751, -0.290816337, 8.34218454e-08, -0.956778884, 3.43456108e-08, 1, 7.67508368e-08, 0.956778884, -1.05407594e-08, -0.290816337)
end})
T6:AddButton({"Destrtion Island", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1210.92102, 207.322876, -8979.84766, 0.0734141022, 0, -0.997301519, 0, 1, 0, 0.997301519, 0, 0.0734141022)
end})
T3:AddSection({"| Up Stats"})
T3:AddButton({"Get Stats MAX", function()
  wait(.1)
local args = {
    [1] = "Sword",
    [2] =  -999999999
}

game:GetService("ReplicatedStorage").Remote.Event.Add:FireServer(unpack(args))
end})
T3:AddToggle({
  Name = "Up Strength",
  Default = false,
  Callback = function(Melee)
    _G.Melee = Melee
  end
})
T3:AddToggle({
  Name = "Up Defense",
  Default = false,
  Callback = function(Defense)
    _G.Defense = Defense
  end
})
T3:AddToggle({
  Name = "Up Sword",
  Default = false,
  Callback = function(Sword)
    _G.Sword = Sword
  end
})
T3:AddToggle({
  Name = "Up Power",
  Default = false,
  Callback = function(Power)
    _G.Power = Power
  end
})
T3:AddToggle({
  Name = "Up Gun",
  Default = false,
  Callback = function(Gun)
    _G.Gun = Gun
  end
})
T4:AddSection({"| Shop"})
AddDropdownn(T4, "Select Shop", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(workspace.AllGames.Seller:GetDescendants()) do
      if v.Name == _gv.SLS and v:IsA("Model") then
        TP(v.WorldPivot * CFrame.new(0,10,0))
      end
    end
  end
})
T4:AddSection({"| Island"})
T4:AddButton({"Starter Village", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(632.233765, 177.595566, 857.067139, 0.691483557, 0, 0.722392201, 0, 1, 0, -0.722392201, 0, 0.691483557)
end})
T4:AddButton({"Pirate Island", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1227.40784, 140.260132, 2472.93286, 0.991962969, 4.65638905e-08, -0.126528338, -4.82412723e-08, 1, -1.01927169e-08, 0.126528338, 1.62146865e-08, 0.991962969)
end})
T4:AddButton({"Jungle Island", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2375.66626, 94.6825333, 1174.73914, 0.991962969, 5.72512242e-08, -0.126528338, -5.93142069e-08, 1, -1.2536896e-08, 0.126528338, 1.99410657e-08, 0.991962969)
end})
T4:AddButton({"HauntedCity", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(650.904053, 256.091003, 2486.16431, 0.991962969, -1.6511331e-08, -0.126528338, 1.71064301e-08, 1, 3.61670072e-09, 0.126528338, -5.75208148e-09, 0.991962969)
end})
T4:AddButton({"Desert Island", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1262.80627, 236.770203, -773.207886, -0.99753809, 6.5533257e-08, -0.0701270178, 6.59041959e-08, 1, -2.97578007e-09, 0.0701270178, -7.59011876e-09, -0.99753809)
end})
T5:AddSection({"| Weapon"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _G.Weapon = ooooo
end)
T5:AddSection({"| Instant Kill"})
T5:AddToggle({
    Name = "One Hit[Auto Farm]",
    Default = false,
    Callback = function(_One)
        _G.OneHit = _One
    end
})
T5:AddToggle({
    Name = "One Hit[All Mon](Supe lag)",
    Default = false,
    Callback = function(Monee)
getgenv().Config = {
    ["Folder Mon"] = "nil", 
    ["Instant Kill"] = Monee,
    ["Radius"] = 15
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/Godmey/Inkillallmap/main/inkill.lua'))()
    end
})
--[[
T5:AddSection({"| Skill"})
T5:AddButton({"NoCooldown", function()
z = hookfunction(wait, function(seconds)
return z()
end)
end})
T5:AddSection({"| Item"})
T5:AddTextBox({
  Name = "Name item",
  Description = "1 Item on 1 Server", 
  PlaceholderText = "item only",
  Callback = function(Value)
    itemnamenaku = Value
  end
})
T5:AddButton({"Get item", function()
local args = {
    [1] = "Change",
    [2] = itemnamenaku,
    [3] = "Inv"
}

game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
end})]]

------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = game:GetService("Workspace").AllGames.Island
                for _, mk in pairs(Monster:GetChildren()) do
                if mk:FindFirstChild("Enemy") then
                  for _, v in pairs(mk.Enemy:GetChildren()) do
                    if v:IsA("Model") and v.Name == _gv.SLM then
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
                                  local Humanoidml = v:FindFirstChildOfClass("Humanoid")
                                  if _G.OneHit and Humanoidml.Health < Humanoidml.MaxHealth and Humanoidml.Health > 0 then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        wait(0.1)
                                      Humanoidml.Health = 0
                                  end
                                     if _gv.ATF and humanoid.Health > 1 then
                                       TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 9, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    end
                                  until not _gv.ATF or humanoid.Health <= 0
                               end
                            end
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
            if _G.ATFSha then
                local ShadowdMon = workspace.AllGames.Events.Enemy
                for _, y in pairs(ShadowdMon:GetChildren()) do
                    local humanoid = y:FindFirstChild("Humanoid")
                    local hrp = y:FindFirstChild("HumanoidRootPart")
                    if hrp and humanoid and humanoid.Health > 0 then
                        y.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        y.HumanoidRootPart.Transparency = 0.9
                        y.HumanoidRootPart.CanCollide = false
                        y.Head.CanCollide = false
                        y:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                        y:FindFirstChildOfClass("Humanoid").JumpPower = 0
                                repeat
                                    task.wait()
                               _Attack()
                                  EquipTool()
                                  local Humanoidml = y:FindFirstChildOfClass("Humanoid")
                                  if _G.OneHit and Humanoidml.Health < Humanoidml.MaxHealth and Humanoidml.Health > 0 then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        wait(0.1)
                                      Humanoidml.Health = 0
                                  end
                                    if _G.ATFSha and humanoid.Health > 1 then
                                        TP(y.HumanoidRootPart.CFrame * CFrame.new(0, 9, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    end
                                until not _G.ATFSha or humanoid.Health <= 0
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
            if _G.ATFhawo then
                local HalloweenMon = workspace.AllGames.Events.Halloween.Enemy
                for _, y in pairs(HalloweenMon:GetChildren()) do
                    local humanoid = y:FindFirstChild("Humanoid")
                    local hrp = y:FindFirstChild("HumanoidRootPart")
                    if hrp and humanoid and humanoid.Health > 0 then
                        y.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        y.HumanoidRootPart.Transparency = 0.9
                        y.HumanoidRootPart.CanCollide = false
                        y.Head.CanCollide = false
                        y:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                        y:FindFirstChildOfClass("Humanoid").JumpPower = 0
                                repeat
                                    task.wait()
                               _Attack()
                                  EquipTool()
                                  local Humanoidml = y:FindFirstChildOfClass("Humanoid")
                                  if _G.OneHit and Humanoidml.Health < Humanoidml.MaxHealth and Humanoidml.Health > 0 then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        wait(0.1)
                                      Humanoidml.Health = 0
                                  end
                                    if _G.ATFhawo and humanoid.Health > 1 then
                                        TP(y.HumanoidRootPart.CFrame * CFrame.new(0, 9, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    end
                                until not _G.ATFhawo or humanoid.Health <= 0
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
       if _G.AuyoTot then
             for i, v in pairs(workspace.AllGames.Events.Halloween:GetDescendants()) do
        if v:FindFirstChild("ProximityPrompt") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3122.37231, 91.139473, -275.505554, -0.156685263, -6.2156829e-08, 0.987648606, 3.00143799e-09, 1, 6.34103188e-08, -0.987648606, 1.28998288e-08, -0.156685263)
            task.wait(0)
            fireproximityprompt(v.ProximityPrompt, 10)
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
       if _G.Melee then
        local args = {
            [1] = "Str", --Str = หมัด Def = เลือด Swo = ดาบ Fru = ผล Gu = ปืน
            [2] = 1
        }
        
        game:GetService("ReplicatedStorage").Remote.Event.Add:FireServer(unpack(args))
         end
      end)
   end
end)
spawn(function()
  while true do
    task.wait()
     pcall(function()
       if _G.Defense then
        local args = {
            [1] = "Def",
            [2] = 1
        }
        
        game:GetService("ReplicatedStorage").Remote.Event.Add:FireServer(unpack(args))
         end
      end)
   end
end)
spawn(function()
  while true do
    task.wait()
     pcall(function()
       if _G.Sword then
        local args = {
            [1] = "Swo",
            [2] = 1
        }
        
        game:GetService("ReplicatedStorage").Remote.Event.Add:FireServer(unpack(args))
         end
      end)
   end
end)
spawn(function()
  while true do
    task.wait()
     pcall(function()
       if _G.Power then
        local args = {
            [1] = "Fru",
            [2] = 1
        }
        
        game:GetService("ReplicatedStorage").Remote.Event.Add:FireServer(unpack(args))
         end
      end)
   end
end)
spawn(function()
  while true do
    task.wait()
     pcall(function()
       if _G.Gun then
        local args = {
            [1] = "Gu",
            [2] = 1
        }
        
        game:GetService("ReplicatedStorage").Remote.Event.Add:FireServer(unpack(args))
         end
      end)
   end
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        local hrp998 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if _gv.ATF and _G.ATFSha and _G.ATFhawo and _G.autobossevHaloew and _G.autobossevshadoen then
            if hrp998 and not hrp998:FindFirstChild("BodyClip") then
                local noclip = Instance.new("BodyVelocity")
                noclip.Name = "BodyClip"
                noclip.Parent = hrp998
                noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                noclip.Velocity = Vector3.new(0, 0, 0)
            end
        elseif hrp998 and hrp998:FindFirstChild("BodyClip") then
            hrp998.BodyClip:Destroy()
        end
    end)
end)

--[[ Auto boss ]]


function _Attack99()
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158),game:GetService("Workspace").Camera.CFrame)
end
function EquipTool99()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") and v.Name == _G.Weapon then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
    end
  end
end
local function TP99(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end
function Eqtool99(Wapmo)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == Wapmo then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end
function isntpp99()
      for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:FindFirstChild("ProximityPrompt") then
            fireproximityprompt(v.ProximityPrompt, 10)
        end
    end
end

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _G.autobossevshadoen then
            if workspace:FindFirstChild("Summoned Blood Knight") then
                for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:IsA("Model") and v.Name == "Summoned Blood Knight" then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                      v.HumanoidRootPart.Transparency = 0.9
                      v.HumanoidRootPart.CanCollide = false
                      v.Head.CanCollide = false
                      humanoid.WalkSpeed = 0
                      humanoid.JumpPower = 0
                            repeat
                                task.wait()
                                _Attack99()
                                EquipTool99()
                                  if _G.OneHit and humanoid.Health < humanoid.MaxHealth and humanoid.Health > 0 then
                                      sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                      task.wait(0)
                                      humanoid.Health = 0
                                  end
                                if _G.autobossevshadoen and humanoid.Health > 1 then
                                    TP99(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                end
                            until not _G.autobossevshadoen or humanoid.Health <= 0
                        end
                    end
                end
                    else
                        TP99(CFrame.new(-1093.20081, 106.200363, 660.434326))
                        task.wait(0)
                        Eqtool99("Shadow Orb")
                        task.wait(0)
                        isntpp99()
                end
            end
        end)
    end
end)

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _G.autobossevHaloew then
            if workspace:FindFirstChild("Hallow Reaper") then
                for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:IsA("Model") and v.Name == "Hallow Reaper" then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                      v.HumanoidRootPart.Transparency = 0.9
                      v.HumanoidRootPart.CanCollide = false
                      v.Head.CanCollide = false
                      humanoid.WalkSpeed = 0
                      humanoid.JumpPower = 0
                            repeat
                                task.wait()
                                _Attack99()
                                EquipTool99()
                                  if _G.OneHit and humanoid.Health < humanoid.MaxHealth and humanoid.Health > 0 then
                                      sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                      task.wait(0)
                                      humanoid.Health = 0
                                  end
                                if _G.autobossevHaloew and humanoid.Health > 1 then
                                    TP99(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                end
                            until not _G.autobossevHaloew or humanoid.Health <= 0
                        end
                    end
                end
                    else
                        TP99(CFrame.new(-3226.13037, 188.063705, -370.422729))
                        task.wait(0)
                        Eqtool99("Pumpkin")
                        task.wait(0)
                        isntpp99()
                end
            end
        end)
    end
end)
--[[
local args = {
    [1] = "Sword",
    [2] =  -999999999
}

game:GetService("ReplicatedStorage").Remote.Event.Add:FireServer(unpack(args))
local args = {
    [1] = "Change",
    [2] = "Pumpkin",
    [3] = "Inv"
}

game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
]]

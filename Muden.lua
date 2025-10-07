if game.PlaceId == 111347281646457 then
local _gv = getgenv()

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
local FireTouch = function(Part1,Part2,Time)
  firetouchinterest(Part1,Part2,Time)
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
game:GetService("ReplicatedStorage").RemoteEvents.UpPoint:FireServer(a,b)
end

------[[ Local Global ]]------

local Wsp = game.workspace
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local island = GetN_Child(game.workspace.Map.Island,"Model")
local SignalTable = GetN_Child(workspace.Map.Sign,"Model")
local Shop = GetN_Child(game.workspace.Map.Shop,"Model")
local Bosslist = {"Asta [Boss]", "King Human", "Zoro[Lv10000000]", "Gojo Ultimate [Boss]", "Yuji [Boss]", "Asrof [Boss]", "AizenV2 [Boss]", "Kirito [Boss]", "Moodeng [Boss]", "Okarun [Boss]", "KJ [Boss]", "Gojo [Boss]", "Frieren[Boss]", "Shanks [Boss]", "Black Goku [Boss]", "Core", "Madara [Boss]", "Yhwach[Boss]", "Ala God [Boss]", "Eugeo [Boss]", "Alucard [Boss]", "Sukuna [Boss]", "Starrk [Boss]", "Mr Bai [Boss]", "Mahoraga [Boss]"}
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
for _, v in pairs(workspace.SpawnEnemy:GetChildren()) do
  if v:IsA("Part") then
    table.insert(Mon, v.Name)
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
T6 = Window:MakeTab({"Dungeon", "Gamepad"})
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
AddDropdownn(T2, "Select Boss", Bosslist, "nil", "Bosslist", function(qmj)
_gv.seleboss = qmj
end)
T2:AddToggle({
    Name = "Farm Mon Select",
    Default = false,
    Callback = function(w)
      _gv.ATF = w
    end
})
T2:AddToggle({
    Name = "Farm Boss Select",
    Default = false,
    Callback = function(mugkmm)
      _gv.FSeleB = mugkmm
    end
})
T2:AddToggle({
    Name = "Farm AllBoss",
    Default = false,
    Callback = function(wm)
      _gv.ATFB = wm
    end
})
--[[
T2:AddToggle({
    Name = "Farm Asta",
    Default = false,
    Callback = function(AstaX)
      _gv.AstaX = AstaX
    end
})
T2:AddToggle({
    Name = "Farm Femto",
    Default = false,
    Callback = function(Femto)
      _gv.AFemto = Femto
    end
})
T2:AddToggle({
    Name = "Farm Femto V2",
    Default = false,
    Callback = function(FemtoV2)
      _gv.AFemtoV2 = FemtoV2
    end
})
T2:AddToggle({
    Name = "Auto Click and Find Easter Egg and Fake Easter Egg",
    Default = false,
    Callback = function(FAEE)
      _gv.FEE = FAEE
    end
})
T2:AddSection({"| Random"})
T2:AddToggle({
    Name = "Random KruBa[Money]",
    Default = false,
    Callback = function(wmmm)
      _gv.RKruba = wmmm
    end
})
T2:AddToggle({
    Name = "Random KruBa[Gem]",
    Default = false,
    Callback = function(G)
      _gv.RKrubaG = G
    end
})]]
T2:AddSection({"| Auto Skill"})
T2:AddToggle({
  Name = "Z",
  Default = false,
  Callback = function(Z)
    _gv.Z = Z
  end
})
T2:AddToggle({
  Name = "X",
  Default = false,
  Callback = function(X)
    _gv.X = X
  end
})
T2:AddToggle({
  Name = "C",
  Default = false,
  Callback = function(C)
    _gv.C = C
  end
})
T2:AddToggle({
  Name = "V",
  Default = false,
  Callback = function(V)
    _gv.V = V
  end
})
T2:AddToggle({
  Name = "B",
  Default = false,
  Callback = function(B)
    _gv.B = B
  end
})
T6:AddButton({"Teleport Dungeon", function()
for _, v in pairs(game.Workspace.Map.Portal:GetChildren()) do
    if v:IsA("Part") and v.Name then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    end
end
end})
T6:AddButton({"Join Dungeon[No spawn wait but have bug]", function()
game:GetService("TeleportService"):Teleport(76091669089883)
end})
T3:AddSection({"| Up Stats"})
T3:AddToggle({
  Name = "Up DevilFruit",
  Default = false,
  Callback = function(DevilFruit)
    _gv.DevilFruit = DevilFruit
      while _gv.DevilFruit do task.wait()
        Up("DevilFruit", "1")
      end
  end
})
T3:AddToggle({
  Name = "Up Defense",
  Default = false,
  Callback = function(Defense)
    _gv.Defense = Defense
      while _gv.Defense do task.wait()
        Up("Defense", "1")
      end
  end
})
T3:AddToggle({
  Name = "Up Sword",
  Default = false,
  Callback = function(Sword)
    _gv.Sword = Sword
      while _gv.Sword do task.wait()
        Up("Sword","1")
      end
  end
})
T3:AddToggle({
  Name = "Up Melee",
  Default = false,
  Callback = function(Melee)
    _gv.Melee = Melee
      while _gv.Melee do task.wait()
        Up("Melee","1")
      end
  end
})
T4:AddSection({"| Island"})
AddDropdownn(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for i, v in pairs(workspace.Map.Island:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLIS then
       TP(v.WorldPivot,false)
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
      if v:IsA("Model") and v.Name == _gv.SLS then
        TP(v.WorldPivot * CFrame.new(0,10,0),false)
      end
    end
  end
})
T4:AddSection({"| Sign"})
AddDropdownn(T4, "Select Sign", SignalTable, "nil", "SignalTable", function(SLSin)
_gv.SLSin = SLSin
end)
T4:AddButton({"Teleport Sign", function()
   for _, v in pairs(workspace.Map.Sign:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLSin then
        TP(v.WorldPivot * CFrame.new(0,10,0),false)
      end
    end
  end
})
T5:AddSection({"| Settings"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _gv.Weapon = ooooo
end)
T5:AddSection({"| Code"})
T5:AddButton({"Redeem All Code", function()
for _, v in pairs(game.Players.LocalPlayer.Codes:GetChildren()) do
  if v.Name then
     game:GetService("ReplicatedStorage").RedeemCode:FireServer(v.Name)
      end
   end
end})
T5:AddToggle({
    Name = "bring item",
    Default = false,
    Callback = function(item)
      _gv.gtd = item
    end
})
------[[ Spawn function ]]------

--[[
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = game.workspace.SpawnEnemy
                if Monster[_gv.SLM]:FindFirstChild(_gv.SLM) then
                for _, v in pairs(Monster:GetChildren()) do
                    if v.Name == _gv.SLM then
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
                                if _gv.BringMon == true then
                                  BringMob()
                                end
                                if _gv.ATF and humanoid.Health > 1 then
                                     TP(v[_gv.SLM].HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                 end
                            until not _gv.ATF or humanoid.Health <= 0
                        end
                    end
                end
                else
                  TP(Monster[_gv.SLM].CFrame,false)
                end
          end
        end)
    end
end)
]]
spawn(function()  
    while true do  
        task.wait()  
        pcall(function()  
            if _gv.ATF then
                local Monster = game.workspace.SpawnEnemy  
for _, v in pairs(workspace.SpawnEnemy:GetChildren()) do
    if v.Name == _gv.SLM then
        local children = v:GetChildren()
        if #children == 0 then
            TP(Monster[_gv.SLM].CFrame,false)
        else
                for _, v in pairs(Monster:GetDescendants()) do
                    if v.Name == _gv.SLM then
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
                                if _gv.ATF and humanoid.Health > 1 then
                                     TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                 end
                            until not _gv.ATF or humanoid.Health <= 0
                        end
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
            if _gv.ATFB then
                for _, v in pairs(workspace.Map["Boss Spawn"]:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "%[.+%]$") then
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
                                if _gv.ATFB and humanoid.Health > 1 then
                                   if v:FindFirstChild("HumanoidRootPart") then
                                      TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                   else
                                      TP(v.WorldPivot * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),false)
                                   end
                                end
                            until not _gv.ATFB or humanoid.Health <= 0
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
            if _gv.FSeleB then
                local Monster = game.workspace.Map["Boss Spawn"].Summons
                for _, v in pairs(Monster:GetChildren()) do
                    if v.Name == _gv.seleboss then
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
                                if _gv.FSeleB and humanoid.Health > 1 then
                                  if v:FindFirstChild("HumanoidRootPart") then
                                      TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                   else
                                      TP(v.WorldPivot * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),false)
                                   end
                                end
                            until not _gv.FSeleB or humanoid.Health <= 0
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
            if _gv.AstaX then
                 TP(game.workspace.Map["Boss Spawn"].Summons:FindFirstChild("Asta [Boss]").WorldPivot,false)
                    for _, v in pairs(workspace:GetChildren()) do
                        if v:IsA("Model") and v.Name == "Asta [Boss]" then
                            local humanoid = v:FindFirstChild("Humanoid")
                            local hrp = v:FindFirstChild("HumanoidRootPart")
                            if hrp and humanoid and humanoid.Health > 0 then
                                hrp.Size = Vector3.new(10, 30, 10)
                                hrp.Transparency = 0.9
                                hrp.CanCollide = false
                                v.Head.CanCollide = false
                                humanoid.WalkSpeed = 0
                                humanoid.JumpPower = 0
                                repeat
                                    task.wait()
                                    _Attack()
                                    EquipTool()
                                if _gv.AFemtoV2 and humanoid.Health > 1 then
                                   TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                end
                           until not _gv.AFemtoV2 or humanoid.Health <= 0
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
            if _gv.AFemto then 
                if workspace.Map["Boss Spawn"].Summons:FindFirstChild("Femto [Boss]") then
                        for _, v in pairs(workspace:GetChildren()) do 
                            if v:IsA("Model") and v.Name == "Femto [Boss]" then 
                                local humanoid = v:FindFirstChild("Humanoid") 
                                local hrp = v:FindFirstChild("HumanoidRootPart") 
                                if hrp and humanoid and humanoid.Health > 0 then 
                                  hrp.Size = Vector3.new(10, 30, 10) 
                                  hrp.Transparency = 0.9 
                                  hrp.CanCollide = false 
                                  v.Head.CanCollide = false 
                                  humanoid.WalkSpeed = 0 
                                  humanoid.JumpPower = 0 
                                  repeat 
                                     task.wait() 
                                     _Attack() 
                                     EquipTool() 
                                     if _gv.AFemto and humanoid.Health > 1 then 
                                        TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0,true)) 
                                    end 
                                until not _gv.AFemto or humanoid.Health <= 0 
                            end 
                        end 
                    end
                else 
                    local backpack = game:GetService("Players").LocalPlayer.Backpack
                    if backpack:FindFirstChild("Orb Dark") then 
                        TP(workspace.Map["Spawn Boss"].Guts.WorldPivot,false) 
                        fpp() 
                    else 
                        sendNotification("Rimuru Hub", "You don't have Orb Dark", 0.5) 
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
            if _gv.AFemtoV2 then
                if workspace.Map["Boss Spawn"].Summons:FindFirstChild("Femto [Boss]") then
                        for _, v in pairs(workspace:GetChildren()) do
                            if v:IsA("Model") and v.Name == "Femto [Boss]" then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    hrp.Size = Vector3.new(10, 30, 10)
                                    hrp.Transparency = 0.9
                                    hrp.CanCollide = false
                                    v.Head.CanCollide = false
                                    humanoid.WalkSpeed = 0
                                    humanoid.JumpPower = 0
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        if _gv.AFemtoV2 and humanoid.Health > 1 then
                                            TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                        end
                                    until not _gv.AFemtoV2 or humanoid.Health <= 0
                                end
                            end
                        end
                   else
                    local backpack = game:GetService("Players").LocalPlayer.Backpack
                    if backpack:FindFirstChild("Orb Dark") then
                        TP(workspace.Map["Spawn Boss"].Guts.WorldPivot,false)
                        fpp()
                    else
                        TP(game.workspace.Map["Boss Spawn"].Summons:FindFirstChild("Asta [Boss]").WorldPivot,false)
                            for _, v in pairs(workspace:GetChildren()) do
                                if v:IsA("Model") and v.Name == "Asta [Boss]" then
                                    local humanoid = v:FindFirstChild("Humanoid")
                                    local hrp = v:FindFirstChild("HumanoidRootPart")
                                    if hrp and humanoid and humanoid.Health > 0 then
                                      hrp.Size = Vector3.new(10, 30, 10)
                                      hrp.Transparency = 0.9
                                      hrp.CanCollide = false
                                      v.Head.CanCollide = false
                                      humanoid.WalkSpeed = 0
                                      humanoid.JumpPower = 0
                                    repeat
                                         task.wait()
                                         _Attack()
                                         EquipTool()
                                         if _gv.AFemtoV2 and humanoid.Health > 1 then
                                            TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                         end
                                    until not _gv.AFemtoV2 or humanoid.Health <= 0
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
            if _gv.RKruba then
               TP(workspace.Map.Shop["KruBa [250K Money]"].WorldPivot,false)
                  for _, v in pairs(game.workspace.Map.Shop:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                     fireproximityprompt(v.ProximityPrompt, 0)
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
            if _gv.RKrubaG then
               TP(workspace.Map.Shop["KruBa [250K Gem]"].WorldPivot,false)
                  for _, v in pairs(game.workspace.Map.Shop:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                     fireproximityprompt(v.ProximityPrompt, 0)
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
            if _gv.FEE then
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") and v.Parent and v.Parent:IsA("BasePart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
                        wait(0.5)
                        fireclickdetector(v)
                        wait(1)
                    end
                end
            end
        end)
    end
end)
spawn(function()
  while wait() do 
    pcall(function()
      if _gv.gtd then
       for _, v in pairs(workspace:GetChildren()) do
         if v:IsA("Tool") and not v:FindFirstChild("Active") then
             v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
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
            if _gv.Z then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game)
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.X then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game)
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.C then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game)
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.V then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 118, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 118, false, game)
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.B then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 98, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 98, false, game)
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _gv.ATF or _gv.ATFB or _gv.FSeleB then
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
------- [[ premium ]] --------
local PNAME = {"fly2Fluke", "godttdiop","losse100"}
if table.find(PNAME, game.Players.LocalPlayer.Name) then

--------------------------------------------------------

if game.Players.LocalPlayer.Name == "fly2Fluke" then
  sendNotification("RimuruHub","you is own!",1)
else
  sendNotification("Rimuru Hub","you have premium!",1)
end

--------------------------------------------------------

T6 = Window:MakeTab({"Premium", "Diamond"})
T6:AddSection({"| Auto Farm"})
T6:AddTextBox({
  Name = "Get Gem/Exp/Money Count",
  Description = "1 = 100Gem", 
  PlaceholderText = "",
  Callback = function(Value)
    _gv.countgem = Value
  end})
T6:AddToggle({
  Name = "Farm Gem/Exp/Money",
  Default = false,
  Callback = function(a)
    _gv.PAFGEM = a
  end
})
T6:AddButton({"Click to get Gem/Exp/Money", function()
TP(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.HumanoidRootPart.CFrame,false)
if _gv.countgem == nil then
for i = 1,1 do
fireproximityprompt(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.ProximityPrompt)
end
else
for i = 1,_gv.countgem do
fireproximityprompt(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.ProximityPrompt)
end
end
end})
T6:AddToggle({
  Name = "Farm Bounty",
  Default = false,
  Callback = function(FBOUTI)
    _gv.BPK = FBOUTI
  end
})

--------------------------------------------------------

spawn(function()
    while task.wait(0) do
        pcall(function()
            if _gv.PAFGEM then
                TP(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.HumanoidRootPart.CFrame,false)
                fireproximityprompt(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.ProximityPrompt)
            end
        end)
    end
end)
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _gv.BPK then
                for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v and v.Character and v ~= game:GetService("Players").LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character:FindFirstChild("HumanoidRootPart").Anchored = true
                        v.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
                        v.Character:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3.5)
                        if sethiddenproperty then
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                          game:GetService('VirtualUser'):CaptureController()
                          game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                    end
                end
            end
        end)
    end
end)

--------------------------------------------------------
T6:AddButton({"Stats Bounty", function()
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Bounty ui") then
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Bounty ui"):Destroy()
end
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local bounty = leaderstats:WaitForChild("Bounty")
local screenGui = Instance.new("ScreenGui")
local textLabel1 = Instance.new("TextLabel")
local textLabel2 = Instance.new("TextLabel")
local textLabel3 = Instance.new("TextLabel")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "Bounty ui"
screenGui.Enabled = true
screenGui.ResetOnSpawn = false
textLabel1.Parent = screenGui
textLabel1.Name = "previousValue"
textLabel1.Size = UDim2.new(0, 200, 0, 50)
textLabel1.Position = UDim2.new(0.1, 0, 0.1, 0)
textLabel1.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
textLabel1.TextColor3 = Color3.new(1, 1, 1)
textLabel1.TextScaled = true
textLabel2.Parent = screenGui
textLabel2.Name = "addedValue"
textLabel2.Size = UDim2.new(0, 200, 0, 50)
textLabel2.Position = UDim2.new(0.1, 0, 0.2, 0)
textLabel2.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
textLabel2.TextColor3 = Color3.new(1, 1, 1)
textLabel2.TextScaled = true
textLabel3.Parent = screenGui
textLabel3.Name = "BountyValue"
textLabel3.Size = UDim2.new(0, 200, 0, 50)
textLabel3.Position = UDim2.new(0.1, 0, 0.3, 0)
textLabel3.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
textLabel3.TextColor3 = Color3.new(1, 1, 1)
textLabel3.TextScaled = true
local previousValue = bounty.Value
local addedValue = 0
local function updateTextLabels()
    textLabel1.Text = "ค่าหัวเดิม:" .. tostring(previousValue)
    textLabel2.Text = "ค่าหัวที่เพื่ม:" .. tostring(addedValue)
    textLabel3.Text = "ค่าหัวทั้งหมด:" .. tostring(bounty.Value)
end
bounty:GetPropertyChangedSignal("Value"):Connect(function()
    addedValue = bounty.Value - previousValue
    updateTextLabels()
end)
updateTextLabels()
end})
T6:AddButton({"Destroy Stats Bounty", function()
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Bounty ui"):Destroy()
end})
--------------------------------------------------------

end

--------------------------------------------------------

elseif game.PlaceId == 76091669089883 then
  
--------------------------------------------------------

local _gv = getgenv()

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
T6:AddButton({"Hop Dungeon", function()
game:GetService("TeleportService"):Teleport(76091669089883)
end})
T6:AddSection({"| Auto Skill"})
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
T6:AddToggle({
  Name = "B",
  Default = false,
  Callback = function(B)
    _gv.B = B
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
                for _, v in pairs(workspace.Wave_Folders.Npcs:GetChildren()) do
                    if v.Name then
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
            if _gv.Z then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game)
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.X then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game)
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.C then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game)
            end
        end)
    end
end)

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.V then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 118, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 118, false, game)
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.B then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 98, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 98, false, game)
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


--310/980 เลขหวยถ้าเอาไปซื้อแล้วถูกแบ่งผมด้วย

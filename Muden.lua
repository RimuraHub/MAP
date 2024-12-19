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
function EquipToolSele(NameWeapon)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == NameWeapon then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end
function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
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
local function hasTool(container)
    if container:FindFirstChild("SukunaV2") then
        return true
    end
    return false
end
function Up(a,b)
game:GetService("ReplicatedStorage").RemoteEvents.UpPoint:FireServer(a,b)
end
function BringMob()
    local monsterFolder = game.workspace.Map.Mon
    if not monsterFolder then return end
    for _, v in pairs(monsterFolder:GetDescendants()) do
        if v:IsA("Model") and v.Name == _gv.SLM and v:FindFirstChild("HumanoidRootPart") then
            for _, y in pairs(monsterFolder:GetDescendants()) do
                if v:IsA("Model") and y.Name == _gv.SLM and y:FindFirstChild("HumanoidRootPart") then
                    v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                    v.HumanoidRootPart.CanCollide = false
                    if sethiddenproperty then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end
    end
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
local Bosslist = {"Ala God [Boss]","Asrof [Boss]","Asta [Boss]","Cid Kageno [Boss]","Core","Eugeo [Boss]","Gojo Ultimate [Boss]","Gojo [Boss]","Guts [Boss]","Kirito [Boss]","Mahoraga [Boss]","Mr Bai [Boss]","Okarun [Boss]","Shanks [Boss]","Yuji [Boss]","Zoro[Lv10000000]"}
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
for _, v in pairs(game.workspace.Map.Mon:GetDescendants()) do
  if v:IsA("Model") then
    table.insert(Mon, v.Name)
  end
end

------[[ Ui library ]]------

local Window = redzlib:MakeWindow({
    Title = "Rimura Hub : " .. NameMap,
    SubTitle = "",
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
    Name = "Rimura Hub | Community",
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
})
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
       TP(v.WorldPivot)
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
        TP(v.WorldPivot * CFrame.new(0,10,0))
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
        TP(v.WorldPivot * CFrame.new(0,10,0))
      end
    end
  end
})
T5:AddSection({"| Settings"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _gv.Weapon = ooooo
end)
T5:AddToggle({
    Name = "Bring Mob",
    Default = true,
    Callback = function(Nring)
      _gv.BringMon = Nring
    end
})
T5:AddSection({"| Code"})
T5:AddButton({"Redeem All Code", function()
for _, v in pairs(game.Players.LocalPlayer.Codes) do
  if v.Name and v:IsA("BoolValue") then
     game:GetService("ReplicatedStorage").RedeemCode:FireServer(v.Name)
      end
   end
end})
------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = game.workspace.Map.Mon
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
                                if _gv.BringMon == true then
                                  BringMob()
                                end
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
    while true do
        task.wait()
        pcall(function()
            if _gv.ATFB then
                for _, v in pairs(game.workspace:GetChildren()) do
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
                                   TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
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
                local Monster = game.workspace
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
                                   TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
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
                    local backpackHasTool = hasTool(game:GetService("Players").LocalPlayer.Backpack)
                    local characterHasTool = game:GetService("Players").LocalPlayer.Character and hasTool(game:GetService("Players").LocalPlayer.Character)
                      if backpackHasTool or characterHasTool then
                         if game.workspace:FindFirstChild("Asta [Boss]") then
                           EquipToolSele("SukunaV2")
                           TP(game.workspace:FindFirstChild("Asta [Boss]").WorldPivot)
                           task.wait(1)
                           game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game)
                           game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game)
                         end
                      else
                      TP(game.workspace:FindFirstChild("Asta [Boss]").WorldPivot)
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
                                        TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    end
                                until not _gv.AFemtoV2 or humanoid.Health <= 0
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
            if _gv.AFemto then 
                if workspace:FindFirstChild("Femto [Boss]") then
                    local backpackHasTool = hasTool(game:GetService("Players").LocalPlayer.Backpack) 
                    local characterHasTool = game:GetService("Players").LocalPlayer.Character and hasTool(game:GetService("Players").LocalPlayer.Character) 
                    if backpackHasTool or characterHasTool then 
                        EquipToolSele("SukunaV2") 
                        TP(workspace:FindFirstChild("Femto [Boss]").WorldPivot) 
                        task.wait(1) 
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game) 
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game) 
                    else 
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
                                            TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0)) 
                                        end 
                                    until not _gv.AFemto or humanoid.Health <= 0 
                                end 
                            end 
                        end 
                    end 
                else 
                    local backpack = game:GetService("Players").LocalPlayer.Backpack 
                    if backpack:FindFirstChild("Orb Dark") then 
                        TP(workspace.Map["Spawn Boss"].Guts.WorldPivot) 
                        fpp() 
                    else 
                        sendNotification("Rimuru Hub", "You don't have Orb Dark", 5) 
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
                if workspace:FindFirstChild("Femto [Boss]") then
                    local backpackHasTool = hasTool(game:GetService("Players").LocalPlayer.Backpack)
                    local characterHasTool = game:GetService("Players").LocalPlayer.Character and hasTool(game:GetService("Players").LocalPlayer.Character)
                    if backpackHasTool or characterHasTool then
                        EquipToolSele("SukunaV2")
                        TP(game.workspace:FindFirstChild("Femto [Boss]").WorldPivot)
                        task.wait(1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game)
                    else
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
                                            TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                        end
                                    until not _gv.AFemtoV2 or humanoid.Health <= 0
                                end
                            end
                        end
                    end
                else
                    local backpack = game:GetService("Players").LocalPlayer.Backpack
                    if backpack:FindFirstChild("Orb Dark") then
                        TP(workspace.Map["Spawn Boss"].Guts.WorldPivot)
                        fpp()
                    else
                        local backpackHasTool = hasTool(game:GetService("Players").LocalPlayer.Backpack)
                        local characterHasTool = game:GetService("Players").LocalPlayer.Character and hasTool(game:GetService("Players").LocalPlayer.Character)
                        if backpackHasTool or characterHasTool then
                            if game.workspace:FindFirstChild("Asta [Boss]") then
                                EquipToolSele("SukunaV2")
                                TP(game.workspace:FindFirstChild("Asta [Boss]").WorldPivot)
                                task.wait(1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game)
                            end
                        else
                            TP(game.workspace:FindFirstChild("Asta [Boss]").WorldPivot)
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
                                                TP(hrp.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                            end
                                        until not _gv.AFemtoV2 or humanoid.Health <= 0
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
            if _gv.RKruba then
               TP(workspace.Map.Shop["KruBa [250K Money]"].WorldPivot)
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
               TP(workspace.Map.Shop["KruBa [250K Gem]"].WorldPivot)
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
                        local part = v.Parent
                        if part.Transparency == 1 then
                            part.Transparency = 0
                        end
                        if not part.CanCollide then
                            part.CanCollide = true
                        end
                        local originalColor = part.BrickColor
                        local isHighlighted = false
                        local pointLight = Instance.new("PointLight")
                        pointLight.Parent = part
                        pointLight.Color = Color3.fromRGB(255, 255, 0)
                        pointLight.Range = 10
                        pointLight.Brightness = 2
                        for i = 1, 4 do
                            if isHighlighted then
                                part.BrickColor = originalColor
                            else
                                part.BrickColor = BrickColor.new("Bright yellow")
                            end
                            isHighlighted = not isHighlighted
                            wait(0.3)
                        end
                        part.BrickColor = originalColor
                        pointLight:Destroy()
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

--310/980 เลขหวย/ถ้าเอาไปซื้อแล้วถูกแบ่งผมด้วย

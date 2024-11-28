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
game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158),game:GetService("Workspace").Camera.CFrame)
end
function EquipTool()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") and v.Name == _G.Weapon then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
    end
  end
end
function EquipToolSele(NameWaepon)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") and v.Name == NameWaepon then
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
        Title = title;
        Text = text;
        Duration = Duration;
    })
end
function fpp()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
        end
    end
end
function BringMob()
    local monsterFolder = game:GetService("Workspace"):FindFirstChild("Monster")
    if not monsterFolder then return end
    for _, v in pairs(monsterFolder:GetChildren()) do
        if v:IsA("Model") and v.Name == _gv.SLM and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
            for _, y in pairs(monsterFolder:GetChildren()) do
                if v:IsA("Model") and y.Name == _gv.SLM and y:FindFirstChild("HumanoidRootPart") then
                    v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                    v.HumanoidRootPart.CanCollide = false
                    v.Humanoid.WalkSpeed = 0
                    v.Humanoid.JumpPower = 0
                    if sethiddenproperty then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end
    end
end


------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local island = GetN_Child(workspace["เกาะ"],"Model")
local Shop = GetN_Child(workspace.Sell,"Model")
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
for _, v in pairs(workspace.Monster:GetChildren()) do
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
T4 = Window:MakeTab({"Teleport", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})

-----------------------------------

T1:AddDiscordInvite({
    Name = "Rimura Hub | Community",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})

-----------------------------------

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

-----------------------------------

T2:AddSection({"| Chest"})
T2:AddToggle({
    Name = "Farm Cow",
    Default = false,
    Callback = function(Cow)
      _gv.Cow = Cow
end})
T2:AddToggle({
    Name = "Farm Mihawk",
    Default = false,
    Callback = function(yoru)
      _gv.yoru = yoru
end})
T2:AddToggle({
    Name = "Farm Cid",
    Default = false,
    Callback = function(Cid)
      _gv.Cid = Cid
end})
T2:AddToggle({
    Name = "Farm Shanks",
    Default = false,
    Callback = function(Shanks)
      _gv.Shanks = Shanks
end})
T2:AddToggle({
    Name = "Farm Duck",
    Default = false,
    Callback = function(Duck)
      _gv.Duck = Duck
end})
T2:AddToggle({
    Name = "Farm Demon",
    Default = false,
    Callback = function(Demon)
      _gv.Demon = Demon
end})

-----------------------------------

T2:AddSection({"| Click"})
T2:AddToggle({
    Name = "Click Rose",
    Default = false,
    Callback = function(Rose)
      _gv.Rose = Rose
    end
})
T2:AddToggle({
    Name = "Click Shusui",
    Default = false,
    Callback = function(Si)
      _gv.Si = Si
    end
})

-----------------------------------

T4:AddSection({"| Island"})
AddDropdownn(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for i, v in pairs(workspace["เกาะ"]:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLIS then
       TP(v.WorldPivot)
      end
    end
  end
})

-----------------------------------

T4:AddSection({"| Shop"})
AddDropdownn(T4, "Select Shop", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(workspace.Sell:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLS then
        TP(v.WorldPivot)
      end
    end
  end
})

-----------------------------------

T5:AddSection({"| Weapon"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _G.Weapon = ooooo
end)

-----------------------------------

T5:AddToggle({
    Name = "Bring Mob",
    Default = true,
    Callback = function(Nring)
      _gv.BringMon = Nring
    end
})

-----------------------------------

T5:AddToggle({
    Name = "grabtool",
    Default = false,
    Callback = function(gra)
      _gv.gra = gra
    end
})

------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = workspace.Monster
                for _, v in pairs(Monster:GetChildren()) do
                    if v.Name == _gv.SLM then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
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

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.Cid then
                if workspace:FindFirstChild("Cidv1Chest") then
                    TP(workspace.Cidv1Chest.WorldPivot)
                    fpp()
                else
                    if workspace.Monster:FindFirstChild("CidV.1 Lv 5500") then
                        local Monster = workspace.Monster
                        for _, v in pairs(Monster:GetChildren()) do
                            if v.Name == "CidV.1 Lv 5500" then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    humanoid.WalkSpeed = 0
                                    humanoid.JumpPower = 0
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        if _gv.Cid and humanoid.Health > 1 then
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                        end
                                    until not _gv.Cid or humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        TP(workspace.Boss["Cid Lv 5500 Spwon"].CFrame)
                        EquipToolSele("Key")
                        fpp()
                    end
                end
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.Shanks then
                if workspace:FindFirstChild("ShanksChest") then
                    TP(workspace.ShanksChest.WorldPivot)
                    fpp()
                else
                    if workspace.Monster:FindFirstChild("Shanks Lv 5500") then
                        local Monster = workspace.Monster
                        for _, v in pairs(Monster:GetChildren()) do
                            if v.Name == "Shanks Lv 5500" then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    humanoid.WalkSpeed = 0
                                    humanoid.JumpPower = 0
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        if _gv.Shanks and humanoid.Health > 1 then
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                        end
                                    until not _gv.Shanks or humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        TP(workspace.Boss["Shanks Lv 5500 Spwon"].CFrame)
                        EquipToolSele("Beard")
                        fpp()
                    end
                end
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.yoru then
                if workspace:FindFirstChild("MeehawkChest") then
                    TP(workspace.MeehawkChest.WorldPivot)
                    fpp()
                else
                    if workspace.Monster:FindFirstChild("Meehawk LV2000") then
                        local Monster = workspace.Monster
                        for _, v in pairs(Monster:GetChildren()) do
                            if v.Name == "Meehawk LV2000" then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    humanoid.WalkSpeed = 0
                                    humanoid.JumpPower = 0
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        if _gv.yoru and humanoid.Health > 1 then
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                        end
                                    until not _gv.yoru or humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        TP(workspace.Boss["Yoru Spwon"].CFrame)
                        EquipToolSele("Angel wing")
                        fpp()
                    end
                end
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.Cow then
                if workspace:FindFirstChild("CowChest") then
                    TP(workspace.CowChest.WorldPivot)
                    fpp()
                else
                    if workspace:FindFirstChild("Cow") then
                        for _, v in pairs(workspace:GetChildren()) do
                            if v.Name == "Cow" then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    humanoid.WalkSpeed = 0
                                    humanoid.JumpPower = 0
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        if _gv.Cow and humanoid.Health > 1 then
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                        end
                                    until not _gv.Cow or humanoid.Health <= 0
                                end
                            end
                        end
                        else
                        sendNotification("Boss","Not Spawn", 5)
                    end
                end
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.Duck then
                if workspace:FindFirstChild("DuckChest") then
                    TP(workspace.DuckChest.WorldPivot)
                    fpp()
                else
                    if workspace:FindFirstChild("Duck") then
                        _Attack()
                        EquipTool()
                        TP(CFrame.new(-888.989685, 21.8115463, 1552.73657, 0.999981642, -5.4384774e-08, 0.00605888758, 5.46288774e-08, 1, -4.01232647e-08, -0.00605888758, 4.04535179e-08, 0.999981642))
                        else
                        sendNotification("Boss","Not Spawn", 5)
                    end
                end
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.Demon then
                if workspace:FindFirstChild("DemonChest") then
                    TP(workspace.DemonChest.WorldPivot)
                    fpp()
                else
                    if workspace.Monster:FindFirstChild("Demon LV7000") then
                        local Monster = workspace.Monster
                        for _, v in pairs(Monster:GetChildren()) do
                            if v.Name == "Demon LV7000" then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    humanoid.WalkSpeed = 0
                                    humanoid.JumpPower = 0
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        if _gv.Demon and humanoid.Health > 1 then
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                        end
                                    until not _gv.Demon or humanoid.Health <= 0
                                end
                            end
                        end
                        else
                        sendNotification("Boss","Not Spawn", 5)
                    end
                end
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.Rose then
              TP(workspace.Sell.Rose.CFrame)
              fireclickdetector(workspace.Sell.Rose.ClickDetector)
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.Si then
              TP(workspace.Sell.Shusui.Part.CFrame)
              fireclickdetector(workspace.Sell.Shusui.Part.ClickDetector)
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.gra then
              for _, v in pairs(workspace:GetChildren()) do
                if v:IsA("Tool") and v.Handle:FindFirstChild("TouchInterest") then
                      v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
                   end
                end
            end
        end)
    end
end)

-----------------------------------

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _gv.ATF or _gv.yoru and _gv.Shanks and _gv.Cid and _gv.Cid and _gv.Si and _gv.Rose and _gv.Duck and _gv.Demon then
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

------[[ End ]]------

--[[
-----------------------------------

sendNotification("title","text", Time)

-----------------------------------
]]


------[[ getgenv() ]]------

local _gv = getgenv()
_gv.DistanceMob = 7

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
function Up(a)
game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(a)
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
function CheckLevel()
    local LV = game.Players.LocalPlayer.Data.Levels.Value
    local NameQuest = nil
    local CLVDIFF = math.huge
    for _, v in pairs(game:GetService("Workspace").NPCS.Quest:GetChildren()) do
        local NPCLV = tonumber(string.match(v.Name, "%d+"))
        if NPCLV and NPCLV <= LV then
            local LVQuest = LV - NPCLV
            if LVQuest < CLVDIFF then
                CLVDIFF = LVQuest
                NameQuest = v
            end
        end
    end
    local UIQuest = game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestBar")
    local NameMon = UIQuest and UIQuest:FindFirstChild("NameMon") and UIQuest.NameMon.Value or nil
    return NameQuest, NameMon
end

------[[ Local Global ]]------

local Wsp = game.workspace
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local Playerall = {}
local DataAll = {}
local itemAll = {}
local Awaken = {}
local SummonBoss = GetN_Child(game:GetService("ReplicatedStorage").Mon_Storage.BossSummon,"Model")
local Method = {"Upper","Behind","Below"}
local island = GetN_Child(game.workspace.GPS,"Part")
local Shop = GetN_Child(game.workspace.NPCS,"Model")
local Mon = GetN_Des(game.workspace.Mon_Folder.Mon,"Model")
local Boss = GetN_Child(game.workspace.Mon_Folder.Boss,"Model")
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
for _, v in pairs(workspace.NPCS:GetChildren()) do
    if string.find(v.Name, "Awakening") then
        table.insert(Awaken, v.Name)
    end
end
for _, v in pairs(game:GetService("Players").LocalPlayer.Data:GetChildren()) do
    if v.Name then
        table.insert(DataAll, v.Name)
    end
end
for _, v in pairs(game:GetService("Players").LocalPlayer.ItemList:GetChildren()) do
    if v.Name then
        table.insert(itemAll, v.Name)
    end
end
for _, v in pairs(game:GetService("Players"):GetChildren()) do
    if v.Name then
        table.insert(Playerall, v.Name)
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
T6 = Window:MakeTab({"Raid", "Gamepad"})
T3 = Window:MakeTab({"Stats", "Signal"})
T4 = Window:MakeTab({"Teleport", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
T2:AddSection({"| Auto Farm"})
T2:AddToggle({
    Name = "Farm Level",
    Default = false,
    Callback = function(Level)
      _gv.AUTOFARMLEVE = Level
    end
})
AddDropdownn(T2, "Select Monster", Mon, "nil", "Mon", function(q)
_gv.SLM = q
end)
AddDropdownn(T2, "Select Boss", Boss, "nil", "Boss", function(qwm)
_gv.SLB = qwm
end)
T2:AddToggle({
    Name = "Farm Mon Select",
    Default = false,
    Callback = function(w)
      _gv.AUTOFARMMON = w
    end
})
T2:AddToggle({
    Name = "Farm Boss Select",
    Default = false,
    Callback = function(wn)
      _gv.AUTOFARMBOSS = wn
    end
})
T2:AddToggle({
    Name = "Farm All Boss",
    Default = false,
    Callback = function(wnk)
      _gv.AUTOFARMALLBOSS = wnk
    end
})
T2:AddToggle({
    Name = "Farm All BossServer",
    Default = false,
    Callback = function(wnmlk)
      _gv.AUTOFARMALLBOSSSERVER = wnmlk
    end
})
T2:AddToggle({
    Name = "Auto Rengoku",
    Default = false,
    Callback = function(kjh)
      _gv.AUTOFARMRENGOKU = kjh
    end
})
T2:AddToggle({
    Name = "Auto Quest BountyMan",
    Default = false,
    Callback = function(kuynakubna)
      _gv.AUTOFARMSUMMONORB = kuynakubna
    end
})
AddDropdownn(T2, "Select BossSummon", SummonBoss, "nil", "SummonBoss", function(kuyna)
_gv.SLBSM = kuyna
end)
T2:AddToggle({
    Name = "Auto Summon Boss",
    Default = false,
    Callback = function(bsms)
      _gv.AUTOFARMSELECTBOSSSUMMON = bsms
    end
})
T2:AddToggle({
    Name = "Farm BossSummon",
    Default = false,
    Callback = function(bsms)
      _gv.AUTOFARMALLBOSSSUMMON = bsms
    end
})
--[[T2:AddSection({"| Event"})
T2:AddToggle({
    Name = "Auto Claim GiftBox",
    Default = false,
    Callback = function(mlhgdd)
      _gv.cgifbox = mlhgdd
    end
})
T2:AddToggle({
    Name = "Auto WinterStalker",
    Default = false,
    Callback = function(klafws)
      _gv.AFWS = klafws
    end
})]]
--[[
T2:AddSection({"| Fishing"})
T2:AddTextBox({
  Name = "Dupe Count",
  Description = "", 
  PlaceholderText = "",
  Callback = function(Value)
    _gv.Count = Value
  end})
T2:AddButton({"DUPE", function()
for i = 1, _gv.Count do
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Fishing Rod") then
        game:GetService("ReplicatedStorage").RemoteEvents.FishingEvent:FireServer("Equip", "Fishing Rod")
    elseif game.Players.LocalPlayer.Backpack and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishing Rod") then
        EquipToolSele("Fishing Rod")
    elseif game.Players.LocalPlayer:FindFirstChild("SwordList") and game.Players.LocalPlayer.SwordList:FindFirstChild("Fishing Rod") and game.Players.LocalPlayer.SwordList["Fishing Rod"].Value then
        game:GetService("ReplicatedStorage").InventoryEvent.Inventorysword:FireServer("Fishing Rod")
    else
        if workspace:FindFirstChild("NPCS") and workspace.NPCS:FindFirstChild("Fisherman") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCS.Fisherman.WorldPivot
            for _, v in pairs(game.Workspace:GetDescendants()) do
              if v:IsA("ProximityPrompt") then
                 fireproximityprompt(v)
              end
           end
        end
    end
end
end})
T2:AddToggle({
    Name = "Auto Dupe",
    Default = false,
    Callback = function(ADF)
      _gv.ADF = ADF
    end
})
T2:AddButton({"Check DUPE COUNT", function()
local fishingGUICount = 0
for _, gui in ipairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
    if string.find(gui.Name, "FishingGUI") then
        fishingGUICount = fishingGUICount + 1
    end
end
if fishingGUICount == 0 then
sendNotification("RimuriHub","0",3)
else
sendNotification("RimuruHub",fishingGUICount,3)
end
end})

T2:AddButton({"Destroy Ui Pond", function()
for _, g in ipairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
    if string.find(g.Name, "Pond") then
        g:Destroy()
    end
end
end})
T2:AddButton({"Destroy Ui Fishing", function()
for _, g in ipairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
    if string.find(g.Name, "FishingGUI") then
        g:Destroy()
    end
end
end})
]]
T2:AddSection({"| Auto Skill"})
AddDropdownn(T2, "Select Mod", {"Farm","skill"}, "Farm", "Modskill", function(selekey)
_gv.keysele = selekey
end)
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
AddDropdownn(T6, "Select Royal", Awaken, "nil", "Awaken", function(Fruit)
_gv.Awelensele = Fruit
end)
T6:AddToggle({
  Name = "Auto Raid",
  Default = false,
  Callback = function(mlle)
    _gv.Awelen = mlle
  end
})
T6:AddToggle({
  Name = "Farm Raid Mon ",
  Default = false,
  Callback = function(mlsj)
    _gv.fmraid = mlsj
  end
})
T3:AddSection({"| Up Stats"})
T3:AddToggle({
  Name = "Up Strength",
  Default = false,
  Callback = function(Strength)
    _gv.Strength = Strength
      while _gv.Strength do task.wait()
        Up("Strength")
      end
  end
})
T3:AddToggle({
  Name = "Up Defense",
  Default = false,
  Callback = function(Defense)
    _gv.Defense = Defense
      while _gv.Defense do task.wait()
        Up("Defense")
      end
  end
})
T3:AddToggle({
  Name = "Up Weapon",
  Default = false,
  Callback = function(Weapon)
    _gv.Weapon = Weapon
      while _gv.Weapon do task.wait()
        Up("Weapon")
      end
  end
})
T3:AddToggle({
  Name = "Up Royal",
  Default = false,
  Callback = function(Royal)
    _gv.Royal = Royal
      while _gv.Royal do task.wait()
        Up("Royal")
      end
  end
})
T4:AddSection({"| Island"})
AddDropdownn(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for _, v in pairs(workspace.GPS:GetChildren()) do
      if v:IsA("Part") and v.Name == _gv.SLIS then
       TP(v.CFrame,false)
      end
    end
  end
})
T4:AddSection({"| Shop"})
AddDropdownn(T4, "Select Shop", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(workspace.NPCS:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLS then
        TP(v.WorldPivot * CFrame.new(0,10,0),false)
      end
    end
  end
})
T5:AddSection({"| Settings"})
AddDropdownn(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _gv.Weapon = ooooo
end)
AddDropdownn(T5, "Select Method", Method,"Upper", "Method", function(kkllpo)
    _gv.Method = kkllpo
end)
pcall(function()
T5:AddSlider({"Farm Distance", 1, 30, 1, 7, function(VALUE)
_gv.DistanceMob = VALUE
end})
end)
T5:AddToggle({
  Name = "White_Screen",
  Default = false,
  Callback = function(White_Screen)
    _gv.White_Screen = White_Screen
  end
})
T5:AddButton({"Redeem All Code", function()
for _, v in pairs(game:GetService("Players").LocalPlayer.CodesFolder:GetChildren()) do
   if v.Name then
      game:GetService("ReplicatedStorage").RemoteEvents.CodeRedeemed:FireServer(v.Name)
   end
end
end})
T5:AddSection({"| Visual"})
T5:AddButton({"Fake Unlock All Sword", function()
for _,v in pairs(game:GetService("Players").LocalPlayer.SwordList:GetChildren()) do
  if v.Name then
    v.Value = true
  end
end
end})
T5:AddButton({"Fake Unlock All Style", function()
for _,v in pairs(game:GetService("Players").LocalPlayer.MeleeList:GetChildren()) do
  if v.Name then
    v.Value = true
  end
end
end})
T5:AddButton({"Fake Unlock All Title", function()
for _,v in pairs(game:GetService("Players").LocalPlayer.Ranks:GetChildren()) do
  if v.Name then
    v.Value = true
  end
end
end})
AddDropdownn(T5, "Select Item", itemAll,"nil", "Weapon", function(mklme)
    _gv.fakeitem = mklme
end)
T5:AddTextBox({
  Name = "Item Count",
  Description = "", 
  PlaceholderText = "",
  Callback = function(itc)
    _gv.Countitem = itc
end})
T5:AddButton({"Fake item", function()
game:GetService("Players").LocalPlayer.ItemList[_gv.fakeitem].Value = _gv.Countitem
end})
AddDropdownn(T5, "Select Data", DataAll,"nil", "Weapon", function(mklmekuy)
    _gv.fakedata = mklmekuy
end)
T5:AddTextBox({
  Name = "Data Count",
  Description = "", 
  PlaceholderText = "",
  Callback = function(itc)
    _gv.Countdata = itc
end})
T5:AddButton({"Fake Data", function()
pcall(function()
game:GetService("Players").LocalPlayer.Data[_gv.fakedata].Value = true
game:GetService("Players").LocalPlayer.Data[_gv.fakedata].Value = _gv.Countdata
end)
end})

------[[ Spawn function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.AUTOFARMMON then
                local Monster = workspace.Mon_Folder.Mon
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMMON and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AUTOFARMMON or humanoid.Health <= 0
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
            if _gv.AUTOFARMLEVE then
                local Quest, Mon = CheckLevel()
                local QuestName = Quest
                local MonName = Mon
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestBar") then
                  if game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestBar").NameMon.Value == MonName then
                local Monster = workspace.Mon_Folder
                for _, v in pairs(Monster:GetDescendants()) do
                    if v:IsA("Model") and v.Name == Mon then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMLEVE and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AUTOFARMLEVE or humanoid.Health <= 0
                        end
                    end
                end
                else
                local args = {
                    [1] = game:GetService("Players").LocalPlayer
                }
                game:GetService("Players").LocalPlayer.PlayerGui.QuestBar.Frame.Close.LocalScript.RemoteEvent:FireServer(unpack(args))
                end
                else
                  for _,v in pairs(game.workspace.NPCS.Quest:GetChildren()) do
                    if v.Name == tostring(QuestName) then
                       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    end
                  end
                  fpp()
               end
            end
        end)
    end
end)
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.AUTOFARMBOSS then
                local Monster = workspace.Mon_Folder.Boss
                for _, v in pairs(Monster:GetChildren()) do
                    if v:IsA("Model") and v.Name == _gv.SLB then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMBOSS and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AUTOFARMBOSS or humanoid.Health <= 0
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
           if _gv.Awelen then
               if workspace.Raid.PLAY.Value == true then
               local Monster = workspace.Mon_Folder.Raid
                for _, v in pairs(Monster:GetChildren()) do
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.Awaken and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.Awelen or humanoid.Health <= 0
                        end
                    end
                 end
               else
                 game:GetService("ReplicatedStorage").RaidRemotes.SelectEvent:FireServer(_gv.Awelensele)
                 wait(1)
                 game:GetService("ReplicatedStorage").RaidRemotes.StartEvent:FireServer()
               end
            end
        end)
    end
end)
spawn(function()
    while true do
      task.wait()
        pcall(function()
           if _gv.fmraid then
               local Monster = workspace.Mon_Folder.Raid
                for _, v in pairs(Monster:GetChildren()) do
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMMON and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AUTOFARMMON or humanoid.Health <= 0
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
           if _gv.AUTOFARMALLBOSSSERVER then
               local Monster = workspace.Mon_Folder.BossServer
                for _, v in pairs(Monster:GetChildren()) do
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMALLBOSSSERVER and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AUTOFARMALLBOSSSERVER or humanoid.Health <= 0
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
           if _gv.AUTOFARMALLBOSS then
               local Monster = workspace.Mon_Folder.Boss
                for _, v in pairs(Monster:GetChildren()) do
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMALLBOSS and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AUTOFARMALLBOSS or humanoid.Health <= 0
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
            if _gv.AUTOFARMBOSS then
                local Monster = workspace.Mon_Folder.Boss
                for _, v in pairs(Monster:GetDescendants()) do
                    if v:IsA("Model") and v.Name == _gv.SLB then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMBOSS and humanoid.Health > 1 then
                                  if v:FindFirstChild("HumanoidRootPart") then
                                     TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                   end
                                end
                            until not _gv.AUTOFARMBOSS or humanoid.Health <= 0
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
            if _gv.AUTOFARMSELECTBOSSSUMMON then
                local Monster = workspace.Mon_Folder:FindFirstChild("BossSummon")
                
                if Monster and _gv.SELECTBOSSSUMMON then
                    local targetBoss = Monster:FindFirstChild(_gv.SLBSM)

                    if targetBoss then
                        local humanoid = targetBoss:FindFirstChild("Humanoid")
                        local hrp = targetBoss:FindFirstChild("HumanoidRootPart")

                        if humanoid and hrp and humanoid.Health > 0 then
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                            
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()

                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end

                                if _gv.AUTOFARMSELECTBOSSSUMMON and humanoid.Health > 1 then
                                    TP(hrp.CFrame * MethodFarm, true)
                                end
                            until not _gv.AUTOFARMSELECTBOSSSUMMON or humanoid.Health <= 0
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").RemoteEvents.SummonEvent:FireServer(_gv.SLBSM)
                end
            end
        end)
    end
end)
--[[spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.AUTOFARMSUMMONORB then
                local Monster = workspace.Mon_Folder
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("QuestBar") then
                for _, v in pairs(Monster:GetDescendants()) do
                    if v:IsA("Model") and v.Name == game:GetService("Players").LocalPlayer.PlayerGui.QuestBar.NameMon.Value then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humnoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMSUMMONORB and humanoid.Health > 1 then
                                  if v:FindFirstChild("HumanoidRootPart") then
                                     TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                   end
                                end
                            until not _gv.AUTOFARMSUMMONORB or humanoid.Health <= 0
                        end
                    end
                end
             else
               TP(workspace.NPCS.BountyMan.HumanoidRootPart.CFrame,true)
               fpp()
               end
            end
        end)
    end
end)]]
spawn(function()
    while true do
      task.wait()
        pcall(function()
           if _gv.AUTOFARMALLBOSSSUMMON then
               local Monster = workspace.Mon_Folder.BossSummon
                for _, v in pairs(Monster:GetChildren()) do
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMALLBOSSSUMMON and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AUTOFARMALLBOSSSUMMON or humanoid.Health <= 0
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
            if _gv.AUTOFARMSUMMONORB then
                local Monster = workspace.Mon_Folder
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                
                if playerGui:FindFirstChild("QuestBar") then
                    local questBar = playerGui.QuestBar
                    local targetName = questBar:FindFirstChild("NameMon") and questBar.NameMon.Value
                    
                    if targetName then
                        for _, v in pairs(Monster:GetDescendants()) do
                            if v:IsA("Model") and v.Name == targetName then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                
                                if hrp and humanoid and humanoid.Health > 0 then
                                    local foundHumanoid = v:FindFirstChildOfClass("Humanoid")
                                    if foundHumanoid then
                                        foundHumanoid.WalkSpeed = 0
                                        foundHumanoid.JumpPower = 0
                                    end
                                    
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        
                                        if _gv.keysele == "Farm" then
                                            HandleKeyPress()
                                        end
                                        
                                        if _gv.AUTOFARMSUMMONORB and humanoid.Health > 1 then
                                            if hrp then
                                                TP(hrp.CFrame * MethodFarm, true)
                                            end
                                        end
                                    until not _gv.AUTOFARMSUMMONORB or humanoid.Health <= 0
                                end
                            end
                        end
                    end
                else
                    local bountyMan = workspace.NPCS:FindFirstChild("BountyMan")
                    if bountyMan and bountyMan:FindFirstChild("HumanoidRootPart") then
                        TP(bountyMan.HumanoidRootPart.CFrame, true)
                        fpp()
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
           if _gv.Awelen then
               if workspace.Raid.PLAY.Value == true then
               local Monster = workspace.Mon_Folder.Raid
                for _, v in pairs(Monster:GetChildren()) do
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.Awaken and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.Awelen or humanoid.Health <= 0
                        end
                    end
                 end
               else
                 game:GetService("ReplicatedStorage").RaidRemotes.SelectEvent:FireServer(_gv.Awelensele)
                 wait(1)
                 game:GetService("ReplicatedStorage").RaidRemotes.StartEvent:FireServer()
               end
            end
        end)
    end
end)
spawn(function()
    while true do
      task.wait()
        pcall(function()
           if _gv.fmraid then
               local Monster = workspace.Mon_Folder.Raid
                for _, v in pairs(Monster:GetChildren()) do
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
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.fmraid and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.fmraid or humanoid.Health <= 0
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
--[[
spawn(function()
    while true do
      task.wait(1)
         pcall(function()
            if _gv.cgifbox then
               for _,v in pairs(workspace.GiftBox:GetChildren()) do
                  if v:IsA("Model") and v.Name then
                     TP(v.WorldPivot,false)
                     for _, y in pairs(workspace.GiftBox :GetDescendants()) do
                        if y:IsA("ProximityPrompt") then
                           fireproximityprompt(y)
                        end
                     end
                  end
               end
            end
        end)
    end
end)
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _gv and _gv.ADF and game.Players.LocalPlayer then
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Fishing Rod") then
                    game:GetService("ReplicatedStorage").RemoteEvents.FishingEvent:FireServer("Equip", "Fishing Rod")
                elseif game.Players.LocalPlayer.Backpack and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishing Rod") then
                    EquipToolSele("Fishing Rod")
                elseif game.Players.LocalPlayer:FindFirstChild("SwordList") and game.Players.LocalPlayer.SwordList:FindFirstChild("Fishing Rod") and game.Players.LocalPlayer.SwordList["Fishing Rod"].Value then
                    game:GetService("ReplicatedStorage").InventoryEvent.Inventorysword:FireServer("Fishing Rod")
                else
                    if workspace:FindFirstChild("NPCS") and workspace.NPCS:FindFirstChild("Fisherman") then
                        TP(workspace.NPCS.Fisherman.WorldPivot, false)
                        fpp()
                    end
                end
            end
        end)
    end
end)]]
spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.AUTOFARMRENGOKU then
              if workspace.Mon_Folder.BossServer:FindFirstChild("Rengoku") then
               local Monster = workspace.Mon_Folder.BossServer
                for _, v in pairs(Monster:GetChildren()) do
                    if v:IsA("Model") and v.Name == "Rengoku" then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMRENGOKU and humanoid.Health > 1 then
                                  if v:FindFirstChild("HumanoidRootPart") then
                                     TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),true)
                                  else
                                     TP(v.WorldPivot * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0),false)
                                   end
                                end
                            until not _gv.AUTOFARMRENGOKU or humanoid.Health <= 0
                        end
                    end
                end
                else
                  local text = workspace.NPCS.RengokuBossQuest.Quest.DonutMan.Text
                  local current, total = text:match("DonutMan (%d+)/(%d+)")
                  if text == "DonutMan 50/50" or (current and total and tonumber(current) >= tonumber(total)) then
                    TP(workspace.NPCS.RengokuBossQuest.CFrame,false)
                    fpp()
                    else
                local Monster = workspace.Mon_Folder.Mon
                for _, v in pairs(Monster:GetDescendants()) do
                    if v:IsA("Model") and v.Name == "DonutMan" then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AUTOFARMRENGOKU and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                 end
                            until not _gv.AUTOFARMRENGOKU or humanoid.Health <= 0
                        end
                    end
                end
                  end
              end
            end
        end)
    end
end) 
--[[
spawn(function()
    while true do
      task.wait()
        pcall(function()
           if _gv.AFWS then
               local Monster = workspace.Mon_Folder.BossServer
               if Monster:FindFirstChild("WinterStalker") then
                for _, v in pairs(Monster:GetChildren()) do
                    if v:IsA("Model") and v.Name == "WinterStalker" then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _gv.keysele == "Farm" then
                                    HandleKeyPress()
                                end
                                if _gv.AFWS and humanoid.Health > 1 then
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,true)
                                end
                            until not _gv.AFWS or humanoid.Health <= 0
                        end
                    end
                end
                  else
                    TP(game:GetService("Workspace").NPCS["Summon WinterStalker"].HumanoidRootPart.CFrame,true)
                    fpp()
                end
            end
        end)
    end
end)]]
spawn(function()
        while wait() do 
            pcall(function()
                if _gv.Method == "Behind" then
                    MethodFarm = CFrame.new(0,0,_gv.DistanceMob)
                elseif _gv.Method == "Below" then
                    MethodFarm = CFrame.new(0,-_gv.DistanceMob,0) * CFrame.Angles(math.rad(90),0,0)
                elseif _gv.Method == "Upper" then
                    MethodFarm = CFrame.new(0,_gv.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
                else
                    MethodFarm = CFrame.new(0,_gv.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
                end
            end)
        end
    end)
spawn(function()
    while true do
        task.wait()
        if _gv.White_Screen then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _gv.AUTOFARMLEVE or _gv.AUTOFARMBOSS or _gv.AUTOFARMALLBOSS or _gv.AUTOFARMALLBOSSSERVER or _gv.AUTOFARMRENGOKU or _gv.Awelen or _gv.fmraid then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
            else    
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end)
end)

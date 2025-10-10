


------[[ Config ]]------

if not getgenv().Config then
    getgenv().Config = {
        ["Auto Farm"] = {
            ["Select Monster"] = "nil",
            ["Select Boss"] = "nil",
            ["Farm Mon Select"] = false,
            ["Farm Boss Select"] = false,
            ["Farm All Boss"] = false,
        },
        ["Stat"] = {
            ["Up Defense"] = false,
            ["Up Power"] = false,
        },
        ["Settings"] = {
            ["Select Weapon"] = "nil",
            ["Select Method"] = "Upper",
            ["Farm Distance"] = 7,
            ["White_Screen"] = false,
        },
        ["Skill"] = {
            ["Select Mod"] = "Farm",
            ["Z"] = true,
            ["X"] = true,
            ["C"] = true,
            ["V"] = true,
        },
    }
end

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
local function SetUP(a, b)
    return getgenv().Config[a][b]
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
game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("PointsEvent"):FireServer(a)
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
local Method = {"Upper","Behind","Below"}
local island = GetN_Child(game.workspace["Teleport to Islands"],"Model")
local Shop = GetN_Child(game.workspace.NPCS,"Model")
local Mon = GetN_Des(game.workspace.Mon_Folder.Mon,"Model")
local Boss = GetN_Child(game:GetService("ReplicatedStorage").Mon_Storage.Boss,"Model")
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
T2 = Window:MakeTab({"Auto Farm", "Home"})
T3 = Window:MakeTab({"Stats", "Signal"})
T4 = Window:MakeTab({"Teleport", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
AddDropdownn(T2, "Select Monster", Mon, SetUP("Auto Farm","Select Monster") or nil, "Mon", function(q)
_gv.SLM = q
end)
AddDropdownn(T2, "Select Boss", Boss, SetUP("Auto Farm","Select Boss") or nil, "Boss", function(qwm)
_gv.SLB = qwm
end)
T2:AddToggle({
    Name = "Farm Mon Select",
    Default = SetUP("Auto Farm","Farm Mon Select") or false,
    Callback = function(w)
      _gv.AUTOFARMMON = w
    end
})
T2:AddToggle({
    Name = "Farm Boss Select",
    Default = SetUP("Auto Farm","Farm Boss Select") or false,
    Callback = function(wn)
      _gv.AUTOFARMBOSS = wn
    end
})
T2:AddToggle({
    Name = "Farm All Boss",
    Default = SetUP("Auto Farm","Farm All Boss") or false,
    Callback = function(wnk)
      _gv.AUTOFARMALLBOSS = wnk
    end
})
T2:AddSection({"| Auto Skill"})
AddDropdownn(T2, "Select Mod", {"Farm","skill"}, SetUP("Skill","Select Mod") or "Farm", "Modskill", function(selekey)
_gv.keysele = selekey
end)
T2:AddToggle({
  Name = "Z",
  Default = SetUP("Skill","Z") or true,
  Callback = function(Z)
    _gv.Z = Z
  end
})
T2:AddToggle({
  Name = "X",
  Default = SetUP("Skill","X") or true,
  Callback = function(X)
    _gv.X = X
  end
})
T2:AddToggle({
  Name = "C",
  Default = SetUP("Skill","C") or true,
  Callback = function(C)
    _gv.C = C
  end
})
T2:AddToggle({
  Name = "V",
  Default = SetUP("Skill","V") or true,
  Callback = function(V)
    _gv.V = V
  end
})
T3:AddSection({"| Up Stats"})

T3:AddToggle({
  Name = "Up Defense",
  Default = SetUP("Stat","Up Defense") or false,
  Callback = function(Defense)
    _gv.Defense = Defense
      while _gv.Defense do task.wait()
        Up("Defense")
      end
  end
})
T3:AddToggle({
  Name = "Up Power",
  Default = SetUP("Stat","Up Royal") or false,
  Callback = function(Royal)
    _gv.Royal = Royal
      while _gv.Royal do task.wait()
        Up("Power")
      end
  end
})
T4:AddSection({"| Island"})
AddDropdownn(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for _, v in pairs(workspace["Teleport to Islands"]:GetChildren()) do
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
   for _, v in pairs(workspace.NPCS:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLS then
        TP(v.WorldPivot * CFrame.new(0,10,0),false)
      end
    end
  end
})
T5:AddSection({"| Settings"})
AddDropdownn(T5, "Select Weapon", Wea,SetUP("Settings","Select Weapon") or nil, "Weapon", function(ooooo)
    _gv.Weapon = ooooo
end)
AddDropdownn(T5, "Select Method", Method,SetUP("Settings","Select Method") or "Upper", "Method", function(kkllpo)
    _gv.Method = kkllpo
end)
pcall(function()
T5:AddSlider({"Farm Distance", 1, 30, 1, SetUP("Settings","Farm Distance") or 7, function(VALUE)
_gv.DistanceMob = VALUE
end})
end)
T5:AddToggle({
  Name = "White_Screen",
  Default = SetUP("Settings","White_Screen") or false,
  Callback = function(White_Screen)
    _gv.White_Screen = White_Screen
  end
})
T5:AddButton({"Redeem All Code", function()
for _, v in pairs(game:GetService("Players").LocalPlayer.CodesFolder:GetChildren()) do
   if v.Name then
      game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("CodeRedeemed"):FireServer(v.Name)
   end
end
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
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,false)
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
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,false)
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
                                  TP(v.HumanoidRootPart.CFrame * MethodFarm,false)
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
            if _gv.keysele == "skill" then
               HandleKeyPress()
            end
        end)
    end
end)
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
            if _gv.AUTOFARMBOSS or _gv.AUTOFARMALLBOSS then
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

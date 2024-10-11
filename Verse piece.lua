--ใครReskinขอให้ล่มจม

--[[ Farm lv ]]--


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
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Stats.Main.Setting.Event:FireServer(a, b)
end

------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.ChvaracterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local island = GetN_Child(workspace.Map,"Model")
local Chest = {"Rare Chest","Epic Chest", "Legendary Chest", "Mythical Chest"}
local Shop = GetN_Des(Wsp.Npc,"Model")
local Mon = {"Bandit [Lv.5]","Bandit Leader [Lv.50]","Monkey [Lv.100]","Monkey King [Lv.150]","Snow Bandit [Lv.300]","Snow Bandit Leader [Lv.450]","Curse Spirit [Lv.750]","Desert Thief [Lv.1000]","Desert King [Lv.1500]","Marine Soldier [Lv.2000]","Arrancar [Lv.2000]","Dark Adventure [Lv.2500]"}
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local _gv = getgenv()
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ScreenGui1 = Instance.new("ScreenGui")
ScreenGui1.Name = "ButtonGui"
ScreenGui1.Parent = CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local ImageButton1 = Instance.new("ImageButton")
ImageButton1.Parent = ScreenGui1
ImageButton1.Size = UDim2.new(0, 50, 0, 50)
ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton1.BackgroundTransparency = 0.5
ImageButton1.Image = "rbxassetid://18751483361" -- ใช้ Asset ID ของภาพที่นี่
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = ImageButton1
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = ImageButton1
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 2
local Sound1 = Instance.new("Sound")
Sound1.Parent = ImageButton1
Sound1.SoundId = "rbxassetid://12221967"
Sound1.Volume = 1
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenExpand = TweenService:Create(ImageButton1, tweenInfo, {Size = UDim2.new(0, 55, 0, 55)})
local tweenShrink = TweenService:Create(ImageButton1, tweenInfo, {Size = UDim2.new(0, 50, 0, 50)})
local isOn = false
ImageButton1.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        ImageButton1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
    Sound1:Play()
    tweenExpand:Play()
    wait(0.1)
    tweenShrink:Play()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game)
end)
local Window = Fluent:CreateWindow({
    Title = "Rimura Hub : " .. NameMap,
    SubTitle = "",
    TabWidth = 130,
    Size = UDim2.fromOffset(460, 380),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl
})



local Tab = {
    T1 = Window:AddTab({Title = "🗡️| Farm", Icon = "swordsj"}),
    T5 = Window:AddTab({Title = "⚔️| Boss", Icon = "swordsj"}),
    T2 = Window:AddTab({Title = "📊| Stats", Icon = "chart-no-axes-combined"}),
    T3 = Window:AddTab({Title = "📌| Teleport", Icon = "tree-palm"}),
    T4 = Window:AddTab({Title = "🔮| Main", Icon = "boodk"}),
}


Tab.T1:AddSection("| No Quest")
Tab.T1:AddDropdown("Dropdown", {
   Title = "Select Mon",
   Values = Mon,
   Multi = false,
   Default = nil,
   Callback = function(mikd)
   _gv.SLM = mikd
   end
})

Tab.T1:AddToggle("Toggle", {
    Title = "Farm Mon",
    Default = false,
    Callback = function(He)
        _gv.ATF = He
    end
})
Tab.T5:AddToggle("Toggle", {
    Title = "Farm AllBoss",
    Default = false,
    Callback = function(Bossna)
        _gv.ATFAll = Bossna
    end
})
Tab.T5:AddToggle("Toggle", {
    Title = "Auto Open Chest",
    Default = false,
    Callback = function(Bossnak)
        _G.AutoOpenCh = Bossnak
    end
})
Tab.T2:AddSlider("Slider", {
        Title = "Set Number",
        Description = "Number Stats",
        Default = 1,
        Min = 1,
        Max = 100,
        Rounding = 0.1,
        Callback = function(Num)
            StatsNum = Num
        end
    })
Tab.T2:AddToggle("Toggle", {
    Title = "Strength",
    Default = false,
    Callback = function(Strength)
          _G.Strength = Strength
            while _G.Strength do task.wait()
        Up("Strength", StatsNum)
        end
    end
})
Tab.T2:AddToggle("Toggle", {
    Title = "Defense",
    Default = false,
    Callback = function(Defense)
          _G.Defense = Defense
            while _G.Defense do task.wait()
        Up("Defense", StatsNum)
        end
    end
})
Tab.T2:AddToggle("Toggle", {
    Title = "Sword",
    Default = false,
    Callback = function(Sword)
    _G.Sword = Sword
      while _G.Sword do task.wait()
        Up("Sword", StatsNum)
        end
    end
})
Tab.T2:AddToggle("Toggle", {
    Title = "Special",
    Default = false,
    Callback = function(Special)
          _G.Special = Special
            while _G.Special do task.wait()
        Up("Special", StatsNum)
        end
    end
})
Tab.T3:AddSection("| Shop")
Tab.T3:AddDropdown("Dropdown", {
   Title = "Select NPC",
   Values = Shop,
   Multi = false,
   Default = nil,
   Callback = function(MKKm)
     _G.ILm = MKKm
   end
})
Tab.T3:AddButton({
    Title = "teleport NPC",
    Callback = function()
   for i, v in pairs(game:GetService("Workspace").Npc:GetDescendants()) do
          if v.Name == _G.ILm then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot * CFrame.new(0, 10, 0)
          end
        end
    end
})
Tab.T3:AddSection("| island")
Tab.T3:AddDropdown("Dropdown", {
   Title = "Select island",
   Values = island,
   Multi = false,
   Default = nil,
   Callback = function(MKK)
     _G.IL = MKK
   end
})
Tab.T3:AddButton({
    Title = "teleport island",
    Callback = function()
   for i, v in pairs(game:GetService("Workspace").Map:GetDescendants()) do
          if v.Name == _G.IL then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot * CFrame.new(0, 100, 0)
          end
        end
    end
})

Tab.T4:AddSection("| Weapon")
local Weaponlist = {}

local SelectWeapon = Tab.T4:AddDropdown("SelectWeapon", {
    Title = "Select Weapon",
    Values = Weaponlist,
    Multi = false,
    Default = false,
    Callback = function(selectedWeapon)
        _G.Weapon = selectedWeapon
        print("Selected " .. _G.Weapon)
    end
})

local function RefreshWeaponList()
    Weaponlist = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
       table.insert(Weaponlist ,v.Name)
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
    if v:IsA("Tool") then
       table.insert(Weaponlist, v.Name)
    end
end
    SelectWeapon:SetValues(Weaponlist)
end

Tab.T4:AddButton({
    Title = "Refresh Weapon",
    Description = "",
    Callback = RefreshWeaponList
})

RefreshWeaponList()

Tab.T4:AddToggle("Toggle", {
    Title = "ONE SHOT[67%]",
    Default = false,
    Callback = function(MNae)
getgenv().Config = {
    ["Folder Mon"] = "Main",
    ["Instant Kill"] = MNae,
    ["Radius"] = 15
    }
    end})
Tab.T4:AddSection("| Skill")
    Tab.T4:AddToggle("Toggle", {
    Title = "Z",
    Default = false,
    Callback = function(Z)
    _G.Z = Z
    end})
    Tab.T4:AddToggle("Toggle", {
    Title = "X",
    Default = false,
    Callback = function(X)
    _G.X = X
   end})
    Tab.T4:AddToggle("Toggle", {
    Title = "C",
    Default = false,
    Callback = function(C)
    _G.C = C
    end})
    Tab.T4:AddToggle("Toggle", {
    Title = "V",
    Default = false,
    Callback = function(V)
    _G.V = V
    end})
    Tab.T4:AddToggle("Toggle", {
    Title = "F",
    Default = false,
    Callback = function(F)
    _G.F = F
end})
Tab.T4:AddSection("| Performance")
Tab.T4:AddButton({
    Title = "FpsBoost",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/SuperFpsBoost.lua"))()
    end
})
Tab.T4:AddButton({
    Title = "Shade",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Test/main/shade.lua?token=GHSAT0AAAAAACUVPPYXF56VA3NDXQ2VL2YEZUOIQOA"))()
    end
})
Tab.T4:AddToggle("Toggle", {
    Title = "Delete Effect",
    Default = false,
    Callback = function(eleff)
     _G.Deleff = eleff
end})
Tab.T4:AddToggle("Toggle", {
    Title = "Show [Fps,Ping,Time]",
    Default = true,
    Callback = function(Statsm)
_G.ShowStats = Statsm
end})


------[[ Spawn Function ]]------

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _gv.ATF then
                local Monster = game:GetService("Workspace").Main
                for _, v in pairs(Monster:GetDescendants()) do
                    if v.Name == _gv.SLM then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                            hrp.Size = Vector3.new(20, 20, 20)
                            hrp.Transparency = 0.9
                            hrp.CanCollide = false
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                            repeat
                                task.wait(0)
                                _Attack()
                                EquipTool()
                                if _gv.ATF and humanoid.Health > 1 then
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-90), 0, 0))
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
            if _gv.ATFAll then
                local Boss = game:GetService("Workspace").Main.Boss
                for _, v in pairs(Boss:GetDescendants()) do
                    if v.Name and v:IsA("Model") then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                            hrp.Size = Vector3.new(20, 20, 20)
                            hrp.Transparency = 0.9
                            hrp.CanCollide = false
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                            repeat
                                task.wait(0)
                                _Attack()
                                EquipTool()
                                if _gv.ATFAll and humanoid.Health > 1 then
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                end
                            until not _gv.ATFAll or humanoid.Health <= 0
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
            if _G.AutoOpenCh then
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and table.find(Chest, v.Name) then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        _Attack()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Config["Instant Kill"] then
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                local Den
                if getgenv().Config["Folder Mon"] == "nil" then
                    Den = game.Workspace:GetDescendants()
                else
                    Den = game.Workspace[getgenv().Config["Folder Mon"]]:GetDescendants()
                end
                for _, v in pairs(Den) do
                    if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                        local MonPoz = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                        local PlayerPoz = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                        if not game.Players:GetPlayerFromCharacter(v.Parent) then
                            if MonPoz and PlayerPoz and (MonPoz - PlayerPoz).Magnitude <= getgenv().Config["Radius"] then
                                if v.Health <= v.MaxHealth * 0.9 then
                                    task.wait(0)
                                    v.Health = 0
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
            if _G.Z then
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
            if _G.X then
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
            if _G.C then
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
            if _G.V then
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
            if _G.F then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 102, false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 102, false, game)
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Deleff then
                for _, object in ipairs(workspace.Effects:GetChildren()) do
                    print("Destroying object:", object.Name)
                    object:Destroy()
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _gv.ATF or _gv.ATFAll then
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

--[[Show Fps]]--

local screenGui99 = Instance.new("ScreenGui")
screenGui99.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui99.Name = "RimuraHub | Show State"

local backgroundFrame99 = Instance.new("Frame")
backgroundFrame99.Size = UDim2.new(0, 305, 0, 47)
backgroundFrame99.Position = UDim2.new(1, -313, 0, 2)
backgroundFrame99.BackgroundColor3 = Color3.new(150/255, 0, 255/255)
backgroundFrame99.Parent = screenGui99
backgroundFrame99.Name = "กรอบ"

local cornerBack99 = Instance.new("UICorner")
cornerBack99.CornerRadius = UDim.new(0, 10)
cornerBack99.Parent = backgroundFrame99

local frame99 = Instance.new("Frame")
frame99.Size = UDim2.new(0, 300, 0, 40)
frame99.Position = UDim2.new(1, -302, 0, 3)
frame99.BackgroundColor3 = Color3.new(0, 0, 0)
frame99.BorderSizePixel = 0
frame99.BackgroundTransparency = 0
frame99.Parent = backgroundFrame99
frame99.Name = "State"

local corner99 = Instance.new("UICorner")
corner99.CornerRadius = UDim.new(0, 10)
corner99.Parent = frame99

local fpsLabel99 = Instance.new("TextLabel")
fpsLabel99.Size = UDim2.new(1, 0, 1, 0)
fpsLabel99.BackgroundTransparency = 1
fpsLabel99.TextColor3 = Color3.new(150/255, 0, 255/255)
fpsLabel99.Font = Enum.Font.SourceSansBold
fpsLabel99.TextSize = 20
fpsLabel99.Text = "FPS: -- | Ping: -- | Time: --:--:--"
fpsLabel99.Parent = frame99

local function updateInfo99()
    local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
    local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
    local time = os.date("%X")
    fpsLabel99.Text = "FPS: " .. fps .. " | Ping: " .. ping .. " | Time: " .. time
end

spawn(function()
    while true do
        task.wait(0.1)
        pcall(function()
            if _G.ShowStats then
                backgroundFrame99.Visible = true
                frame99.Visible = true
                updateInfo99()
            else
                backgroundFrame99.Visible = false
                frame99.Visible = false
            end
        end)
    end
end)

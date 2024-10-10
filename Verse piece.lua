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

------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.ChvaracterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack,"Tool")
local island = GetN_Child(workspace.Map,"Model")
local Shop = GetN_Des(Wsp.Npc,"Model")
local Mon = {}
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local _gv = getgenv()
for _, v in pairs(Wsp.Main:GetDescendants()) do
  if v:IsA("Model")  then
    table.insert(Mon, v.Name)
  end
end

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
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})



local Tab = {
    T1 = Window:AddTab({Title = "| Farm", Icon = "swordsj"}),
    T5 = Window:AddTab({Title = "| Boss", Icon = "swordsj"}),
    T2 = Window:AddTab({Title = "| Stats", Icon = "chart-no-axes-combined"}),
    T3 = Window:AddTab({Title = "| Teleport", Icon = "tree-palm"}),
    T4 = Window:AddTab({Title = "| Main", Icon = "boodk"}),
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

Tab.T4:AddDropdown("Dropdown", {
   Title = "Select Weapon",
   Values = Wea,
   Multi = false,
   Default = nil,
   Callback = function(ooooo)
   _G.Weapon = ooooo
   end
})

Tab.T4:AddToggle("Toggle", {
    Title = "ONE SHOT[67%]",
    Default = false,
    Callback = function(MNae)
getgenv().Config = {
    ["Folder Mon"] = "Main",
    ["Instant Kill"] = MNae,
    ["Radius"] = 15
}
    end
})

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
                                task.wait()
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
                                task.wait()
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
                                    wait(.1)
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
end)local T5 = Window:MakeTab({"Misc", "Settings"})

T1:AddDiscordInvite({
    Name = "Rimura Hub | Community",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})

T2:AddSection({"| Auto Farm"})

local Dropdown = T2:AddDropdown({
    Name = "Select Quest",
    Options = Quest,
    Default = "nil",
    Flag = "Quest",
    Callback = function(qqq)
        _G.SelectQuest = qqq
    end
})

T2:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(aaaa)
        _G.AutoFarm = aaaa
    end
})
T5:AddSection({"| Weapon"})
local Dropdown = T5:AddDropdown({
    Name = "Select Weapon",
    Options = {"Combat","Sword"},
    Default = "nil",
    Flag = "Weapon",
    Callback = function(wa)
        _G.Weapon = wa
    end
})
T5:AddToggle({
    Name = "One Hit",
    Default = false,
    Callback = function(eee)
getgenv().Config = {
    ["Folder Mon"] = "Main",
    ["Instant Kill"] = eee,
    ["Radius"] = 15
}
    end
})



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
                                    wait(.1)
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
    while wait() do
        pcall(function()
            if _G.AutoFarm then
                if Q[_G.SelectQuest] then
                    Quest1, Mob, Quest2, F1, F2 = Q[_G.SelectQuest][1], Q[_G.SelectQuest][2], Q[_G.SelectQuest][3], Q[_G.SelectQuest][4], Q[_G.SelectQuest][5]
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        xpcall(function()
            if _G.AutoFarm then
                if UiQuest:FindFirstChild("QuestData1") then
                    for _, v in pairs(workspace.Main[F1]:GetDescendants()) do
                        if v:IsA("Model") and v.Name == Mob and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                            v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                            repeat
                                task.wait()
                                _Attack()
                                EquipTool()
                                if _G.OneHit and v:FindFirstChildOfClass("Humanoid").Health < v:FindFirstChildOfClass("Humanoid").MaxHealth*0.9 and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    v:FindFirstChildOfClass("Humanoid").Health = 0
                                end
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,7,0) * CFrame.Angles(math.rad(-90), 0, 0))
                            until not _G.AutoFarm or v.Humanoid.Health <= 0
                        end
                    end
                else
                    for _, x in pairs(workspace.Npc.Quest:GetChildren()) do
                        if x:IsA("Model") and x.Name == Quest2 then
                            TP(x.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                            for _, y in pairs(x:GetDescendants()) do
                                if y:IsA("ProximityPrompt") then
                                y:InputHoldBegin(game.Players.LocalPlayer)
                                wait(1)
                                y:InputHoldEnd(game.Players.LocalPlayer)
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end, print)
    end
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if _G.AutoFarm then
            if hrp and not hrp:FindFirstChild("BodyClip") then
                local noclip = Instance.new("BodyVelocity")
                noclip.Name = "BodyClip"
                noclip.Parent = hrp
                noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                noclip.Velocity = Vector3.new(0, 0, 0)
            end
        else
            if hrp and hrp:FindFirstChild("BodyClip") then
                hrp.BodyClip:Destroy()
            end
        end
    end)
end)

--ใครReskinขอให้ล่มจม

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
function EquipTool()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") and v.ToolTip == _G.Weapon then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
    end
  end
end
local Q = {
    ["Bandit's Quest"] = {"Bandit's Quest", "Bandit [Lv.5]", "Quest 1", "Starter", "Bandits"},
    ["Bandit Leader Quest"] = {"Bandit Leader Quest", "Bandit Leader [Lv.50]", "Quest 2", "Starter", "Bandit Leader"},
    ["Monkey's Quest"] = {"Monkey's Quest", "Monkey [Lv.100]", "Quest 3", "Jungle", "Monkey"},
    ["Monkey King Quest"] = {"Monkey King Quest", "Monkey King [Lv.175]", "Quest 4", "Jungle", "Monkey King"},
    ["Snow Bandit Quest"] = {"Snow Bandit Quest", "Snow Bandit [Lv.225]", "Quest 5", "Snow", "Snow Bandit"},
    ["Snow Bandit Leader Quest"] = {"Snow Bandit Leader Quest", "Snow Bandit Leader [Lv.275]", "Quest  6", "Snow", "Snow Bandit Leader"},
    ["Desert Thief Quest"] = {"Desert Thief Quest", "Desert Thief [Lv.325]", "Quest 7", "Desert", "Desert Thief"},
    ["Desert King Quest"] = {"Desert King Quest", "Desert King [Lv.425]", "Quest 8", "Desert", "Desert King"},
}


local UiQuest = game.Players.LocalPlayer.PlayerGui.Main.Quest.Frame
local Quest = {}

for _, x in pairs(workspace.Npc.Quest:GetChildren()) do
    if x:IsA("Model") and x.Name ~= "Mission" and x.Name ~= "Gamble Spirit Quest" then
        for _, v in pairs(x:GetDescendants()) do
            if v:IsA("StringValue") and v.Name == "Quest Title" then
                table.insert(Quest, v.Value)
            end
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
function _Attack()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Godmey/Redz-Ui/refs/heads/main/Ui.lua"))()

local Window = redzlib:MakeWindow({
    Title = "Rimura Hub : " .. NameMap,
    SubTitle = "",
    SaveFolder = "",
})

Window:AddMinimizeButton({
    Button = {Image = "rbxassetid://18751483361", BackgroundTransparency = 0},
    Corner = {CornerRadius = UDim.new(0, 6)},
})

local T1 = Window:MakeTab({"Discord", "Info"})
local T2 = Window:MakeTab({"Auto Farm", "Home"})
-- local T4 = Window:MakeTab({"Teleport", "Signal"})
local T5 = Window:MakeTab({"Misc", "Settings"})

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

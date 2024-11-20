getgenv().Config1 = {
      ["Distance From Mob"] = 4
}

function UpStats(stat)
    game:GetService("ReplicatedStorage").Events.UpgradeStat:FireServer(stat)
end

local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

function GetName(Folder, Class)
    local names = {}
    for _, v in pairs(Folder:GetChildren()) do
        if v:IsA(Class) then
            table.insert(names, v.Name)
        end
    end
    return names
end

function __AttackMon()
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):ClickButton1(Vector2.new(9999999, 99999999), game:GetService("Workspace").Camera.CFrame)
end

function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end

local Map = GetName(workspace.Map.SpawnLocation, "Part")
local Wea = GetName(game.Players.LocalPlayer.Backpack, "Tool")
local NameBoss = GetName(game.ReplicatedStorage.BossCharacters, "Model")

local NPC = {}
for _, v in pairs(workspace.Map.NPC:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
        table.insert(NPC, v.Name)
    end
end

function __Equip()
    pcall(function()
      game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(getgenv().Weapon))
    end)
end

function __RedeemCode()
  for _, v in pairs(game.Players.LocalPlayer["LevelFolder"]:GetChildren()) do
        if v:IsA("BoolValue") and v.Name:find("Code") then
            local Code = v.Name:gsub("Code", "")
            game:GetService("ReplicatedStorage").Events.RedeemCodes:FireServer(Code)
            wait(0.3)
        end
    end
end

local CFSPBOSS = workspace.Map.NPC.BossSpawnerNPC.HumanoidRootPart.CFrame

local Mon = {}
local Names = {}
local NoCheckX = {
    "nil"
}

for _, v in pairs(workspace.Npcs:GetChildren()) do
    if v:IsA("Model") then
        if not Names[v.Name] and not table.find(NoCheckX, v.Name) then
            Names[v.Name] = true
            table.insert(Mon, v.Name)
        end
    end
end

local Dismee = 2

redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Ijul piece",
  SubTitle = "",
  SaveFolder = ""
})

Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

T1 = Window:MakeTab({"Discord", "Info"})
T2 = Window:MakeTab({"Boss", "Home"})
T3 = Window:MakeTab({"Mon", "Home"})
T4 = Window:MakeTab({"Stats", "Signal"})
T5 = Window:MakeTab({"Telepot", "Locate"})
T6 = Window:MakeTab({"Item", "Home"})
T7 = Window:MakeTab({"Misc", "Settings"})

T1:AddDiscordInvite({
  Name = "Rimura Hub | Community",
  Logo = "rbxassetid://18751483361",
  Invite = "https://discord.com/invite/Dmg8EJ2neK"
})

T2:AddSection({"| Select Boss"})
T2:AddDropdown({
    Name = "Select Spawn",
    Description = "",
    Options = {"Currency","Item"},
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(SW)
    getgenv().SelSpawn = SW
    end
})

T2:AddDropdown({
    Name = "Select Boss",
    Description = "",
    Options = NameBoss,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(SW2)
    getgenv().SelSpawn2 = SW2
    end
})



T2:AddSection({"| Auto Boss"})


T2:AddToggle({
  Name = "Auto Farm Boss and Spawn",
  Default = false,
  Callback = function(Fm)
    getgenv().Farm = Fm
end})

T2:AddToggle({
  Name = "Auto Farm Boss",
  Default = false,
  Callback = function(Fm2)
    getgenv().Farm2 = Fm2
end})
T3:AddSection({"| Auto Farm Monster"})
T3:AddDropdown({
    Name = "Select Monster",
    Description = "",
    Options = Mon,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(FMo)
    getgenv().Monster = FMo
end})
T3:AddToggle({
  Name = "Auto Monster",
  Default = false,
  Callback = function(MON)
    getgenv().MoS = MON
end})

T2:AddSection({"| SeaBeast"})
T2:AddToggle({
  Name = "Auto SeaBeast",
  Default = false,
  Callback = function(Se)
    getgenv().Sea = Se
end})

T4:AddSection({"| Up Stats"})
T4:AddToggle({
  Name = "Strength",
  Default = false,
  Callback = function(Strength)
    getgenv().Strength = Strength
    while getgenv().Strength do wait()
      UpStats("Strength")
    end
end})
T4:AddToggle({
  Name = "Durability",
  Default = false,
  Callback = function(Durability)
    getgenv().Durability = Durability
    while getgenv().Durability do wait()
      UpStats("Durability")
    end
end})
T4:AddToggle({
  Name = "Sword",
  Default = false,
  Callback = function(Sword)
    getgenv().Sword = Sword
    while getgenv().Sword do wait()
      UpStats("Sword")
    end
end})
T4:AddToggle({
  Name = "Devilfruit",
  Default = false,
  Callback = function(Devilfruit)
    getgenv().Devilfruit = Devilfruit
    while getgenv().Devilfruit do wait()
      UpStats("Devilfruit")
    end
end})
T4:AddToggle({
  Name = "Special",
  Default = false,
  Callback = function(Special)
    getgenv().Special = Special
    while getgenv().Special do wait()
      UpStats("Special")
    end
end})

T5:AddSection({"| Teleport Island"})
T5:AddDropdown({
    Name = "Select Island",
    Description = "",
    Options = Map,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(Val)
    getgenv().SeeMap = Val
end
})
T5:AddButton({"Teleport Island", function()
   TP(game.workspace.Map.SpawnLocation[getgenv().SeeMap].CFrame * CFrame.new(0,10,0))
end
})

T5:AddSection({"| Teleport NPC"})
T5:AddDropdown({
    Name = "Select NPC",
    Description = "",
    Options = NPC,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(Valu)
    getgenv().SeeNPC = Valu
end
})
T5:AddButton({"Teleport NPC", function()
    for _, v in pairs(workspace.Map.NPC:GetChildren()) do
        if v.Name == getgenv().SeeNPC then
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
        end
    end
end
})

T6:AddButton({"Redeem all Code", function()
    __RedeemCode()
end})
T6:AddSection({"| Random"})
T6:AddToggle({
  Name = "Auto Random Item[Gem]",
  Default = false,
  Callback = function(Ran)
    getgenv().Auto = Ran
end
})
T6:AddToggle({
  Name = "Auto Random Item[Money]",
  Default = false,
  Callback = function(Ran2)
    getgenv().Auto2 = Ran2
end
})
T6:AddToggle({
  Name = "Auto Random Family",
  Default = false,
  Callback = function(Fmm)
    getgenv().Family = Fmm
     while getgenv().Family do wait()
game:GetService("ReplicatedStorage").Events.SpinFamily:FireServer("Normal")
    end
end
})
T6:AddToggle({
  Name = "Auto Random Traits",
  Default = false,
  Callback = function(Race)
    getgenv().Racc = Race
     while getgenv().Racc do wait()
game:GetService("ReplicatedStorage").Events.SpinTrait:FireServer("Normal")
    end
end
})
T6:AddToggle({
  Name = "Auto Collect Chest",
  Default = false,
  Callback = function(Ch)
    getgenv().Chest = Ch
end
})



T7:AddSection({"| Select Weapon"})

T7:AddDropdown({
    Name = "Select Weapon",
    Description = "",
    Options = Wea,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(vbm)
    getgenv().Weapon = vbm
    end
})



T7:AddSection({"| One Shot"})
T7:AddToggle({
  Name = "One Shot Boss",
  Default = false,
  Callback = function(Ki)
    getgenv().Kill = Ki
end
})
T7:AddToggle({
  Name = "One Shot Monster",
  Default = false,
  Callback = function(Ki2)
    getgenv().Kill2 = Ki2
end
})






spawn(function()
    while wait(0.3) do
        if getgenv().Chest then
            pcall(function()
                for _, v in pairs(game:GetService("Workspace").ChestLoc:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Hinge") then
                        TP(v.Hinge.CFrame * CFrame.new(0, 5, 0))
                        for _, y in pairs(v:GetDescendants()) do
                            if y:IsA("ProximityPrompt") then
                                fireproximityprompt(y, 30)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
end)


spawn(function()
    while wait() do
        if getgenv().Farm then
            pcall(function()
                local ModelABC = false
                for _, mob in pairs(workspace.BossSpawns.BossSpawn:GetChildren()) do
                    if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") then
                        ModelABC = true
                        local humanoid = mob:FindFirstChild("Humanoid")
                        humanoid.WalkSpeed = 0
                        humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            if humanoid.Health > 1 then
                                TP(mob.HumanoidRootPart.CFrame * CFrame.new(0, Dismee or 0, getgenv().Config1["Distance From Mob"]))
                            end
                        until not getgenv().Farm or humanoid.Health <= 0
                        if humanoid.Health <= 0 then
                          wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFSPBOSS * CFrame.new(0, 250, 0)
                            wait(1)
                            if workspace.BossSpawns.BossSpawn:FindFirstChildOfClass("Model") and workspace.BossSpawns.BossSpawn:FindFirstChildOfClass("Model"):FindFirstChild("HumanoidRootPart") then
                                TP(workspace.BossSpawns.BossSpawn:FindFirstChildOfClass("Model").HumanoidRootPart.CFrame * CFrame.new(0, Dismee or 0, getgenv().Config1["Distance From Mob"]))
                            end
                        end
                    end
                end
                if not ModelABC then
                    if getgenv().SelSpawn == "Currency" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFSPBOSS * CFrame.new(0, 5, 0)
                        wait(0.1)
                        local args = {getgenv().SelSpawn2, "Currency"}
                        game:GetService("ReplicatedStorage").Events.BossSpawner:FireServer(unpack(args))
                    elseif getgenv().SelSpawn == "Item" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFSPBOSS * CFrame.new(0, 5, 0)
                        wait(0.1)
                        local args = {getgenv().SelSpawn2, "Item"}
                        game:GetService("ReplicatedStorage").Events.BossSpawner:FireServer(unpack(args))
                    end
                end
            end)
        end
    end
end)


spawn(function()
    while wait() do
        if getgenv().Farm2 then
            pcall(function()
                for _, mob in pairs(workspace.BossSpawns.BossSpawn:GetChildren()) do
                    if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") then
                        local humanoid = mob:FindFirstChild("Humanoid")
                        humanoid.WalkSpeed = 0
                        humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            TP(mob.HumanoidRootPart.CFrame * CFrame.new(0, Dismee, getgenv().Config1["Distance From Mob"]))
                        until not getgenv().Farm2
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().MoS then
            pcall(function()
                for _, v in pairs(workspace.Npcs:GetChildren()) do
                    if v:IsA("Model") and v.Name == getgenv().Monster and v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 0 then
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, Dismee, getgenv().Config1["Distance From Mob"]))
                        until not getgenv().MoS or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if getgenv().Sea then
            pcall(function()
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "SeaBeast" and v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 0 then
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
                        until not getgenv().Sea or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Auto then
                for _, v in pairs(workspace.Map.NPC.Random5X:GetDescendants()) do
                    if v:FindFirstChildOfClass("ProximityPrompt") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  workspace.Map.NPC.Random5X.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                        fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"), 30)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Auto2 then
                for _, v in pairs(workspace.Map.NPC.Random5XMoney:GetDescendants()) do
                    if v:FindFirstChildOfClass("ProximityPrompt") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  workspace.Map.NPC.Random5XMoney.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                        fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"), 30)
                    end
                end
            end
        end)
    end
end)

local radius = 15
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Kill then
              local player = game.Players.LocalPlayer
              local character = player.Character or player.CharacterAdded:Wait()
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                for _, v in pairs(workspace.BossSpawns.BossSpawn:GetDescendants()) do
                    if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                        local npcPosition = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                        local playerPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                        if npcPosition and playerPosition and (npcPosition - playerPosition).Magnitude <= 15 then
                            if v.Health < v.MaxHealth then
                              wait()
                                v.Health = 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)
local radius = 15
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Kill2 then
              local player = game.Players.LocalPlayer
              local character = player.Character or player.CharacterAdded:Wait()
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                for _, v in pairs(workspace.Npcs:GetChildren()) do
                    if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                        local npcPosition = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                        local playerPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                        if npcPosition and playerPosition and (npcPosition - playerPosition).Magnitude <= 15 then
                            if v.Health < v.MaxHealth then
                              wait()
                                v.Health = 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)
local radius = 15
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Sea then
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                
                local seaBeast = workspace:FindFirstChild("SeaBeast")
                if seaBeast then
                    for _, v in pairs(seaBeast:GetDescendants()) do
                        if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                            local npcPosition = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                            local playerPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                            if npcPosition and playerPosition and (npcPosition - playerPosition).Magnitude <= 15 then
                                if v.Health < v.MaxHealth then
                                    wait()
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
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().Farm2 or getgenv().Farm or getgenv().MoS then
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



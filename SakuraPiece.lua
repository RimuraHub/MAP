local ForLevel = 0 
function CheckLevel()
    local level = game.Players.LocalPlayer.Data.Levels.Value
    local Island, QuestAndName, CFrameMap
    if level >= 1 and level <= 499 then
        Island = "Starter Island"
        QuestAndName = "Bandit [Lv.1]"
        CFrameMap = CFrame.new(-1029.5448, 111.854706, 333.617798, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 500 and level <= 1249 then
        Island = "Starter Island"
        QuestAndName = "Bandit Pro [Lv.500]"
        CFrameMap = CFrame.new(-1029.5448, 111.854706, 333.617798, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 1250 and level <= 1999 then
        Island = "Starter Island"
        QuestAndName = "Lightning Bandit [Lv.1250]"
        CFrameMap = CFrame.new(-1029.5448, 111.854706, 333.617798, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 2000 and level <= 2249 then
        Island = "Starter Island"
        QuestAndName = "IShowSpeed [Lv.2000]"
        CFrameMap = CFrame.new(-1029.5448, 111.854706, 333.617798, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 2250 and level <= 2649 then
        Island = "Shell Town"
        QuestAndName = "Koby [Lv.2250]"
        CFrameMap = CFrame.new(-2712.96509, 198.115967, 1119.99353, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 2650 and level <= 2999 then
        Island = "Shell Town"
        QuestAndName = "Marine Captain [Lv.2650]"
        CFrameMap = CFrame.new(-2712.96509, 198.115967, 1119.99353, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 3000 and level <= 3499 then
        Island = "Shell Town"
        QuestAndName = "Ax Hand [Lv.3000]"
        CFrameMap = CFrame.new(-2712.96509, 198.115967, 1119.99353, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 3500 and level <= 3849 then
        Island = "Clown Island"
        QuestAndName = "Clown [Lv.3500]"
        CFrameMap = CFrame.new(-2303.61987, 215.812988, -697.979736, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif level >= 3850 and level <= 4499 then
        Island = "Clown Island"
        QuestAndName = "Clown Pirates [Lv.3850]"
        CFrameMap = CFrame.new(-2303.61987, 215.812988, -697.979736, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif level >= 4500 and level <= 4949 then
        Island = "Clown Island"
        QuestAndName = "Becky [Lv.4500]"
        CFrameMap = CFrame.new(-2303.61987, 215.812988, -697.979736, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif level >= 4950 and level <= 5499 then
        Island = "Snow Island"
        QuestAndName = "Yeti [Lv.4950]"
        CFrameMap = CFrame.new(-958.843445, 222.390274, -1712.97046, 0.995146096, 0, -0.0984086543, -0, 1, -0, 0.0984086543, 0, 0.995146096)
    elseif level >= 5500 and level <= 5999 then
        Island = "Snow Island"
        QuestAndName = "Snow Man [Lv.5500]"
        CFrameMap = CFrame.new(-958.843445, 222.390274, -1712.97046, 0.995146096, 0, -0.0984086543, -0, 1, -0, 0.0984086543, 0, 0.995146096)
    elseif level >= 6000 and level <= 6349 then
        Island = "Snow Island"
        QuestAndName = "Snow Dragon [Lv.6000]"
        CFrameMap = CFrame.new(-958.843445, 222.390274, -1712.97046, 0.995146096, 0, -0.0984086543, -0, 1, -0, 0.0984086543, 0, 0.995146096)
    elseif level >= 6350 and level <= 6724 then
        Island = "Desert Village"
        QuestAndName = "Sand Bandit [Lv.6350]"
        CFrameMap = CFrame.new(804.211548, 233.697205, -1220.52954, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 6725 and level <= 7249 then
        Island = "Desert Village"
        QuestAndName = "Chopper [Lv.6725]"
        CFrameMap = CFrame.new(804.211548, 233.697205, -1220.52954, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 7250 and level <= 7999 then
        Island = "Desert Village"
        QuestAndName = "Lord Dark [Lv.7250]"
        CFrameMap = CFrame.new(804.211548, 233.697205, -1220.52954, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif level >= 8000 then
        Island = "Desert Village"
        QuestAndName = "Nuggets Man [Lv.8000]"
        CFrameMap = CFrame.new(804.211548, 233.697205, -1220.52954, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
    return Island, QuestAndName, CFrameMap, level
end
function TP(CFrame)
    pcall(function()
        local humanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame
        else
            wait(1)
        end
    end)
end
local CheckQ = game.Players.LocalPlayer.PlayerGui.QuestUI.Interface
function Attack()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function EquipWea()
  for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") and v.ToolTip == _G.Weaponn then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
    end
  end
end





function Up(a, b, c)
    game:GetService("ReplicatedStorage").RemoteEvent.StatsEvent:FireServer(a, b, c)
end

redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Sakura Piece",
  SubTitle = "",
  SaveFolder = "Sakura_Piece|Confix.txt"
})

Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

T1 = Window:MakeTab({"Discord", "Info"})
T2 = Window:MakeTab({"Auto Farm", "Home"})
T4 = Window:MakeTab({"Stats", "Signal"})
T6 = Window:MakeTab({"Telepot", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})

T1:AddDiscordInvite({
  Name = "Rimura Hub | Community",
  Logo = "rbxassetid://18751483361",
  Invite = "https://discord.com/invite/Dmg8EJ2neK"
})


T2:AddSection({"| Auto Farm Mob"})
local Toggle1 = T2:AddToggle({
  Name = "Auto Farm Level",
  Default = false,
  Callback = function(Level)
    _G.Farm = Level
      if _G.Farm then
          game:GetService("ReplicatedStorage").RemoteEvent.Quest:FireServer("None")
      end
  end
})

local Toggle1 = T2:AddToggle({
  Name = "Auto Farm Nearest",
  Default = false,
  Callback = function(hee)
  _G.Hee = hee
  end
})

T2:AddSection({"| Auto Farm Boss"})
local Toggle1 = T2:AddToggle({
  Name = "Auto Farm Boss",
  Default = false,
  Callback = function(Bri)
  _G.BringBosss = Bri
  end
})

local Toggle1 = T2:AddToggle({
  Name = "Auto SeaBeast",
  Default = false,
  Callback = function(Sea)
  _G.SeaBea = Sea
  end
})
local SeaBeast = game:GetService("Workspace"):FindFirstChild("Sea Beast")

T2:AddSection({"| Auto Item"})
local Toggle1 = T2:AddToggle({
  Name = "Auto Raid",
  Default = false,
  Callback = function(Jsjwua)
    _G.AutoRaid = Jsjwua
  end
})
local Toggle1 = T2:AddToggle({
  Name = "Auto Server Hop Find Raid",
  Default = false,
  Callback = function(Jsjwua1)
    _G.Shop = Jsjwua1
  end
})
local Toggle1 = T2:AddToggle({
  Name = "Auto Mining & Gem",
  Default = false,
  Callback = function(hh)
  _G.gg = hh
while _G.gg do
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1235.90698, 2272.31006, -5280.27197, 0.999995828, 2.8163285e-09, 0.0028862434, -2.79841683e-09, 1, -6.20988594e-09, -0.0028862434, 6.20178309e-09, 0.999995828)
    for _, v in pairs(game:GetService("Workspace")["Mining Gem"]:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v, 10)
        end
    end
end
  end
})


T4:AddSection({"| Reset Stats"})
local Button1 = T4:AddButton({"Reset Stats", function()
    Up("StatsReset")
end})

T4:AddSection({"| Up Stats"})
local Toggle1 = T4:AddToggle({
  Name = "Up Melee",
  Default = false,
  Callback = function(Melee)
    _G.Melee = Melee
      while _G.Melee do wait()
        Up("UpStats", "Melee", 1)
      end
  end
})
local Toggle1 = T4:AddToggle({
  Name = "Up Sword",
  Default = false,
  Callback = function(Sword)
    _G.Sword = Sword
      while _G.Sword do wait()
        Up("UpStats", "Sword", 1)
      end
  end
})
local Toggle1 = T4:AddToggle({
  Name = "Up Defense",
  Default = false,
  Callback = function(Defense)
    _G.Defense = Defense
      while _G.Defense do wait()
        Up("UpStats", "Defense", 1)
      end
  end
})
local Toggle1 = T4:AddToggle({
  Name = "Up DevilFruit",
  Default = false,
  Callback = function(DevilFruit)
    _G.DevilFruit = DevilFruit
      while _G.DevilFruit do wait()
        Up("UpStats", "DevilFruit", 1)
      end
  end
})

T6:AddButton({"Alina Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1188.608642578125, 118.98430633544922, 2170.4638671875)
end})

T6:AddButton({"Beast Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3993.435546875, 233.46775817871094, -521.3768920898438)
end})

T6:AddButton({"Clown Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2354.381103515625, 172.91641235351562, -944.6530151367188)
end})

T6:AddButton({"Desert Village", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1339.0888671875, 191.0885009765625, -1245.7701416015625)
end})

T6:AddButton({"Higher Isle", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45.58034133911133, 375.4844055175781, 1353.060302734375)
end})

T6:AddButton({"Shell Town", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3082.745361328125, 283.4375915527344, 1152.3812255859375)
end})

T6:AddButton({"Snow Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-744.7770385742188, 91.11155700683594, -1776.090087890625)
end})

T6:AddButton({"Starter Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1010.0597534179688, 89.7964859008789, 334.80963134765625)
end})

T6:AddButton({"Warrior Arena", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(441.92913818359375, 109.91389465332031, 347.3184814453125)
end})

T5:AddSection({"| Instant Kill"})

local Toggle1 = T5:AddToggle({
  Name = "One Shot Mon",
  Default = false,
  Callback = function(Monee)
    getgenv().Config = {
    ["Folder Mon"] = "SpawnEnemy",
    ["Instant Kill"] = Monee,
    ["Radius"] = 40
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/Godmey/Inkillallmap/main/inkill.lua'))()
  end
})
local Toggle1 = T5:AddToggle({
  Name = "One Shot Boss",
  Default = false,
  Callback = function(OneBos)
    _G.OneBoss = OneBos
  end
})

local Toggle1 = T5:AddToggle({
  Name = "Kill Aura",
  Default = false,
  Callback = function(Aura)
    _G.KillAura = Aura
  end
})
T5:AddSection({"| All Skills"})
local Button1 = T5:AddButton({"Fire All Skills", function()
    for _, v in ipairs(game:GetDescendants()) do
    if v:IsA("RemoteEvent") then
        v:FireServer() 
    end
  end
end})

T5:AddSection({"| Cooldown"})

T5:AddButton({"Show Cooldown", function()
local player = game:GetService("Players").LocalPlayer
local cooldown = player:WaitForChild("Cooldown")

-- Melee Cooldowns
local melee = cooldown:WaitForChild("Melee")
local cooldownMeleeC = melee:WaitForChild("C")
local cooldownMeleeZ = melee:WaitForChild("Z")
local cooldownMeleeX = melee:WaitForChild("X")
local cooldownMeleeV = melee:WaitForChild("V")
local cooldownMeleeF = melee:WaitForChild("F")

-- DevilFruit Cooldowns
local devilFruit = cooldown:WaitForChild("DevilFruit")
local cooldownDevilC = devilFruit:WaitForChild("C")
local cooldownDevilZ = devilFruit:WaitForChild("Z")
local cooldownDevilX = devilFruit:WaitForChild("X")
local cooldownDevilV = devilFruit:WaitForChild("V")
local cooldownDevilF = devilFruit:WaitForChild("F")

-- Sword Cooldowns
local sword = cooldown:WaitForChild("Sword")
local cooldownSwordC = sword:WaitForChild("C")
local cooldownSwordZ = sword:WaitForChild("Z")
local cooldownSwordX = sword:WaitForChild("X")
local cooldownSwordV = sword:WaitForChild("V")
local cooldownSwordF = sword:WaitForChild("F")

local screenGui = Instance.new("ScreenGui")

-- ฟังก์ชันสำหรับสร้าง TextLabel และกำหนดตำแหน่ง
local function createLabel(position)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 150, 0, 30) -- ขนาดเล็กลงเพื่อลดพื้นที่
    label.Position = position
    label.TextScaled = true
    label.BackgroundTransparency = 1 -- ทำให้พื้นหลังโปร่งใส
    label.TextColor3 = Color3.new(1, 1, 1) -- สีตัวอักษรเป็นสีขาว (RGB: 255, 255, 255)

    -- ตั้งฟอนต์ให้เป็น RobotoMono แบบ Bold
    label.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

    label.Parent = screenGui
    return label
end

-- สร้างกลุ่มป้ายสำหรับ Melee
local meleeLabels = {
    createLabel(UDim2.new(0.5, -75, 0.1, 0)), -- Melee.C
    createLabel(UDim2.new(0.5, -75, 0.15, 0)), -- Melee.Z
    createLabel(UDim2.new(0.5, -75, 0.2, 0)), -- Melee.X
    createLabel(UDim2.new(0.5, -75, 0.25, 0)), -- Melee.V
    createLabel(UDim2.new(0.5, -75, 0.3, 0)), -- Melee.F
}

-- สร้างกลุ่มป้ายสำหรับ DevilFruit (ด้านซ้ายของ Melee)
local devilFruitLabels = {
    createLabel(UDim2.new(0.4, -75, 0.1, 0)), -- DevilFruit.C
    createLabel(UDim2.new(0.4, -75, 0.15, 0)), -- DevilFruit.Z
    createLabel(UDim2.new(0.4, -75, 0.2, 0)), -- DevilFruit.X
    createLabel(UDim2.new(0.4, -75, 0.25, 0)), -- DevilFruit.V
    createLabel(UDim2.new(0.4, -75, 0.3, 0)), -- DevilFruit.F
}

-- สร้างกลุ่มป้ายสำหรับ Sword (ด้านขวาของ Melee)
local swordLabels = {
    createLabel(UDim2.new(0.6, -75, 0.1, 0)), -- Sword.C
    createLabel(UDim2.new(0.6, -75, 0.15, 0)), -- Sword.Z
    createLabel(UDim2.new(0.6, -75, 0.2, 0)), -- Sword.X
    createLabel(UDim2.new(0.6, -75, 0.25, 0)), -- Sword.V
    createLabel(UDim2.new(0.6, -75, 0.3, 0)), -- Sword.F
}

-- ฟังก์ชันสำหรับอัปเดตค่าและซ่อน Label เมื่อค่าเป็น 0
local function updateLabel(label, value, key)
    label.Text = key .. ": " .. value.Value

    if value.Value == 0 then
        label.Visible = false
    else
        label.Visible = true
    end
end

-- ฟังก์ชันสำหรับอัปเดตป้ายทั้งหมด
local function updateAllLabels()
    -- อัปเดต Melee
    updateLabel(meleeLabels[1], cooldownMeleeC, "Melee.C")
    updateLabel(meleeLabels[2], cooldownMeleeZ, "Melee.Z")
    updateLabel(meleeLabels[3], cooldownMeleeX, "Melee.X")
    updateLabel(meleeLabels[4], cooldownMeleeV, "Melee.V")
    updateLabel(meleeLabels[5], cooldownMeleeF, "Melee.F")
    
    -- อัปเดต DevilFruit
    updateLabel(devilFruitLabels[1], cooldownDevilC, "DevilFruit.C")
    updateLabel(devilFruitLabels[2], cooldownDevilZ, "DevilFruit.Z")
    updateLabel(devilFruitLabels[3], cooldownDevilX, "DevilFruit.X")
    updateLabel(devilFruitLabels[4], cooldownDevilV, "DevilFruit.V")
    updateLabel(devilFruitLabels[5], cooldownDevilF, "DevilFruit.F")
    
    -- อัปเดต Sword
    updateLabel(swordLabels[1], cooldownSwordC, "Sword.C")
    updateLabel(swordLabels[2], cooldownSwordZ, "Sword.Z")
    updateLabel(swordLabels[3], cooldownSwordX, "Sword.X")
    updateLabel(swordLabels[4], cooldownSwordV, "Sword.V")
    updateLabel(swordLabels[5], cooldownSwordF, "Sword.F")
end

-- อัปเดตเมื่อค่า Cooldown เปลี่ยน
cooldownMeleeC.Changed:Connect(function() updateLabel(meleeLabels[1], cooldownMeleeC, "Melee.C") end)
cooldownMeleeZ.Changed:Connect(function() updateLabel(meleeLabels[2], cooldownMeleeZ, "Melee.Z") end)
cooldownMeleeX.Changed:Connect(function() updateLabel(meleeLabels[3], cooldownMeleeX, "Melee.X") end)
cooldownMeleeV.Changed:Connect(function() updateLabel(meleeLabels[4], cooldownMeleeV, "Melee.V") end)
cooldownMeleeF.Changed:Connect(function() updateLabel(meleeLabels[5], cooldownMeleeF, "Melee.F") end)

cooldownDevilC.Changed:Connect(function() updateLabel(devilFruitLabels[1], cooldownDevilC, "DevilFruit.C") end)
cooldownDevilZ.Changed:Connect(function() updateLabel(devilFruitLabels[2], cooldownDevilZ, "DevilFruit.Z") end)
cooldownDevilX.Changed:Connect(function() updateLabel(devilFruitLabels[3], cooldownDevilX, "DevilFruit.X") end)
cooldownDevilV.Changed:Connect(function() updateLabel(devilFruitLabels[4], cooldownDevilV, "DevilFruit.V") end)
cooldownDevilF.Changed:Connect(function() updateLabel(devilFruitLabels[5], cooldownDevilF, "DevilFruit.F") end)

cooldownSwordC.Changed:Connect(function() updateLabel(swordLabels[1], cooldownSwordC, "Sword.C") end)
cooldownSwordZ.Changed:Connect(function() updateLabel(swordLabels[2], cooldownSwordZ, "Sword.Z") end)
cooldownSwordX.Changed:Connect(function() updateLabel(swordLabels[3], cooldownSwordX, "Sword.X") end)
cooldownSwordV.Changed:Connect(function() updateLabel(swordLabels[4], cooldownSwordV, "Sword.V") end)
cooldownSwordF.Changed:Connect(function() updateLabel(swordLabels[5], cooldownSwordF, "Sword.F") end)

-- อัปเดตทันทีเมื่อเริ่มต้น
updateAllLabels()

-- เพิ่ม ScreenGui ไปยัง PlayerGui
screenGui.Parent = player:WaitForChild("PlayerGui")
end})

T5:AddSection({"| Select Weapon"})
T5:AddDropdown({
  Name = "Select Weapon",
  Options = {"Melee", "Sword", "Devil Fruit"},
  Default = nil,
  Flag = "Weapon",
  Callback = function(Value)
    _G.Weaponn = Value
  end
})


T5:AddSection({"| Store"})
local Toggle1 = T5:AddToggle({
  Name = "Auto Store Item",
  Default = false,
  Callback = function(eoidhwuud)
    _G.Store = eoidhwuud
  end
})


spawn(function()
    while wait() do
        if _G.SeaBea then
            pcall(function()
                if SeaBeast then
                    Attack()
                    EquipWea()
                    TP(CFrame.new(-4114.19727, 129.650345, -668.038879, 0.25223133, -7.96880215e-08, -0.967666984, 3.04722363e-08, 1, -7.44078008e-08, 0.967666984, -1.07189972e-08, 0.25223133))
                end
            end)
        end
    end
end)

spawn(function()
  local Wave = workspace["Raid Island"]:FindFirstChild("Telepot point")
  --[[
  local Waveeee = Wave.Attachment.BillboardGui.Frame.TextLabel.Text
  --]]
  while wait() do
    pcall(function()
      if _G.AutoRaid then
        if workspace:FindFirstChild("Raid") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Raid.CFrame * CFrame.new(0, 0, 0)
          task.wait()
          for _, v in pairs(workspace:FindFirstChild("Raid"):GetChildren()) do
            if v:IsA("ProximityPrompt") then
              fireproximityprompt(v,30)
            end
          end
        else
          if Wave then
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400000)
        sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400000)
        for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
          if v.ClassName == 'Humanoid' and v.Parent.Name ~= game.Players.LocalPlayer.Name then
            v.Health = 0
          end
        end
          else
            print("GG")
          end
        end
      end
    end)
  end
end)



function BringMon()
    local HitBox = 10
    local Island, QuestAndName, CFrameMap = CheckLevel()
    for i, v in pairs(game:GetService("Workspace").SpawnEnemy:GetDescendants()) do
        if v:IsA("Model") and v.Name == QuestAndName then
            local humanoid = v:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -6)
                    v.HumanoidRootPart.Size = Vector3.new(HitBox, HitBox, HitBox)
                    v.HumanoidRootPart.Transparency = 0.9
                    v.HumanoidRootPart.CanCollide = false
                    v.Head.CanCollide = false
                    humanoid:ChangeState(14)
                    humanoid.WalkSpeed = 0
                    humanoid.JumpPower = 0
                    if sethiddenproperty then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",

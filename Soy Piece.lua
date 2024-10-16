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
local function AddDropdownn(q, w, e, r, t, y)
    q:AddDropdown({Name = w, Options = e, Default = r, Flag = t, Callback = y})
end
function _Attack()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function EquipTool()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == _G.Weapon then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end
local function TP(cframe)
    pcall(
        function()
            local character = game.Players.LocalPlayer.Character
            if character and character.PrimaryPart then
                character:SetPrimaryPartCFrame(cframe)
            end
        end
    )
end
function Up(a, b)
    game:GetService("ReplicatedStorage").AddPoints:FireServer(a, b)
end

------[[ Local Global ]]------

local Wsp = game:GetService("Workspace")
local Ply = game:GetService("Players")
local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(game.Players.LocalPlayer.Backpack, "Tool")
local Shop = GetN_Child(Wsp.Shop, "Model")
local Mon = {"Bandit", "Monkey", "Pirate", "Rock Mon", "Sky Mon", "TreeMod"}
local boss = {"Bandit Boss", " Buggy", "God", "Monkey Boss", "Pirate Boss", "Rock Mon Boss", "TreeMod Boss"}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Godmey/Redz-Ui/refs/heads/main/Ui.lua"))()
local _gv = getgenv()

------[[ Ui library ]]------

local Window =
    redzlib:MakeWindow(
    {
        Title = "Rimura Hub : " .. NameMap, -- muyoug piece
        SubTitle = "",
        SaveFolder = ""
    }
)
Window:AddMinimizeButton(
    {
        Button = {Image = "rbxassetid://18751483361", BackgroundTransparency = 0},
        Corner = {CornerRadius = UDim.new(0, 6)}
    }
)
T1 = Window:MakeTab({"Discord", "Info"})
T2 = Window:MakeTab({"Auto Farm", "Home"})
T3 = Window:MakeTab({"Stats", "Signal"})
T4 = Window:MakeTab({"Teleport", "Signal"})
T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite(
    {
        Name = "Rimura Hub | Community",
        Logo = "rbxassetid://18751483361",
        Invite = "https://discord.com/invite/Dmg8EJ2neK"
    }
)
T2:AddSection({"| Auto Farm"})
AddDropdownn(
    T2,
    "Select Monster",
    Mon,
    "nil",
    "Mon",
    function(q)
        _gv.SLM = q
    end
)
AddDropdownn(
    T2,
    "Select Boss",
    boss,
    "nil",
    "boss",
    function(m)
        _gv.SLB = m
    end
)

T2:AddToggle(
    {
        Name = "Mon Farm",
        Default = false,
        Callback = function(w)
            _gv.ATF = w
        end
    }
)
T2:AddToggle(
    {
        Name = "Boss Farm",
        Default = false,
        Callback = function(l)
            _gv.ATB = l
        end
    }
)
T3:AddSection({"| Up Stats"})
T3:AddToggle(
    {
        Name = "Up Health",
        Default = false,
        Callback = function(Melee)
            _G.Melee = Melee
            while _G.Melee do
                wait()
                Up("Health", "1")
            end
        end
    }
)
T3:AddToggle(
    {
        Name = "Up Sword",
        Default = false,
        Callback = function(Sword)
            _G.Sword = Sword
            while _G.Sword do
                wait()
                Up("Sword", "1")
            end
        end
    }
)
T3:AddToggle(
    {
        Name = "Up Skill",
        Default = false,
        Callback = function(Defense)
            _G.Defense = Defense
            while _G.Defense do
                wait()
                Up("Skill", "1")
            end
        end
    }
)
T3:AddToggle(
    {
        Name = "Up Melee",
        Default = false,
        Callback = function(DevilFruit)
            _G.DevilFruit = DevilFruit
            while _G.DevilFruit do
                wait()
                Up("Melee", "1")
            end
        end
    }
)
T4:AddSection({"| Shop"})
AddDropdownn(
    T4,
    "Select Shop",
    Shop,
    "nil",
    "Shop",
    function(Sis)
        _gv.SLS = Sis
    end
)
T4:AddButton(
    {
        "Teleport Shop",
        function()
            for _, v in pairs(Wsp.Shop:GetDescendants()) do
                if v.Name == _gv.SLS and v:IsA("Model") then
                    TP(v.WorldPivot * CFrame.new(0, 10, 0))
                end
            end
        end
    }
)
T5:AddSection({"| Weapon"})
AddDropdownn(
    T5,
    "Select Weapon",
    Wea,
    "nil",
    "Weapon",
    function(ooooo)
        _G.Weapon = ooooo
    end
)

------[[ Spawn function ]]------

spawn(
    function()
        while true do
            task.wait()
            pcall(
                function()
                    if _gv.ATF then
                        local Monster = game:GetService("Workspace")["มอน"]
                        for _, v in pairs(Monster:GetChildren()) do
                            if v.Name == _gv.SLM then
                                local humanoid = v:FindFirstChild("Humanoid")
                                local hrp = v:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
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
                                            TP(
                                                v.HumanoidRootPart.CFrame * CFrame.new(0, 9, 0) *
                                                    CFrame.Angles(math.rad(-90), 0, 0)
                                            )
                                        end
                                    until not _gv.ATF or humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)
spawn(
    function()
        while true do
            task.wait()
            pcall(
                function()
                    if _gv.ATB then
                        local BossFil = game:GetService("Workspace")["มอน"]
                        for _, y in pairs(BossFil:GetChildren()) do
                            if y.Name == _gv.SLB then
                                local humanoid = y:FindFirstChild("Humanoid")
                                local hrp = y:FindFirstChild("HumanoidRootPart")
                                if hrp and humanoid and humanoid.Health > 0 then
                                    y.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                                    y.HumanoidRootPart.Transparency = 0.9
                                    y.HumanoidRootPart.CanCollide = false
                                    y.Head.CanCollide = false
                                    y:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                                    y:FindFirstChildOfClass("Humanoid").JumpPower = 0
                                    repeat
                                        task.wait()
                                        _Attack()
                                        EquipTool()
                                        if _gv.ATB and humanoid.Health > 1 then
                                            TP(
                                                y.HumanoidRootPart.CFrame * CFrame.new(0, 9, 0) *
                                                    CFrame.Angles(math.rad(-90), 0, 0)
                                            )
                                        end
                                    until not _gv.ATB or humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)
spawn(
    function()
        game:GetService("RunService").Stepped:Connect(
            function()
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
            end
        )
    end
)

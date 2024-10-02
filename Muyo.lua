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
local function AddDropdown(q,w,e,r,t,y)
q:AddDropdown({Name=w,Options=e,Default=r,Flag=t,Callback=y})
end
function _Attack()
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158),game:GetService("Workspace").Camera.CFrame)
end
function EquipTool()
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_G.Weapon))
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
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Wea = GetN_Child(Ply.LocalPlayer.Backpack, "Tool")
local island = GetN_Child(Wsp.Map.island,"Model")
local Shop = GetN_Child(Wsp.Map.Shop,"Model")
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Godmey/Redz-Ui/refs/heads/main/Ui.lua"))()
local _gv = getgenv()
for _, v in pairs(Wsp.Map.Monster:GetDescendants()) do
  if v:IsA("Model") and string.find(v.Name, "%[") and string.find(v.Name, "%]") then
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
local T1 = Window:MakeTab({"Discord", "Info"})
local T2 = Window:MakeTab({"Auto Farm", "Home"})
local T4 = Window:MakeTab({"Teleport", "Signal"})
local T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub | Community",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
T2:AddSection({"| Auto Farm"})
AddDropdown(T2, "Select Monster", Mon, "nil", "Mon", function(q)
_gv.SLM = q
end)
T2:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(w)
      _gv.ATF = w
    end
})
T2:AddToggle({
    Name = "Auto Farm All Boss",
    Default = false,
    Callback = function(e)
      _gv.ATB = e
    end
})
T4:AddSection({"| Island"})
AddDropdown(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for _, v in pairs(Wsp.Map.island[_gv.SLIS]:GetDescendants()) do
      if v:IsA("Part") then
        TP(v.CFrame * CFrame.new(0,100,0))
      end
    end
  end
})
T4:AddSection({"| Shop"})
AddDropdown(T4, "Select Shop", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(Wsp.Map.Shop[_gv.SLS]:GetDescendants()) do
      if v:IsA("Part") then
        TP(v.CFrame * CFrame.new(0,10,0))
      end
    end
  end
})
T5:AddSection({"| Weapon"})
AddDropdown(T5, "Select Weapon", Wea,"nil", "Weapon", function(ooooo)
    _G.Weapon = ooooo
end)
T5:AddToggle({
    Name = "One Hit [65%]",
    Default = false,
    Callback = function(hhh)
        _gv.OH = hhh
    end
})

T5:AddButton({"Redeem All Code", function()
   for _, v in pairs(game:GetService("Players").LocalPlayer.Codes:GetChildren()) do
       if v.Name then
game:GetService("ReplicatedStorage").RedeemCode:FireServer(v.Name)
       end
    end
end
})
------[[ Spawn Function ]]------

spawn(function()
    while wait() do
        pcall(function()
            if _gv.ATF then
                for _, v in pairs(Wsp.Map.Monster:GetDescendants()) do
                    if v:IsA("Model") and v.Name == _gv.SLM and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health >= 1 then
                      v.HumanoidRootPart.Size = Vector3.new(7, 30, 7)
                      v.HumanoidRootPart.Transparency = 1
                      v.HumanoidRootPart.CanCollide = false
                      v.Head.CanCollide = false
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                    repeat
                      task.wait()
                      _Attack()
                      EquipTool()
                      if _gv.OH and v:FindFirstChildOfClass("Humanoid").Health < v:FindFirstChildOfClass("Humanoid").MaxHealth and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        wait(0.1)
                          v:FindFirstChildOfClass("Humanoid").Health = 0
                      end
                      TP(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0,16,0)*CFrame.Angles(math.rad(-90),0,0))
                        until _gv.ATF == false or v.Humanoid.Health <= 0
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _gv.ATB then
                for _, v in pairs(Wsp:GetChildren()) do
                    if v:IsA("Model") and string.find(v.Name, "%[") and string.find(v.Name, "%]") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health >= 1 then
                      v.HumanoidRootPart.Size = Vector3.new(7, 30, 7)
                      v.HumanoidRootPart.Transparency = 1
                      v.HumanoidRootPart.CanCollide = false
                      v.Head.CanCollide = false
                      v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                      v:FindFirstChildOfClass("Humanoid").JumpPower = 0
                    repeat
                      task.wait()
                      _Attack()
                      EquipTool()
                      if _gv.OH and v:FindFirstChildOfClass("Humanoid").Health < v:FindFirstChildOfClass("Humanoid").MaxHealth and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        wait(0.1)
                          v:FindFirstChildOfClass("Humanoid").Health = 0
                      end
                      TP(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0,16,0)*CFrame.Angles(math.rad(-90),0,0))
                        until _gv.ATB == false or v.Humanoid.Health <= 0
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
end)

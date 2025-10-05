task.spawn(function()
    while true do
      task.wait()
         pcall(function()
for _, m in ipairs(workspace.Monsters:GetDescendants()) do
    if m:IsA("Model") then
        if m.Name:match("%d+$") then
            m.Name = m.Name:gsub("%d+$", "")
        end
    end
end
        end)
    end
end)
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
        if v:IsA("Tool") and v.ToolTip == _gv.Weapon then
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
function fpp(parent)
    for _, v in pairs(parent:GetDescendants()) do
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
function Up(a,b)
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("StatsGui"):WaitForChild("StatsFrame"):WaitForChild("Stats2Frame"):WaitForChild("RemoteUpstats"):WaitForChild("RemoteEvent"):FireServer(a,b)
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
local Wea = {"Melee","Sword","DevilFruit","Gun"}
local Method = {"Upper","Behind","Below"}
local island = GetN_Child(workspace.Maps,"Model")
local Shop = GetN_Child(workspace.Seller,"Model")
local Mon = {}
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
for _,v in ipairs(workspace.Monsters:GetDescendants())do
	if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") then
		Mon[#Mon+1] = v.Name
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
T2 = Window:MakeTab({"Auto", "Home"})
T3 = Window:MakeTab({"Stats", "Signal"})
T4 = Window:MakeTab({"Teleport", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})
T1:AddDiscordInvite({
    Name = "Rimura Hub",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})
T2:AddSection({"| Mon"})
AddDropdownn(T2, "Select Mon", Mon, "nil", "Mon", function(q)
_gv.SLM = q
end)
T2:AddToggle({
    Name = "Farm Mon",
    Default = false,
    Callback = function(MOB)
      _gv.AUTOFARMMON = MOB
    end
})
T3:AddSection({"| Up Stats"})
T3:AddSlider({"Up Number", 1, 1000, 1, 1, function(VALUE)
_gv.UPNUM = VALUE
end})
T3:AddToggle({
  Name = "Up Melee",
  Default = false,
  Callback = function(Melee)
    _gv.Melee = Melee
      while _gv.Melee do task.wait()
        Up("Melee",_gv.UPNUM)
      end
  end
})
T3:AddToggle({
  Name = "Up Health",
  Default = false,
  Callback = function(Defense)
    _gv.Defense = Defense
      while _gv.Defense do task.wait()
        Up("Health",_gv.UPNUM)
      end
  end
})
T3:AddToggle({
  Name = "Up Sword",
  Default = false,
  Callback = function(Sword)
    _gv.Sword = Sword
      while _gv.Sword do task.wait()
        Up("Sword",_gv.UPNUM)
      end
  end
})
T4:AddSection({"| Island"})
AddDropdownn(T4, "Select island", island, "nil", "island", function(gay)
_gv.SLIS = gay
end)
T4:AddButton({"Teleport Island", function()
   for _, v in pairs(workspace.Maps:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLIS then
       TP(v.WorldPivot * CFrame.new(0,3,0),true)
      end
    end
  end
})
T4:AddSection({"| Shop"})
AddDropdownn(T4, "Select Shop", Shop, "nil", "Shop", function(Sis)
_gv.SLS = Sis
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(workspace.Seller:GetChildren()) do
      if v:IsA("Model") and v.Name == _gv.SLS then
        TP(v.WorldPivot * CFrame.new(0,3,0),false)
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
T5:AddSlider({"Farm Distance", 1, 30, 1, 7, function(VALUE)
_gv.DistanceMob = VALUE
end})
T5:AddToggle({
  Name = "White_Screen",
  Default = false,
  Callback = function(White_Screen)
    _gv.White_Screen = White_Screen
  end
})
T5:AddToggle({
  Name = "oneshot",
  Default = true,
  Callback = function(nmkaa)
    _gv.oneshot = nmkaa
  end
})
T5:AddSection({"| Auto Skill"})
AddDropdownn(T5, "Select Mod", {"Farm","skill"}, "Farm", "Modskill", function(selekey)
_gv.keysele = selekey
end)
T5:AddToggle({
  Name = "Z",
  Default = true,
  Callback = function(Z)
    _gv.Z = Z
  end
})
T5:AddToggle({
  Name = "X",
  Default = true,
  Callback = function(X)
    _gv.X = X
  end
})
T5:AddToggle({
  Name = "C",
  Default = true,
  Callback = function(C)
    _gv.C = C
  end
})
T5:AddToggle({
  Name = "V",
  Default = true,
  Callback = function(V)
    _gv.V = V
  end
})

------[[ Spawn function ]]------

getgenv().Config = {
    ["Folder Mon"] = "Monsters", 
    ["Instant Kill"] = _gv.oneshot,
    ["Radius"] = 15
}
spawn(function()
    while task.wait() do
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
                        
                        if MonPoz and PlayerPoz and (MonPoz - PlayerPoz).Magnitude <= getgenv().Config["Radius"] then
                            if v.Health < v.MaxHealth then
                                wait(.1)
                                v.Health = 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while true do
      task.wait()
         pcall(function()
            if _gv.AUTOFARMMON then
               local Monster = workspace.Monsters
               if  _gv.SLM ~= nil then
                for _, v in pairs(Monster:GetDescendants()) do
                    if v.Name == _gv.SLM then
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
            end
        end)
    end
end)
task.spawn(function()
    while true do
      task.wait()
         pcall(function()
            if _gv.keysele == "skill" then
               HandleKeyPress()
            end
        end)
    end
end)
task.spawn(function()
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
task.spawn(function()
    while true do
        task.wait()
        if _gv.White_Screen then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
end)
task.spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _gv.AUTOFARMQuest or _gv.AUTOFARMMON or _gv.AUTOFARMASB or _gv.AUTOFARMAllBoss or _gv.AutoDungeon then
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



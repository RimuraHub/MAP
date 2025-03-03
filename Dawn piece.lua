if not getgenv().Config then
  getgenv().Config = {
    ["Misc"] = {
      ["Distance"] = 7,
      ["Method Farm"] = "Upper",
      ["Weapon"] = "Style",
    };
    ["Discord Webhook"] = {
      ["Link Webhook"] = "nil" -- Bit Kub
    };
    ["Auto Farm"] = {
      AutoFarm = {
        ["Auto Farm Level"] = false,
        ["Auto Farm Boss"] = false
        },
      Touch = {
        ["Auto Collect Chest"] = false,
        ["Auto Collect Fruits"] = false
      }
    };
    ["Stats"] = {
      ["Up Number"] = 1,
      Up = {
        ["Strength"] = false,
        ["Defense"] = false,
        ["Weapon"] =  false,
        ["Ability"] = false
      }
    };
  }
end
local SwordGet = {}
for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Animations.Weapon:GetChildren()) do
  if v:IsA("Folder") then
    table.insert(SwordGet, v.Name)
  end
end
local AccessoryGet = {}
for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Models.Accessory:GetChildren()) do
  if v:IsA("Model") then
    table.insert(AccessoryGet, v.Name)
  end
end
local Island, NPC = {}, {}
for _, Value in pairs({"Islands", "NPCs"}) do
    for _, v in pairs(workspace[Value]:GetChildren()) do
        if v:IsA("Model") then
            if Value == "Islands" then
                table.insert(Island, v.Name)
            elseif Value == "NPCs" and not v.Name:match("^Quest") then
                table.insert(NPC, v.Name)
            end
        end
    end
end
local TP = function(cframe)
  pcall(function()
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(cframe)
  end)
end
local FireGui = function(Target) 
  local vim = game:GetService("VirtualInputManager")
  if Target.Visible then
    game:GetService("GuiService").SelectedObject = Target
    vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game); wait(0.1)
    vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
    wait(0.5)
  end
end
local EquipWeapon = function()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") and v.ToolTip == _G.Weapon then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
    end
  end
end

local Attack = function()
  game:GetService('VirtualUser'):CaptureController()
  game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

local FireProxim = function(value)
  for _, Proxi in pairs(value:GetDescendants()) do
    if Proxi:IsA("ProximityPrompt") then
      Proxi:InputHoldBegin(game.Players.LocalPlayer)
        wait(0.1)
      Proxi:InputHoldEnd(game.Players.LocalPlayer)
    end
  end
end


local DataQuest = require(game:GetService("ReplicatedStorage").Modules.QuestData)
local CheckLevel = function()
  local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
  local DataLevel = {}
  for i, v in pairs(DataQuest) do
    if tonumber(v.Level) <= tonumber(MyLevel) then
      table.insert(DataLevel, tonumber(v.Level))
    end
  end
  return math.max(unpack(DataLevel))
end
local QuestCheck = function()
  local NeedLevel = CheckLevel()
  if not DataQuest then
    return nil
  end
  for x, y in pairs(DataQuest) do
    if tonumber(y.Level) == NeedLevel then
      return {Level = y.Level, NameMon = y.Target, NameQuest = x}
    end
  end
  return nil
end

redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
  SubTitle = "",
  SaveFolder = ""
})

Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

T1 = Window:MakeTab({"Discord", "Info"})
T2 = Window:MakeTab({"Auto Farm", "Home"})
Item = Window:MakeTab({"Item", "Sword"})
T3 = Window:MakeTab({"Stats", "Signal"})
T4 = Window:MakeTab({"Telepot", "Locate"})
T5 = Window:MakeTab({"Misc", "Settings"})

T1:AddDiscordInvite({
  Name = "Rimura Hub | Community",
  Logo = "rbxassetid://18751483361",
  Invite = "https://discord.com/invite/Dmg8EJ2neK"
})
T2:AddSection({"| Auto Farm 💥"})
T2:AddToggle({
  Name = "Auto Farm Level",
  Default = getgenv().Config["Auto Farm"]["Auto Farm Level"] or false,
  Callback = function(_aB29_Xp7LmQ4)
    _G.AutoFarmLevel = _aB29_Xp7LmQ4
  end
})
T2:AddToggle({
  Name = "Auto Farm Boss",
  Default = getgenv().Config["Auto Farm"]["Auto Farm Boss"] or false,
  Callback = function(_eL93_Xm7QpB1)
    _G.AutoFarmBoss = _eL93_Xm7QpB1
  end
})
T2:AddSection({"| Touch 🌿"})
T2:AddToggle({
  Name = "Auto Collect Chest",
  Default = getgenv().Config["Auto Farm"].Touch["Auto Collect Chest"] or false,
  Callback = function(_zQ83_Lm7XpB5)
    _G.AutoChest = _zQ83_Lm7XpB5
  end
})
T2:AddToggle({
  Name = "Auto Collect Fruits",
  Default = getgenv().Config["Auto Farm"].Touch["Auto Collect Fruits"] or false,
  Callback = function(_vM64_Qp2LxK9)
    _G.AutoFruit = _vM64_Qp2LxK9
  end
})
Item:AddSection({"| Get a Sword 🗡️"})
Item:AddDropdown({
  Name = "Select Sword",
  Options = SwordGet,
  Default = "nil",
  Flag = nil,
  Callback = function(S)
  _G.GetSword = S
  end
})
Item:AddButton({
  Name = "Get a Sword",
  Callback = function()
    for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Animations.Weapon:GetChildren()) do
      if v:IsA("Folder") and v.Name == _G.GetSword then
        game:GetService("ReplicatedStorage").Remotes.Functions.Input:InvokeServer("Equip", v,"Weapon")
      end
    end
  end
})
Item:AddSection({"| Get a Accessory ⚡"})
Item:AddDropdown({
  Name = "Select Sword",
  Options = AccessoryGet,
  Default = "nil",
  Flag = nil,
  Callback = function(A)
  _G.GetAccessory = A
  end
})
Item:AddButton({
  Name = "Get a Accessory",
  Callback = function()
    for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Models.Accessory:GetChildren()) do
      if v:IsA("Model") and v.Name == _G.GetAccessory then
        game:GetService("ReplicatedStorage").Remotes.Functions.Input:InvokeServer("Equip", v,"Accessory")
      end
    end
  end
})


T3:AddSection({"| Stats 🌡️"})
T3:AddSlider({
  Name = "Up Number",
  Min = 1,
  Max = 1000,
  Increase = 1,
  Default = getgenv().Config["Stats"]["Up Number"] or 1,
  Callback = function(_tG51_Qm9LpX3)
    _G.NumberUp = _tG51_Qm9LpX3
  end
})
T3:AddSection({"| Up 📊"})
T3:AddToggle({
  Name = "Auto Up Strength",
  Default = getgenv().Config["Stats"].Up.Strength or false,
  Callback = function(Strength)
    _G.Strength = Strength
  end
})

T3:AddToggle({
  Name = "Auto Up Defense",
  Default = getgenv().Config["Stats"].Up.Defense or false,
  Callback = function(Defense)
    _G.Defense = Defense
  end
})

T3:AddToggle({
  Name = "Auto Up Weapon",
  Default = getgenv().Config["Stats"].Up.Weapon or false,
  Callback = function(Weapon)
    _G.Weapon = Weapon
  end
})

T3:AddToggle({
  Name = "Auto Up Ability",
  Default = getgenv().Config["Stats"].Up.Ability or false,
  Callback = function(Ability)
    _G.Ability = Ability
  end
})
T4:AddSection({"| Islands 🏝️"})
T4:AddDropdown({
  Name = "Select Island",
  Options = Island,
  Default = "nil",
  Flag = nil,
  Callback = function(x)
  _G.Islands = x
  end
})
T4:AddButton({
  Name = "Teleport Island",
  Callback = function()
    for _, v in pairs(workspace.Islands:GetChildren()) do
      if v:IsA("Model") and v.Name == _G.Islands then
        TP((v:FindFirstChildOfClass("MeshPart") or v:FindFirstChildOfClass("Part")).CFrame * CFrame.new(0, 100, 0))
      end
    end
  end
})
T4:AddSection({"| NPC 🏪"})
T4:AddDropdown({
  Name = "Select NPC",
  Options = NPC,
  Default = "nil",
  Flag = nil,
  Callback = function(i)
  _G.NPC = i
  end
})
T4:AddButton({
  Name = "Teleport NPC",
  Callback = function()
    TP(workspace.NPCs[_G.NPC].HumanoidRootPart.CFrame*CFrame.new(0,10,0))
  end
})
T5:AddSection({"| Settings ⚙️"})
T5:AddSlider({
  Name = "Distance Farm",
  Min = 1,
  Max = 20,
  Increase = 1,
  Default = getgenv().Config["Misc"]["Distance"] or 8,
  Callback = function(_cX81_Lz9QpM2)
    _G.Distance = _cX81_Lz9QpM2
  end
})
T5:AddDropdown({
  Name = "Method Farm",
  Options = {"Upper","Behind","Below"},
  Default = getgenv().Config["Misc"]["Method Farm"] or "Upper",
  Flag = nil,
  Callback = function(_xP91_Lq8Zm42)
    _G.Method = _xP91_Lq8Zm42
  end
})
T5:AddDropdown({
  Name = "Select Weapon",
  Options = {"Style","Ability","Weapon"},
  Default = getgenv().Config["Misc"]["Weapon"] or "Style",
  Flag = nil,
  Callback = function(_dP72_Mq8XnL5)
    _G.Weapon = _dP72_Mq8XnL5
  end
})



task.spawn(function()
  while wait() do 
    pcall(function()
      if _G.Method == "Behind" then
        MethodFarm = CFrame.new(0, 0, _G.Distance)
      elseif _G.Method == "Below" then
        MethodFarm = CFrame.new(0, -_G.Distance, 0) * CFrame.Angles(math.rad(90), 0, 0)
      elseif _G.Method == "Upper" then
        MethodFarm = CFrame.new(0, _G.Distance, 0) * CFrame.Angles(math.rad(-90), 0, 0)
      else
        MethodFarm = CFrame.new(0, _G.Distance, 0) * CFrame.Angles(math.rad(-90), 0, 0)
      end
    end)
  end
end)

task.spawn(function()
  while task.wait(0.5) do
    xpcall(function()
      if _G.AutoFarmLevel then
      local CheckAllLevel = QuestCheck()
      if game:GetService("Players").LocalPlayer.PlayerGui.Display.Quest.Visible == true then
      for _, v in pairs(workspace.Enemies:GetChildren()) do
      if v:IsA("Model") and v.Name == CheckAllLevel.NameMon and v.Humanoid.Health > 1 then
      v.HumanoidRootPart.Size = Vector3.new(10, 20, 10)
      v.HumanoidRootPart.Transparency = 1
      v.Humanoid.WalkSpeed = 0
      v.Humanoid.JumpPower = 0
      repeat task.wait()
        EquipWeapon()
        Attack()
        TP(v.HumanoidRootPart.CFrame*MethodFarm)
      until not _G.AutoFarmLevel or v.Humanoid.Health <= 0
    end
  end
else
  for _, v in pairs(workspace.NPCs:GetChildren()) do
    if v:IsA("Model") and v.Name == CheckAllLevel.NameQuest then
    TP(v.HumanoidRootPart.CFrame*CFrame.new(0,0,-4))
      wait(0.1)
    if game:GetService("Players").LocalPlayer.PlayerGui.Display.Dialogue.Visible == true then
      FireGui(game:GetService("Players").LocalPlayer.PlayerGui.Display.Dialogue.Choice2)
    else
      FireProxim(v)
                end
              break
            end
          end
        end
      end
    end, print)
  end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.AutoChest then
        for _, v in pairs(workspace.Extra.Chests:GetChildren()) do  
          if v:IsA("Part") then  
          firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)  
          firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)  
          end
        end
      end
    end)
  end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.AutoFruit then
        for _, v in pairs(workspace.Extra.Fruits:GetChildren()) do  
          if v:IsA("Tool") then  
          firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)  
          firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)  
          end
        end
      end
    end)
  end
end)
task.spawn(function()
    game:GetService("TextChatService").MessageReceived:Connect(function(message)
        if string.find(message.Text, "%[BOSS%]") then
            if not workspace.Enemies:FindFirstChildWhichIsA("Model") or string.match(workspace.Enemies:FindFirstChildWhichIsA("Model").Name, "%[Level%s%d+%]") then
              if _G.AutoFarmBoss then
                TP(workspace.Islands.Arena.Floor.CFrame)
              end
            end
        end
    end)
    while task.wait() do
      pcall(function()
        if _G.AutoFarmBoss then
          if workspace.Extra.Chests:FindFirstChild("Chest") then
            for _, v in pairs(workspace.Extra.Chests:GetDescendants()) do
            if v:IsA("TextLabel") and v.Text:find(game.Players.LocalPlayer.Name) then
            TP(v.Parent.Parent.CFrame*CFrame.new(0,5,0))
            wait(0.1)
            for _, x in pairs(workspace.Extra.Chests:GetDescendants()) do
                if x:IsA("ProximityPrompt") then
                  fireproximityprompt(x,30)
                  end
                end
              end
            end
            wait(0.1)
            if game:GetService("Players").LocalPlayer.PlayerGui.Chest.List.ScrollingFrame.Visible then
              for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Chest.List.ScrollingFrame:GetChildren()) do
                if v:IsA("ImageButton") then
                  FireGui(v)
                end
              end
            end
          else
            for _, v in pairs(workspace.Enemies:GetChildren()) do
                if v:IsA("Model") and not string.match(v.Name, "%[Level%s%d+%]") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 1 then
                    repeat task.wait()
                        EquipWeapon()
                        Attack()
                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                    until not _G.AutoFarmBoss or v.Humanoid.Health <= 0
                end
              end
            end
        else
            TP(workspace.Islands.Arena.Floor)
            end
        end)
    end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.Strength then
        game:GetService("ReplicatedStorage").Remotes.Functions.Input:InvokeServer("AddPoint", "Strength", _G.NumberUp)
      end
      if _G.Defense then
        game:GetService("ReplicatedStorage").Remotes.Functions.Input:InvokeServer("AddPoint", "Defense", _G.NumberUp)
      end
      if _G.Weapon then
        game:GetService("ReplicatedStorage").Remotes.Functions.Input:InvokeServer("AddPoint", "Weapon", _G.NumberUp)
      end
      if _G.Ability then
        game:GetService("ReplicatedStorage").Remotes.Functions.Input:InvokeServer("AddPoint", "Ability", _G.NumberUp)
      end
    end)
  end
end)

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.AutoFarmLevel or _G.AutoFarmBoss then
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

_G.Weapon = false

if game.PlaceId == 111347281646457 then
    local _gv = getgenv()

    ------[[ Functions ]]------
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

    local function AddDropdown(tab, name, options, default, flag, callback)
        tab:AddDropdown({Name = name, Options = options, Default = default, Flag = flag, Callback = callback})
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

    function TP(cframe, usePrimaryPart)
        pcall(function()
            if usePrimaryPart then
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

    function Up(statType, amount)
        game:GetService("ReplicatedStorage").RemoteEvents.UpPoint:FireServer(statType, amount)
    end

    ------[[ Local Variables ]]------
    local Wsp = game.workspace
    local Ply = game:GetService("Players")
    local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
    local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    
    local Wea = {"Melee", "Sword", "DevilFruit", "Gun"}
    local Method = {"Behind", "Below", "Upper"}
    
    local island = GetN_Child(game.workspace.Map.Island, "Model")
    local SignalTable = GetN_Child(workspace.Map.Sign, "Model")
    local Shop = GetN_Child(game.workspace.Map.Shop, "Model")
    
    local Bosslist = {"King Human", "Gojo Ultimate [Boss]", "Yuji [Boss]", "Asrof [Boss]", "Asta [Boss]", "Ala God [Boss]", "Shanks [Boss]", "Kirito [Boss]", "Zoro[Lv10000000]", "Sukuna [Boss]", "Wang Ling [Boss]", "Gojo [Boss]", "Moodeng [Boss]", "Okarun [Boss]", "AizenV2 [Boss]", "Core", "KJ [Boss]", "Madara [Boss]", "Frieren[Boss]", "Artoria [Boss]", "Mr Bai [Boss]", "Starrk [Boss]", "Yhwach[Boss]", "Mahoraga [Boss]", "Eugeo [Boss]", "Alucard [Boss]"}
    
    local Mon = {}
    for _, v in pairs(workspace.SpawnEnemy:GetChildren()) do
        if v:IsA("Part") then
            table.insert(Mon, v.Name)
        end
    end

    ------[[ UI Library ]]------
    local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
    
    local Window = redzlib:MakeWindow({
        Title = "Rimura Hub : " .. NameMap,
        SubTitle = "Executor : " .. identifyexploit(),
        SaveFolder = "",
    })
    
    Window:AddMinimizeButton({
        Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
        Corner = { CornerRadius = UDim.new(0, 6) },
    })

    -- Tabs
    local T1 = Window:MakeTab({"Discord", "Info"})
    local T2 = Window:MakeTab({"Auto Farm", "Home"})
    local T3 = Window:MakeTab({"Stats", "Signal"})
    local T4 = Window:MakeTab({"Teleport", "Locate"})
    local T5 = Window:MakeTab({"Misc", "Settings"})
    local T6 = Window:MakeTab({"Dungeon", "Gamepad"})

    -- Tab 1: Discord & Info
    T1:AddDiscordInvite({
        Name = "Rimura Hub",
        Logo = "rbxassetid://18751483361",
        Invite = "https://discord.com/invite/Dmg8EJ2neK",
    })

    -- Tab 2: Auto Farm
    T2:AddSection({"| Auto Farm"})
    AddDropdown(T2, "Select Monster", Mon, "nil", "Mon", function(value)
        _gv.SLM = value
    end)
    
    AddDropdown(T2, "Select Boss", Bosslist, "nil", "Bosslist", function(value)
        _gv.seleboss = value
    end)
    
    T2:AddToggle({
        Name = "Farm Mon Select",
        Default = false,
        Callback = function(value)
            _gv.ATF = value
        end
    })
    
    T2:AddToggle({
        Name = "Farm Boss Select",
        Default = false,
        Callback = function(value)
            _gv.FSeleB = value
        end
    })
    
    T2:AddToggle({
        Name = "Farm AllBoss",
        Default = false,
        Callback = function(value)
            _gv.ATFB = value
        end
    })
    
    T2:AddSection({"| Auto Skill"})
    local skills = {"Z", "X", "C", "V", "B"}
    for _, skill in ipairs(skills) do
        T2:AddToggle({
            Name = skill,
            Default = false,
            Callback = function(value)
                _gv[skill] = value
            end
        })
    end

    -- Tab 3: Stats
    T3:AddSection({"| Up Stats"})
    T3:AddSlider({"Up Number", 1, 1000, 1, 1, function(value)
        _gv.UPNUM = value
    end})
    
    local stats = {"Melee", "Defense", "Sword", "DevilFruit", "Gun"}
    for _, stat in ipairs(stats) do
        T3:AddToggle({
            Name = "Up " .. stat,
            Default = false,
            Callback = function(value)
                _gv[stat] = value
                while _gv[stat] do 
                    task.wait()
                    Up(stat, _gv.UPNUM)
                end
            end
        })
    end

    -- Tab 4: Teleport
    T4:AddSection({"| Island"})
    AddDropdown(T4, "Select island", island, "nil", "island", function(value)
        _gv.SLIS = value
    end)
    
    T4:AddButton({"Teleport Island", function()
        for _, v in pairs(workspace.Map.Island:GetChildren()) do
            if v:IsA("Model") and v.Name == _gv.SLIS then
                TP(v.WorldPivot, false)
            end
        end
    end})
    
    T4:AddSection({"| Shop"})
    AddDropdown(T4, "Select Shop", Shop, "nil", "Shop", function(value)
        _gv.SLS = value
    end)
    
    T4:AddButton({"Teleport Shop", function()
        for _, v in pairs(workspace.Map.Shop:GetChildren()) do
            if v:IsA("Model") and v.Name == _gv.SLS then
                TP(v.WorldPivot * CFrame.new(0, 10, 0), false)
            end
        end
    end})
    
    T4:AddSection({"| Sign"})
    AddDropdown(T4, "Select Sign", SignalTable, "nil", "SignalTable", function(value)
        _gv.SLSin = value
    end)
    
    T4:AddButton({"Teleport Sign", function()
        for _, v in pairs(workspace.Map.Sign:GetChildren()) do
            if v:IsA("Model") and v.Name == _gv.SLSin then
                TP(v.WorldPivot * CFrame.new(0, 10, 0), false)
            end
        end
    end})

    -- Tab 5: Misc & Settings
    T5:AddSection({"| Settings"})
    AddDropdown(T5, "Select Weapon", Wea, "nil", "Weapon", function(value)
        _gv.Weapon = value
    end)
    
    AddDropdown(T5, "Select Method", Method, "Upper", "Method", function(value)
        _gv.Method = value
    end)
    
    T5:AddSlider({"Farm Distance", 1, 30, 1, 7, function(value)
        _gv.DistanceMob = value
    end})
    
    T5:AddToggle({
        Name = "White_Screen",
        Default = false,
        Callback = function(value)
            _gv.White_Screen = value
        end
    })
    
    T5:AddToggle({
        Name = "Find Chest",
        Default = true,
        Callback = function(value)
            _gv.gtd = value
        end
    })
    
    T5:AddToggle({
        Name = "auto store item",
        Default = true,
        Callback = function(value)
            _gv.stonitem = value
        end
    })
    
    T5:AddSection({"| Code"})
    T5:AddButton({"Redeem All Code", function()
        for _, v in pairs(game.Players.LocalPlayer.Codes:GetChildren()) do
            if v.Name then
                game:GetService("ReplicatedStorage").RedeemCode:FireServer(v.Name)
            end
        end
    end})

    -- Tab 6: Dungeon
    T6:AddButton({"Teleport Dungeon", function()
        for _, v in pairs(game.Workspace.Map.Portal:GetChildren()) do
            if v:IsA("Part") and v.Name then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
    end})

    ------[[ Farm Functions ]]------
    local function SetupMob(mob)
        if mob:FindFirstChild("HumanoidRootPart") then
            mob.HumanoidRootPart.Size = Vector3.new(10, 30, 10)
            mob.HumanoidRootPart.Transparency = 0.9
            mob.HumanoidRootPart.CanCollide = false
            if mob:FindFirstChild("Head") then
                mob.Head.CanCollide = false
            end
            local humanoid = mob:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
            end
        end
    end

    local function FarmLoop(target, farmFlag)
        local humanoid = target:FindFirstChild("Humanoid")
        local hrp = target:FindFirstChild("HumanoidRootPart")
        
        if hrp and humanoid and humanoid.Health > 0 then
            SetupMob(target)
            
            repeat
                task.wait()
                _Attack()
                
                -- Auto store items
                if _gv.stonitem then  
                    for _, tool in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do  
                        if tool:IsA("Tool") and tool.ToolTip == "" then  
                            for _, equippedTool in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do  
                                if equippedTool:IsA("Tool") and equippedTool.ToolTip ~= "" then  
                                    equippedTool.Parent = game.Players.LocalPlayer.Backpack  
                                end  
                            end  
                        else  
                            EquipTool()  
                        end  
                    end  
                else  
                    EquipTool()  
                end
                
                -- Teleport to target
                if _gv[farmFlag] and humanoid.Health > 1 and hrp then
                    if not _gv.gtd or not workspace.Drop:FindFirstChildOfClass("Part") then
                        TP(hrp.CFrame * MethodFarm, true)
                    end
                end
                
            until not _gv[farmFlag] or humanoid.Health <= 0
        end
    end

    -- Auto Farm Monster
    spawn(function()  
        while true do  
            task.wait()  
            pcall(function()  
                if _gv.ATF and _gv.SLM then
                    local Monster = workspace.SpawnEnemy  
                    local targetMonster = Monster:FindFirstChild(_gv.SLM)
                    
                    if targetMonster then
                        if #targetMonster:GetChildren() == 0 then
                            TP(targetMonster.CFrame, false)
                        else
                            for _, mob in pairs(Monster:GetDescendants()) do
                                if mob.Name == _gv.SLM then
                                    FarmLoop(mob, "ATF")
                                end
                            end
                        end
                    end
                end
            end)
        end 
    end)

    -- Auto Farm All Boss
    spawn(function()
        while true do
            task.wait()
            pcall(function()
                if _gv.ATFB then
                    for _, boss in pairs(workspace.Map["Boss Spawn"]:GetDescendants()) do
                        if boss:IsA("Model") and string.match(boss.Name, "%[.+%]$") then
                            FarmLoop(boss, "ATFB")
                        end
                    end
                end
            end)
        end
    end)

    -- Auto Farm Selected Boss
    spawn(function()
        while true do
            task.wait()
            pcall(function()
                if _gv.FSeleB and _gv.seleboss then
                    local Monster = workspace.Map["Boss Spawn"].Summons
                    for _, boss in pairs(Monster:GetChildren()) do
                        if boss.Name == _gv.seleboss then
                            FarmLoop(boss, "FSeleB")
                        end
                    end
                end
            end)
        end
    end)

    ------[[ Utility Functions ]]------
    -- Auto Store Items
    task.spawn(function()
        while true do
            task.wait()
            pcall(function()
                if _gv.stonitem then
                    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.ToolTip == "" then
                            for _, x in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do  
                                if x:IsA("Tool") and x.ToolTip ~= "" then  
                                    x.Parent = game.Players.LocalPlayer.Backpack  
                                end  
                            end
                            v.Parent = game.Players.LocalPlayer.Character
                            game:GetService("ReplicatedStorage").RemoteFunctions.Inventory:InvokeServer("Add")
                        end
                    end
                end
            end)
        end
    end)

    -- Method Farm Calculation
    task.spawn(function()
        while wait() do 
            pcall(function()
                if _gv.Method == "Behind" then
                    MethodFarm = CFrame.new(0, 0, _gv.DistanceMob)
                elseif _gv.Method == "Below" then
                    MethodFarm = CFrame.new(0, -_gv.DistanceMob, 0) * CFrame.Angles(math.rad(90), 0, 0)
                elseif _gv.Method == "Upper" then
                    MethodFarm = CFrame.new(0, _gv.DistanceMob, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                else
                    MethodFarm = CFrame.new(0, _gv.DistanceMob, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                end
            end)
        end
    end)

    -- White Screen
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

    -- Auto Skills
    local skillKeys = {Z = 122, X = 120, C = 99, V = 118, B = 98}
    for skillName, keyCode in pairs(skillKeys) do
        spawn(function()
            while true do
                task.wait()
                pcall(function()
                    if _gv[skillName] then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, keyCode, false, game)
                    end
                end)
            end
        end)
    end

    -- Find Chest
    spawn(function()
        while task.wait() do
            pcall(function()
                if _gv.gtd then
                    local chest = workspace.Drop:FindFirstChildOfClass("Part")
                    if chest then
                        TP(chest.CFrame, false)
                        for _, item in ipairs(workspace.Drop:GetChildren()) do
                            if item:IsA("Part") then
                                TP(item.CFrame, false)
                                task.wait()
                                local prompt = item:FindFirstChildOfClass("ProximityPrompt")
                                if prompt then
                                    fpp(prompt)
                                end
                                task.wait()
                            end
                        end
                    end
                end
            end)
        end
    end)

    -- NoClip
    spawn(function()
        game:GetService("RunService").Stepped:Connect(function()
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                if _gv.ATF or _gv.ATFB or _gv.FSeleB then
                    if not hrp:FindFirstChild("BodyClip") then
                        local noclip = Instance.new("BodyVelocity")
                        noclip.Name = "BodyClip"
                        noclip.Parent = hrp
                        noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                        noclip.Velocity = Vector3.new(0, 0, 0)
                    end
                else
                    if hrp:FindFirstChild("BodyClip") then
                        hrp.BodyClip:Destroy()
                    end
                end
            end
        end)
    end)

    ------ [[ Premium Features ]] ------
    local PNAME = {"fly2Fluke", "godttdiop", "losse100"}
    if table.find(PNAME, game.Players.LocalPlayer.Name) then
        if game.Players.LocalPlayer.Name == "fly2Fluke" then
            sendNotification("RimuruHub", "you is own!", 1)
        else
            sendNotification("Rimuru Hub", "you have premium!", 1)
        end

        local T6 = Window:MakeTab({"Premium", "Diamond"})
        
        T6:AddSection({"| Auto Farm"})
        T6:AddTextBox({
            Name = "Get Gem/Exp/Money Count",
            Description = "1 = 100Gem", 
            PlaceholderText = "",
            Callback = function(Value)
                _gv.countgem = Value
            end
        })
        
        T6:AddToggle({
            Name = "Farm Gem/Exp/Money",
            Default = false,
            Callback = function(value)
                _gv.PAFGEM = value
            end
        })
        
        T6:AddButton({"Click to get Gem/Exp/Money", function()
            TP(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.HumanoidRootPart.CFrame, false)
            local count = _gv.countgem or 1
            for i = 1, count do
                fireproximityprompt(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.ProximityPrompt)
            end
        end})
        
        T6:AddToggle({
            Name = "Farm Bounty",
            Default = false,
            Callback = function(value)
                _gv.BPK = value
            end
        })

        -- Premium Auto Farms
        spawn(function()
            while task.wait(0) do
                pcall(function()
                    if _gv.PAFGEM then
                        TP(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.HumanoidRootPart.CFrame, false)
                        fireproximityprompt(workspace.Map["Free Rewerds and EasterEgg"].M1Q9_M1Q9.ProximityPrompt)
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait(0) do
                pcall(function()
                    if _gv.BPK then
                        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                            if player and player.Character and player ~= game.Players.LocalPlayer and player.Character:FindFirstChild("HumanoidRootPart") then
                                local hrp = player.Character.HumanoidRootPart
                                hrp.Anchored = true
                                hrp.CanCollide = false
                                hrp.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3.5)
                                
                                if sethiddenproperty then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                                
                                _Attack()
                            end
                        end
                    end
                end)
            end
        end)

        -- Bounty UI
        T6:AddButton({"Stats Bounty", function()
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Bounty ui") then
                game.Players.LocalPlayer.PlayerGui:FindFirstChild("Bounty ui"):Destroy()
            end
            
            local player = game.Players.LocalPlayer
            local leaderstats = player:WaitForChild("leaderstats")
            local bounty = leaderstats:WaitForChild("Bounty")
            
            local screenGui = Instance.new("ScreenGui")
            screenGui.Parent = player:WaitForChild("PlayerGui")
            screenGui.Name = "Bounty ui"
            screenGui.Enabled = true
            screenGui.ResetOnSpawn = false
            
            local labels = {}
            local labelNames = {"previousValue", "addedValue", "BountyValue"}
            local labelTexts = {"ค่าหัวเดิม:", "ค่าหัวที่เพื่ม:", "ค่าหัวทั้งหมด:"}
            
            for i, name in ipairs(labelNames) do
                local label = Instance.new("TextLabel")
                label.Parent = screenGui
                label.Name = name
                label.Size = UDim2.new(0, 200, 0, 50)
                label.Position = UDim2.new(0.1, 0, 0.1 + (i-1)*0.1, 0)
                label.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
                label.TextColor3 = Color3.new(1, 1, 1)
                label.TextScaled = true
                labels[name] = label
            end
            
            local previousValue = bounty.Value
            local addedValue = 0
            
            local function updateTextLabels()
                labels.previousValue.Text = labelTexts[1] .. tostring(previousValue)
                labels.addedValue.Text = labelTexts[2] .. tostring(addedValue)
                labels.BountyValue.Text = labelTexts[3] .. tostring(bounty.Value)
            end
            
            bounty:GetPropertyChangedSignal("Value"):Connect(function()
                addedValue = bounty.Value - previousValue
                previousValue = bounty.Value
                updateTextLabels()
            end)
            
            updateTextLabels()
        end})
        
        T6:AddButton({"Destroy Stats Bounty", function()
            local bountyUI = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Bounty ui")
            if bountyUI then
                bountyUI:Destroy()
            end
        end})
    end

elseif game.PlaceId == 76091669089883 then
    local _gv = getgenv()

    ------[[ Functions ]]------
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

    local function AddDropdown(tab, name, options, default, flag, callback)
        tab:AddDropdown({Name = name, Options = options, Default = default, Flag = flag, Callback = callback})
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

    function TP(cframe, usePrimaryPart)
        pcall(function()
            if usePrimaryPart then
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

    function identifyexploit()
        local ieSuccess, ieResult = pcall(identifyexecutor)
        if ieSuccess then return ieResult end
        return (SENTINEL_LOADED and "Sentinel") or (XPROTECT and "SirHurt") or (PROTOSMASHER_LOADED and "Protosmasher") or "Unknown"
    end

    ------[[ Local Variables ]]------
    local Wsp = game.workspace
    local Ply = game:GetService("Players")
    local ChaPly = Ply.LocalPlayer.Character or Ply.LocalPlayer.CharacterAdded:Wait()
    local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    
    local Wea = {"Melee", "Sword", "DevilFruit", "Gun"}
    local Method = {"Behind", "Below", "Upper"}

    ------[[ UI Library ]]------
    local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()
    
    local Window = redzlib:MakeWindow({
        Title = "Rimura Hub : " .. NameMap,
        SubTitle = "Executor : " .. identifyexploit(),
        SaveFolder = "",
    })
    
    Window:AddMinimizeButton({
        Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
        Corner = { CornerRadius = UDim.new(0, 6) },
    })

    -- Tabs
    local T1 = Window:MakeTab({"Discord", "Info"})
    local T6 = Window:MakeTab({"Dungeon", "Gamepad"})
    local T5 = Window:MakeTab({"Misc", "Settings"})

    -- Tab 1: Discord & Info
    T1:AddDiscordInvite({
        Name = "Rimura Hub",
        Logo = "rbxassetid://18751483361",
        Invite = "https://discord.com/invite/Dmg8EJ2neK",
    })

    -- Tab 6: Dungeon
    T6:AddSection({"| Dungeon"})
    T6:AddToggle({
        Name = "Farm Mob",
        Default = false,
        Callback = function(value)
            _gv.AFD = value
        end
    })
    
    T6:AddButton({"Hop Dungeon", function()
        game:GetService("TeleportService"):Teleport(76091669089883)
    end})
    
    T6:AddSection({"| Auto Skill"})
    local skills = {"Z", "X", "C", "V", "B"}
    for _, skill in ipairs(skills) do
        T6:AddToggle({
            Name = skill,
            Default = false,
            Callback = function(value)
                _gv[skill] = value
            end
        })
    end

    -- Tab 5: Misc & Settings
    T5:AddSection({"| Settings"})
    AddDropdown(T5, "Select Weapon", Wea, "nil", "Weapon", function(value)
        _gv.Weapon = value
    end)
    
    AddDropdown(T5, "Select Method", Method, "Upper", "Method", function(value)
        _gv.Method = value
    end)
    
    T5:AddSlider({"Farm Distance", 1, 30, 1, 7, function(value)
        _gv.DistanceMob = value
    end})
    
    T5:AddToggle({
        Name = "White_Screen",
        Default = false,
        Callback = function(value)
            _gv.White_Screen = value
        end
    })
    
    T5:AddToggle({
        Name = "Auto Store Item",
        Default = true,
        Callback = function(value)
            _gv.stonitem = value
        end
    })
    --[[]
    T5:AddToggle({
        Name = "Bring Mob",
        Default = true,
        Callback = function(value)
            _gv.Bmdnakub = value
        end
    })]]

    ------[[ Farm Functions ]]------
    local function SetupMob(mob)
        if mob:FindFirstChild("HumanoidRootPart") then
            mob.HumanoidRootPart.Size = Vector3.new(10, 30, 10)
            mob.HumanoidRootPart.Transparency = 0.9
            mob.HumanoidRootPart.CanCollide = false
            if mob:FindFirstChild("Head") then
                mob.Head.CanCollide = false
            end
            local humanoid = mob:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
            end
        end
    end

    local function FarmLoop(target, farmFlag)
        local humanoid = target:FindFirstChild("Humanoid")
        local hrp = target:FindFirstChild("HumanoidRootPart")
        
        if hrp and humanoid and humanoid.Health > 0 then
            SetupMob(target)
            
            repeat
                task.wait()
                _Attack()
                
                -- Auto store items
                if _gv.stonitem then  
                    for _, tool in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do  
                        if tool:IsA("Tool") and tool.ToolTip == "" then  
                            for _, equippedTool in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do  
                                if equippedTool:IsA("Tool") and equippedTool.ToolTip ~= "" then  
                                    equippedTool.Parent = game.Players.LocalPlayer.Backpack  
                                end  
                            end  
                        else  
                            EquipTool()  
                        end  
                    end  
                else  
                    EquipTool()  
                end
                
                -- Teleport to target
                if _gv[farmFlag] and humanoid.Health > 1 and hrp then
                    TP(hrp.CFrame * MethodFarm, true)
                end
                
            until not _gv[farmFlag] or humanoid.Health <= 0
        end
    end

    -- Auto Farm Dungeon
    spawn(function()
        while true do
            task.wait()
            pcall(function()
                if _gv.AFD then
                    for _, mob in pairs(workspace.Wave_Folders.Npcs:GetChildren()) do
                        if mob.Name then
                            FarmLoop(mob, "AFD")
                        end
                    end
                end
            end)
        end
    end)

    ------[[ Utility Functions ]]------
    -- Auto Store Items
    task.spawn(function()
        while true do
            task.wait()
            pcall(function()
                if _gv.stonitem then
                    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.ToolTip == "" then
                            for _, x in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do  
                                if x:IsA("Tool") and x.ToolTip ~= "" then  
                                    x.Parent = game.Players.LocalPlayer.Backpack  
                                end  
                            end
                            v.Parent = game.Players.LocalPlayer.Character
                            game:GetService("ReplicatedStorage").RemoteFunctions.Inventory:InvokeServer("Add")
                        end
                    end
                end
            end)
        end
    end)

    -- Method Farm Calculation
    task.spawn(function()
        while wait() do 
            pcall(function()
                if _gv.Method == "Behind" then
                    MethodFarm = CFrame.new(0, 0, _gv.DistanceMob)
                elseif _gv.Method == "Below" then
                    MethodFarm = CFrame.new(0, -_gv.DistanceMob, 0) * CFrame.Angles(math.rad(90), 0, 0)
                elseif _gv.Method == "Upper" then
                    MethodFarm = CFrame.new(0, _gv.DistanceMob, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                else
                    MethodFarm = CFrame.new(0, _gv.DistanceMob, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                end
            end)
        end
    end)

    -- White Screen
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

    -- Auto Skills
    local skillKeys = {Z = 122, X = 120, C = 99, V = 118, B = 98}
    for skillName, keyCode in pairs(skillKeys) do
        spawn(function()
            while true do
                task.wait()
                pcall(function()
                    if _gv[skillName] then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, keyCode, false, game)
                    end
                end)
            end
        end)
    end

    -- Bring Mob
    --[[]
    spawn(function()
        while true do
            task.wait()
            pcall(function()
                if _gv.Bmdnakub then
                    local monsterFolder = workspace:WaitForChild("Wave_Folders"):WaitForChild("Npcs")
                    if sethiddenproperty then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                    for _, mob in pairs(monsterFolder:GetChildren()) do
                        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                            mob.HumanoidRootPart.CFrame = CFrame.new(1402, 1684, -1)
                            mob.HumanoidRootPart.CanCollide = false
                        end
                    end
                end
            end)
        end
    end)]]

    -- NoClip
    spawn(function()
        game:GetService("RunService").Stepped:Connect(function()
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                if _gv.AFD then
                    if not hrp:FindFirstChild("BodyClip") then
                        local noclip = Instance.new("BodyVelocity")
                        noclip.Name = "BodyClip"
                        noclip.Parent = hrp
                        noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                        noclip.Velocity = Vector3.new(0, 0, 0)
                    end
                else
                    if hrp:FindFirstChild("BodyClip") then
                        hrp.BodyClip:Destroy()
                    end
                end
            end
        end)
    end)

end

-- 310/980 เลขหวยถ้าเอาไปซื้อแล้วถูกแบ่งผมด้วย

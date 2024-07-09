redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Sword Piece",
  SubTitle = "English by Google Translate",
  SaveFolder = "testando | redz lib v5.lua"
})

local Tab1 = Window:MakeTab({"Auto Farm - ออโต้ฟาม", "swords"})
local Tab2 = Window:MakeTab({"Teleport - วาป", "swords"})
local Tab3 = Window:MakeTab({"other - อื่นๆ", "swords"})
local Tab4 = Window:MakeTab({"summonweapon - เสกอาวุธ", "swords"})


redzlib:SetTheme("Dark")


local Section = Tab1:AddSection({"Select Weapon - เลือกอาวุธ"})

local Weaponlist = {}
local Weapon = nil

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weaponlist,v.Name)
end

local Dropdown = Tab1:AddDropdown({
  Name = "Select Weapon",
  Description = "เลือกอาวุธ",
  Options = Weaponlist,
  Default = nil,
  Flag = "dropdown teste",
  Callback = function(B)
     Weapon = B
  end
})

local Button = Tab2:AddButton({"RefreshWeaponlist", "รีเฟรชอาวุธ", function()
    drop:Refresh(Weaponlist)
   end})
  

local Toggle1 = Tab1:AddToggle({
  Name = "Auto Equip",
  Description = "ออโต้ถือ",
  Default = false,
  Callback = function(GG)
  AutoEquiped = GG
  end
})


spawn(function()
while wait() do
if AutoEquiped then
pcall(function()
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))
end)
end
end
end)



local Section = Tab1:AddSection({"Auto Farm[bug] - ออโต้ฟาม[บัค]"})



local Mob = {}

for i, v in pairs(game:GetService("Workspace").Mob: GetChildren()) do
    table.insert(Mob, v.Name)
end

local Dropdown = Tab1:AddDropdown({
  Name = "Select Mob",
  Description = "เลือกมอน",
  Options = Mob,
  Default = nil,
  Flag = "dropdown teste",
  Callback = function(Value)
    MonFarm = Value
  end
})

local Toggle1 = Tab1:AddToggle({
  Name = "Auto Farm",
  Description = "ออโต้ฟาม",
  Default = false,
  Callback = function(Hee)
  _G.a = Hee
  end
})

function A()
  game:GetService'VirtualUser':CaptureController()
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end



spawn(function()
    while wait() do
        pcall(function()
            if _G.a then
                for i, v in pairs(game:GetService("Workspace").Mob:GetDescendants()) do
                    if v.Name == MonFarm and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health >= 1 then
                        repeat
                           A()
                            wait()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                        until _G.a == false or v.Humanoid.Health <= 0
                    end
                end
            end
        end)
    end
end)

local Section = Tab2:AddSection({
	Name = "TeleportPlayer- วาปไปหาผู้เล่น:"
})

local plrs = game.Players

-- Fetch all player names
local playerNames = {}
local players = plrs:GetPlayers()

for _, player in ipairs(players) do
    table.insert(playerNames, player.Name)
end

Tab2:AddDropdown({
    Name = "Players",
    Default = playerNames[1] or "No Players",
    Options = playerNames,
    Callback = function(selectedplrName)
        local targetPlayer = plrs:FindFirstChild(selectedplrName)
        
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            -- Teleporting your character to the selected player's position
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local localPlayerRoot = plrs.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if localPlayerRoot then
                localPlayerRoot.CFrame = CFrame.new(targetPosition)
            end
        end
        print(selectedplrName)
    end    
})

local Button = Tab2:AddButton({"RefreshPlayer[bug]", "รีเฟรชเพลเยอร์[บัค]", function()
    drop:Refresh(Plr)
   end})

local Section = Tab2:AddSection({"Teleport - วาป"})

Tab2:AddButton({"Alone_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-448.27337646484375, 66.60079193115234, 82.97445678710938)
end})

Tab2:AddButton({"Starter_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130.31344604492188, 20.529998779296875, 369.0207824707031)
end})

Tab2:AddButton({"Noob_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( -347.5494384765625, 20.94811248779297, 883.9833374023438)
end})

Tab2:AddButton({"Marine_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(309.8626403808594, 20.358110427856445, -199.6346893310547)
end})

Tab2:AddButton({"Baboon_Islan", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-731.5245361328125, 20.358110427856445, -274.16937255859375)
end})

Tab2:AddButton({"Skyisland", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-79.29106903076172, 87.0345458984375, -543.7308349609375)
end})

Tab2:AddButton({"Arlong_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-791.1946411132812, 28.551923751831055, 476.9998474121094)
end})

local Section = Tab2:AddSection({"Teleport 2 - วาป2"})

Tab2:AddButton({"Marineford_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(716.3748168945312, 12.088098526000977, -1025.708251953125)
end})

Tab2:AddButton({"Wano_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(653.5064086914062, 16.33466148376465, 1371.4091796875)
end})

Tab2:AddButton({"Vonalco_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1360.1378173828125, 25.64848518371582, -53.375732421875)
end})

Tab2:AddButton({"Candy_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-558.9735717773438, 13.736052513122559, -1118.565185546875)
end})

Tab2:AddButton({"Snow_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-752.9354858398438, 22.753276824951172, 1485.57421875)
end})

local Section = Tab2:AddSection({"TeleportRoom - วาปห้อง"})

Tab2:AddButton({"Shank_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(580.7437133789062, 62.638710021972656, 392.1752014160156)
end})

Tab2:AddButton({"Light_Island[safe zone]", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(952.4696655273438, 21.544837951660156, 662.9339599609375)
end})

Tab2:AddButton({"BlackPink", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-709.4248046875, 49441.72265625, -1197.458251953125)
end})

Tab2:AddButton({"SeaKing_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1472.300048828125, 105.96843719482422, 1341.03955078125)
end})

Tab2:AddButton({"SeaKing_Island2", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1441.73583984375, 21.603845596313477, 1327.4365234375)
end})

local Section= Tab3:AddSection({"color ui - เปลี่ยนสียูไอ"})

Tab3:AddButton({"Dark Theme", function()
  redzlib:SetTheme("Dark")
end})

Tab3:AddButton({"Darker Theme", function()
  redzlib:SetTheme("Darker")
end})

Tab3:AddButton({"Dark Purple", function()
  redzlib:SetTheme("Purple")
end})


local Section = Tab3:AddSection({"Tool"})

Tab3:AddButton({"CopyCframe", function()
setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
end})

local Section = Tab3:AddSection({"shade"})

Tab3:AddButton({"shade gui", function()
getgenv().RTX_Name = "rtxnamehere" 
loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()
end})

local Section= Tab3:AddSection({"script"})

Tab3:AddButton({"infiniteyield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end})

Tab3:AddButton({"SimpleSpy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end})

Tab3:AddButton({"Fly", function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end})


local Section= Tab4:AddSection({"Summon Melee and swords auto-update - เสกหมัดและดาบออโต้อัพเดท"})

local Section= Tab4:AddSection({"Summon sword - เสกดาบ"})

local Weaponlist = {}

for i, v in pairs(game.Players.LocalPlayer.InventoryList:GetChildren()) do
    table.insert(Weaponlist, v.Name)
end

local Dropdown = Tab4:AddDropdown({
    Name = "Select Weapon",
    Description = "เลือกอาวุธ",
    Options = Weaponlist,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(selectedOption)
        local args = {
            [1] = selectedOption
        }

        game.ReplicatedStorage.Remotes.Inventory:FireServer(unpack(args))
    end
})

local Section= Tab4:AddSection({"Summon Melee - เสกหมัด"})

local Weaponlist = {}

for i, v in pairs(game.Players.LocalPlayer.InventoryListMelee:GetChildren()) do
    table.insert(Weaponlist, v.Name)
end

local Dropdown = Tab4:AddDropdown({
    Name = "Select Weapon",
    Description = "เลือกอาวุธ",
    Options = Weaponlist,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(selectedOption)
        local args = {
            [1] = selectedOption
        }

        game.ReplicatedStorage.Remotes.InventoryM:FireServer(unpack(args))
    end
})





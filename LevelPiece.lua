local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Redz-Ui/refs/heads/main/Ui.lua"))()

local Window = redzlib:MakeWindow({
  Title = "Fluke Hub : Level Piece",
  SubTitle = "by : FlukeHub",
  SaveFolder = "testando | fluke lib v5.lua"
})
local Tab1 = Window:MakeTab({"Auto Farm", "swords"})
local Tab2 = Window:MakeTab({"Spin", "swords"})


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



local Section = Tab1:AddSection({"Auto Farm - ออโต้ฟาม"})


local Mon = {
    "Bandit",
    "Marine",
    "Bunny",
    "Fishman",
    "UnknownMonster",
    "SkyGuard",
    "SkyElite",
    "Hollow",
    "DesertBandit",
    "ClownBandit",
    "Monkey",
    "RainGuard",
    "FakeYeti"
}

local Dropdown = Tab1:AddDropdown({
  Name = "Select Mon",
  Description = "เลือกมอน",
  Options = Mon,
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
                for i, v in pairs(game:GetService("Workspace").Mon:GetDescendants()) do
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



local Section = Tab2:AddSection({"Code - โค้ด"})

Tab2:AddButton({
  Name = "Redeem All Code",
  Callback = function()
  for _, v in pairs(game:GetService("Players").LocalPlayer.CodesFolder:GetChildren()) do
    local args = {
        [1] = v.Name
    }
    game:GetService("ReplicatedStorage").CodesRemotes.CodeRedeemed:FireServer(unpack(args))
    end
  end
})

local Section = Tab2:AddSection({"Buy Spin - ซื้อSpin"})

local Gem = {
"1000 GEM FOR 5 SPIN",
"5000 GEM FOR 25 SPIN",
"10000 GEM FOR 55 SPIN"
}

local Dropdown = Tab2:AddDropdown({
  Name = "Select Buy Spin",
  Description = "เลือกจำนวน Spin ที่จะซื้อ",
  Options = Gem,
  Default = nil,
  Flag = "dropdown teste",
  Callback = function(D)
     GE = D
  end
})



spawn(function()
  while wait() do
    pcall(function()
      if _G.B then
        local player = game.Players.LocalPlayer
        local spinGui = player.PlayerGui:WaitForChild("Menu"):WaitForChild("SpinGui")
        local frame = spinGui:WaitForChild("Frame")
        local listGem = frame:WaitForChild("ListGem")
        local gemButton
        if GE == "1000 GEM FOR 5 SPIN" then
          gemButton = listGem:WaitForChild("1000GEM")
        elseif GE == "5000 GEM FOR 25 SPIN" then
          gemButton = listGem:WaitForChild("5000GEM")
        elseif GE == "10000 GEM FOR 55 SPIN" then
          gemButton = listGem:WaitForChild("10000GEM")
        end
        if gemButton then
          local fire = gemButton:WaitForChild("Active"):WaitForChild("Fire")
          fire:FireServer()
        end
      end
    end)
  end
end)



local Toggle1 = Tab2:AddToggle({
  Name = "Auto Buy",
  Description = "ออโต้ซื้อ",
  Default = false,
  Callback = function(kuy)
  _G.B = kuy
  end
})



local Section = Tab2:AddSection({"Random - สุ่ม"})

local Spin = {
  "VenomDagger",
  "6000 Gem",
  "2000 Soul",
  "GreenOrb",
  "Blindfold",
  "Halo",
  "RedKey",
  "SeabeastSeythe",
  "SeabeastSword",
  "50 Gem",
  "10 Soul"
}

local SP
local Dropdown = Tab2:AddDropdown({
  Name = "เลือกของ Spin",
  Description = "เลือกของ Spin ที่จะให้สุ่ม",
  Options = Spin,
  Default = nil,
  Flag = "dropdown teste",
  Callback = function(jo)
     SP = jo
  end
})

local Toggle1 = Tab2:AddToggle({
  Name = "ออโต้ Spin",
  Description = "ออโต้ spin",
  Default = false,
  Callback = function(uy)
    _G.MM = uy
    while _G.MM do 
      wait()
      if SP then
        for i = 1, 100 do
          local args = {
            [1] = SP
          }
          game:GetService("ReplicatedStorage").RemoteEvents.SetSpin:FireServer(unpack(args))
        end
      else
        print("ยังไม่ได้เลือก Spin option")
      end
    end
  end
})

--[[

local Section = Tab3:AddSection({"Gui"})

Tab3:AddButton({
  Name = "door gui[เทเลพอร์ตของผลประตู]",
    Callback = function()
  for _, v in pairs(game:GetService("Players").LocalPlayer.Character.Door:FindFirstChild()) do
  local args = {
    [1] = game:GetService("Players").LocalPlayer
}

game:GetService("Players").LocalPlayer.Character.Door:FindFirstChild("SKILL V [Warp]").RemoteEvent:FireServer(unpack(args))

    end
  end
})]]

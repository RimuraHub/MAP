local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ScreenGui1 = Instance.new("ScreenGui")
ScreenGui1.Name = "ButtonGui"
ScreenGui1.Parent = CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local TextButton1 = Instance.new("TextButton")
TextButton1.Parent = ScreenGui1
TextButton1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
TextButton1.Size = UDim2.new(0, 50, 0, 50)
TextButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
TextButton1.BackgroundTransparency = 0.5
TextButton1.Text = ""

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = TextButton1

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = TextButton1
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 2

local Sound1 = Instance.new("Sound")
Sound1.Parent = TextButton1
Sound1.SoundId = "rbxassetid://12221967"
Sound1.Volume = 1

local isOn = false
TextButton1.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        TextButton1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        TextButton1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
    Sound1:Play()
    wait(0.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game)
end)

local Window = Fluent:CreateWindow({
    Title = "Rimuru Hub : "..NameMap,
    TabWidth = 100,
    Size = UDim2.fromOffset(450, 370),
    Acrylic = false,
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tab = {
Ra1 = Window:AddTab({ Title = "| ฟามเงิน", Icon = "home" }),
Ra2 = Window:AddTab({ Title = "| สุ่มของ", Icon = "home" })
}


local Toggle = Tab.Ra1:AddToggle("MyToggle",{
  Title = "ออโต้ ปล้นทอง",
  Description = ">>> ถ้าโดนจับจะเป็นการปั้มทอง <<<",
  Default = false,
  Callback = function(a)
    _G.A1 = a
  end
})
local Toggle = Tab.Ra1:AddToggle("MyToggle",{
  Title = "ออโต้ ขายทอง",
  Default = false,
  Callback = function(s)
    _G.A2 = s
  end
})


local Dropdown = Tab.Ra2:AddDropdown("Dropdown", {
  Title = "เลือกตู้ ที่จะสุ่ม",
  Values = {"ตู้แดง","ตู้ม่วง","ตู้ฟ้า"},
  Multi = false,
  Default = "ยังไม่ได้เลือก",
  Callback = function(He)
    _G.SelectBox = He
  end
})
local Toggle = Tab.Ra2:AddToggle("MyToggle",{
  Title = "ออโต้ สุ่ม",
  Default = false,
  Callback = function(KK)
    _G.Ran = KK
  end
})

spawn(function()
  while wait(0.5) do
    pcall(function()
      if _G.Ran then
        if _G.SelectBox == "ตู้แดง" then
game:GetService("ReplicatedStorage").GachaFolder.SpinnerContents.RemoteFunction:InvokeServer()
        elseif _G.SelectBox == "ตู้ม่วง" then
game:GetService("ReplicatedStorage").GachaFolder.SpinnerContents2.RemoteFunction:InvokeServer()
        elseif _G.SelectBox == "ตู้ฟ้า" then
game:GetService("ReplicatedStorage").GachaFolder.SpinnerContents3.RemoteFunction:InvokeServer()
        end
      end
    end)
  end
end)

------[[[ spawn function ]]]------
task.spawn(function()
  while task.wait() do
    pcall(function()
      if _G.A1 then
        for _, v in ipairs(workspace.ModelFolder:GetChildren()) do
          if v:FindFirstChild("RobPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("RobPart").CFrame
            fireproximityprompt(v:FindFirstChild("RobPart").ProximityPrompt)
            break
          end
        end
      end
    end)
  end
end)

spawn(function()
  while wait() do
    pcall(function()
      if _G.A2 then
        game:GetService("ReplicatedStorage").GLOBAL_VALUES.ConfigrationFolder.GlobalEvent:FireServer("Sell","Gold")
      end
    end)
  end
end)

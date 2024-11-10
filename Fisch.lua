-- สร้าง ScreenGui สำหรับ UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- สร้าง TextLabel สำหรับข้อความ
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Text = "ผมไม่ทำแมพนี้เล่นค่ายอื่นไปมีให้2ค่าย(ไม่มีคีย์)"
textLabel.Size = UDim2.new(0, 300, 0, 100)
textLabel.Position = UDim2.new(0.5, -150, 0.4, 0)
textLabel.TextSize = 24
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.BackgroundTransparency = 0.5

-- สร้างปุ่มที่หนึ่ง
local button1 = Instance.new("TextButton")
button1.Parent = screenGui
button1.Text = "Speed X Hub"
button1.Size = UDim2.new(0, 100, 0, 50)
button1.Position = UDim2.new(0.4, -50, 0.6, 0)
button1.TextSize = 20
button1.TextColor3 = Color3.new(1, 1, 1)
button1.BackgroundColor3 = Color3.new(0, 0, 1)
button1.BackgroundTransparency = 0.3

-- เมื่อกดปุ่ม 1 ปรินต์ 1
button1.MouseButton1Click:Connect(function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Fisch.lua"))()
end)

-- สร้างปุ่มที่สอง
local button2 = Instance.new("TextButton")
button2.Parent = screenGui
button2.Text = "space hub"
button2.Size = UDim2.new(0, 100, 0, 50)
button2.Position = UDim2.new(0.6, -50, 0.6, 0)
button2.TextSize = 20
button2.TextColor3 = Color3.new(1, 1, 1)
button2.BackgroundColor3 = Color3.new(1, 0, 0)
button2.BackgroundTransparency = 0.3

-- เมื่อกดปุ่ม 2 ปรินต์ 2
button2.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://you.whimper.xyz/sources/rb/fisch.lua"))()
end)

-- สร้างปุ่มที่สามสำหรับทำลาย UI
local closeButton = Instance.new("TextButton")
closeButton.Parent = screenGui
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 100, 0, 50)
closeButton.Position = UDim2.new(0.5, -50, 0.8, 0)
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
closeButton.BackgroundTransparency = 0.3

-- เมื่อกดปุ่มปิด UI ทำลาย ScreenGui
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

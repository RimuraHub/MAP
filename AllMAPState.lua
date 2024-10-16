local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

-- ตั้งค่า ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- ตั้งค่า Frame
Frame.Size = UDim2.new(0.5, 0, 0.6, 0)
Frame.Position = UDim2.new(0.25, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.new(0, 0, 0) -- พื้นหลังสีดำ
Frame.BorderSizePixel = 5 -- ความหนาของขอบ
Frame.BorderColor3 = Color3.new(0.5, 0, 1) -- ขอบสีม่วง
Frame.Parent = ScreenGui

-- ตั้งค่า UICorner เพื่อให้มุมโค้ง
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20) -- ตั้งค่ามุมโค้ง
UICorner.Parent = Frame

-- ตั้งค่า TextLabel
TextLabel.Size = UDim2.new(1, 0, 1, 0) -- ขยาย TextLabel ให้ครอบคลุมพื้นที่ของ Frame
TextLabel.Position = UDim2.new(0, 0, 0, 0) -- ตั้งตำแหน่งที่มุมซ้ายบนของ Frame
TextLabel.BackgroundTransparency = 1 -- ทำให้ไม่มีพื้นหลัง
TextLabel.TextColor3 = Color3.new(1, 1, 1) -- ตั้งค่าสีของข้อความเป็นสีขาว
TextLabel.Font = Enum.Font.SourceSans -- ตั้งค่าฟอนต์
TextLabel.TextScaled = true -- เปิดการสเกลข้อความ
TextLabel.TextWrapped = true -- ให้ข้อความแสดงหลายบรรทัด
TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- จัดข้อความให้ชิดซ้าย
TextLabel.TextYAlignment = Enum.TextYAlignment.Top -- จัดข้อความให้ชิดด้านบน
TextLabel.Text = [[
>>>------------------------<<<
🔥 | อัพเดทต่อเนื่อง | Continuous Update
🟢 | ใช้งานได้ปกติ | Can be used normally
🟡 | กำลังอัปเดต | Wait For Update
🔵 | เวอร์ชั่นเทส | Test version
🟠 | กำลังทำ | Under Development
🔴 | หยุดอัพเดท | Stop updating
>>>------------------------<<<
• เวอร์ชั่นเทสจะสามารถใช้งานได้แต่อาจจะมีบัคและฟังก์ชั่นไม่ครบ
• The test version will be usable but may have bugs and incomplete functions.
>>>------------------------<<<
[🟢] : Sword Piece  
[🟢] : Sakura Piece  
[🔴] : Second Piece  
[🟢] : Meme Sea  
[🟢] : XDAX Piece  
[🔵] : Condl Piece  
[🟢] : Ijul Piece 2  
[🟢] : Royal Sea  
[🔵] : Rock Fruit  
[🟢] : Cool Obby  
[🟢] : Ijul Piece  
[🟢] : G piece  
[🟢] : Rung Sea  
[🟢] : jood piece 2  
[🟢] : Muyong Piece
[🟢] : CeeTo Fruit  
[🟢] : City BanNa  
[🔵] : Verse Piece
[🟢] : Obito Piece
[🟢] : Soy Piece
>>>------------------------<<<
]]
TextLabel.Parent = Frame

-- ตั้งค่า CloseButton
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Text = "X"
CloseButton.TextScaled = true
CloseButton.Parent = Frame

-- ฟังก์ชันปิดเมื่อคลิกปุ่ม
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ฟังก์ชันลาก Frame
local dragging
local dragInput
local startPos
local startFramePos

local function update(input)
    local delta = input.Position - startPos
    Frame.Position = UDim2.new(
        startFramePos.X.Scale, startFramePos.X.Offset + delta.X,
        startFramePos.Y.Scale, startFramePos.Y.Offset + delta.Y
    )
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        startPos = input.Position
        startFramePos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local ButtonCorner = Instance.new("UICorner")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
Frame.Parent = ScreenGui
TextLabel.Parent = Frame
CloseButton.Parent = Frame

Frame.Size = UDim2.new(0.5, 0, 0.55, 0)  -- Adjust size to be more compact
Frame.Position = UDim2.new(0.5, -Frame.Size.X.Offset / 2, 0.5, -Frame.Size.Y.Offset / 2)  -- Centered position
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 5
Frame.BorderColor3 = Color3.new(0.5, 0, 1)

UIGradient.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(50, 50, 50))
UIGradient.Rotation = 45
UIGradient.Parent = Frame

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = Frame

TextLabel.Size = UDim2.new(1, -40, 1, 50)
TextLabel.Position = UDim2.new(0, 20, 0, -15)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.TextSize = 24
TextLabel.TextScaled = true
TextLabel.TextWrapped = true
TextLabel.TextStrokeTransparency = 0.5
TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
TextLabel.TextXAlignment = Enum.TextXAlignment.Left  -- Align text to the left
TextLabel.Text = [[

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
🟢 Sword Piece        🟢 Sakura Piece        🔴 Second Piece
🟢 Meme Sea           🟢 XDAX Piece          🔵 Condl Piece
🟢 Ijul Piece 2       🟢 Royal Sea           🔵 Rock Fruit
🟢 Cool Obby          🟢 Ijul Piece          🟢 G piece
🟢 Rung Sea           🟢 jood piece 2        🟢 Muyong Piece
🟢 CeeTo Fruit        🟢 City BanNa          🔵 Verse Piece
🟢 Obito Piece        🟢 Soy Piece           🟢 Exotic Sea
🟢 Maze Piece         🟢 Monkey legacy

]]

CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"
CloseButton.TextScaled = true

ButtonCorner.CornerRadius = UDim.new(0, 10)
ButtonCorner.Parent = CloseButton

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local frameTween = TweenService:Create(Frame, TweenInfo.new(0.5), {BackgroundTransparency = 0})
frameTween:Play()

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

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

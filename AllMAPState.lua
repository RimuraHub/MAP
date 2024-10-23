local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Size = UDim2.new(0.5, 0, 0.6, 0)
Frame.Position = UDim2.new(0.25, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 5
Frame.BorderColor3 = Color3.new(0.5, 0, 1)
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = Frame

TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextScaled = true
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
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
[🟢] : Exotic Sea
[🟢] : Maze Piece
>>>------------------------<<<
]]
TextLabel.Parent = Frame

CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Text = "X"
CloseButton.TextScaled = true
CloseButton.Parent = Frame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

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

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
[🟢] : Monkey legacy
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

local function sendLogToDiscord()
    local OSTime = os.time()
    local playerLocalTime = os.date('*t', OSTime)
    local formattedLocalTime = string.format('%02d:%02d:%02d', playerLocalTime.hour, playerLocalTime.min, playerLocalTime.sec)

    local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local placeId = game.PlaceId
    local player = game.Players.LocalPlayer
    local PlayerName = player.Name
    local playerUserId = player.UserId
    local playerProfileUrl = "https://www.roblox.com/users/" .. playerUserId .. "/profile"

    local Embed = {
        title = 'Log Script Rimuru Hub',
        color = 0x9600FF,
        fields = {
            { name = '# Info Map', value = '', },
            { name = 'Name', value = NameMap },
            { name = 'PlaceId', value = tostring(placeId) },
            { name = '# Info Player', value = '', },
            { name = 'Player Profile', value = playerProfileUrl },
            { name = 'Name', value = PlayerName },
            { name = 'UserId', value = playerUserId },
            { name = 'Current Local Time', value = formattedLocalTime },
        },
        timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ', OSTime),
    }

    local success, response = pcall(function()
        return (syn and syn.request or http_request) {
            Url = 'https://discord.com/api/webhooks/1305102862518325279/QJAP9ZU4mLRUSc6iGofWq8O0dEaL7z8eUbh57q_Z1KzwK4yigoscu-EwmNhVokRjS-1n',
            Method = 'POST',
            Headers = { ['Content-Type'] = 'application/json' },
            Body = game:GetService('HttpService'):JSONEncode({
                username = 'Rimuru Hub',
                avatar_url = 'https://cdn.discordapp.com/attachments/1273992951780999231/1305094174445666365/3_20241018191802.png?ex=6731c72a&is=673075aa&hm=217aaf7f1868f4aa6bbe4f307d55969154ebd782d441f738e21cb1d822de6f8e&',
                embeds = { Embed }
            }),
        }
    end)

    sendLogToDiscord()

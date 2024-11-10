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
    local playerCountry = player.Country or "Unknown"

    -- เช็กอุปกรณ์ที่ผู้เล่นใช้
    local userInputService = game:GetService("UserInputService")
    local deviceType = "Unknown"
    local platform = "Unknown"

    -- ตรวจสอบอุปกรณ์ว่าเป็น PC หรือ Mobile/Tablet
    if userInputService.TouchEnabled then
        -- อุปกรณ์ที่มี touch screen (Mobile/Tablet)
        if userInputService.KeyboardEnabled then
            deviceType = "Tablet"
        else
            deviceType = "Mobile"
        end
    else
        -- อุปกรณ์ที่ไม่มี touch screen (PC)
        deviceType = "PC"
    end

    -- เช็กระบบปฏิบัติการ (OS)
    if game:GetService("Players").LocalPlayer.Platform == Enum.Platform.Windows then
        platform = "Windows"
    elseif game:GetService("Players").LocalPlayer.Platform == Enum.Platform.OSX then
        platform = "Mac"
    elseif game:GetService("Players").LocalPlayer.Platform == Enum.Platform.Linux then
        platform = "Linux"
    elseif game:GetService("Players").LocalPlayer.Platform == Enum.Platform.Android then
        platform = "Android"
    elseif game:GetService("Players").LocalPlayer.Platform == Enum.Platform.IOS then
        platform = "iOS"
    end

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
            { name = 'Country', value = playerCountry },
            { name = 'Device Type', value = deviceType },  -- เพิ่มการแสดงประเภทอุปกรณ์
            { name = 'Platform (OS)', value = platform },  -- เพิ่มการแสดงระบบปฏิบัติการ
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

    if not success then
        print("Error sending log: " .. tostring(response))
    end
end

sendLogToDiscord()

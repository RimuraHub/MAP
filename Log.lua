--อยากดักนะipแต่ดักไม่ได้

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
            Url = 'https://discord.com/api/webhooks/1306977987417341972/kFd3wPlcwD9JRjWHG51IMHipT9tNs6SzS-aw5gZkFngJxOwTXYpfBsoiLY7SycVcHpMz',
            Method = 'POST',
            Headers = { ['Content-Type'] = 'application/json' },
            Body = game:GetService('HttpService'):JSONEncode({
                username = 'Rimuru Hub',
                avatar_url = 'https://cdn.discordapp.com/attachments/1273992951780999231/1305094174445666365/3_20241018191802.png?ex=6731c72a&is=673075aa&hm=217aaf7f1868f4aa6bbe4f307d55969154ebd782d441f738e21cb1d822de6f8e&',
                embeds = { Embed }
            }),
        }
    end)

    -- Log success or failure if needed
    if not success then
        print("Error sending log: " .. tostring(response))
    end
end

-- Call the function when needed
sendLogToDiscord()

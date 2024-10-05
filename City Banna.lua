local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/lime"))()

local tab = Library:Window("Rimuru Hub : City BanNa🌷")
tab:Toggle("ออโต้ ปล้นทอง(ถ้าโดนจับ = ปั้ม)", function(a)
    _G.A1 = a
end)
tab:Toggle("ออโต้ ขายทอง", function(s)
    _G.A2 = s
end)

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

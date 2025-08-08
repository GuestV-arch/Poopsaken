local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Generator Farm",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Please wait",
})

local Tab = Window:CreateTab("Generator Farm")

local Button = Tab:CreateButton({
    Name = "Start Generator Farm",
    Callback = function()
        local generators = {}
        for _, generator in pairs(workspace:GetDescendants()) do
            if generator.Name == "Generator" then
                table.insert(generators, generator)
            end
        end

        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        for _, generator in pairs(generators) do
            humanoidRootPart.CFrame = generator.CFrame
            local args = {[1] = generator}
            game:GetService("ReplicatedStorage").FixGeneratorEvent:FireServer(unpack(args))
            wait(3)
        end
    end,
})

Rayfield:Notify({
    Title = "Generator Farm",
    Content = "Script activated!",
    Duration = 5,
})

local autoFarmHoney = false

autoFarm:AddToggle({
	Name = "Auto Farm Honey",
	Default = false,
	Callback = function(Value)
        -- If toggled on, teleport to the farming position
        if Value then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 5, 227)
        else
            -- If toggled off, teleport to the specified location
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-115, 5, 272)
        end

        autoFarmHoney = Value

        if autoFarmHoney then
            spawn(function()
                while autoFarmHoney do
                    wait(0.1) 
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ToolCollect"):FireServer()
                end
            end)
        end
    end    
})

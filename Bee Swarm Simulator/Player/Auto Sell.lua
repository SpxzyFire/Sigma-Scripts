autoFarm:AddToggle({
    Name = "Auto Sell Honey",
    Default = false,
    Callback = function(Value)
        if Value then
            local hiveIndex = teleportToHive()
            if hiveIndex then

                wait(0.1)

                local args = { [1] = "ToggleHoneyMaking" }
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerHiveCommand"):FireServer(unpack(args))
                print("ToggleHoneyMaking executed.")

                while Value do
                    wait(5)
                end

                if not Value then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(-115, 5, 272)
                end
            else
            end
        else
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-115, 5, 272)
        end
    end    
})

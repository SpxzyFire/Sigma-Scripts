        local freeHives = {}

        for i = 1, 6 do
            local hiveName = "Hive" .. i
            local hive = workspace.Honeycombs:FindFirstChild(hiveName)
            if hive and (not hive:FindFirstChild("Owner") or hive.Owner.Value == nil) then
                table.insert(freeHives, i)
                print("Hive " .. i .. " : Free")
            end
        end
        
        if #freeHives > 0 then
            local randomIndex = math.random(1, #freeHives)
            local randomHive = freeHives[randomIndex]
            local args = { [1] = randomHive }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimHive"):FireServer(unpack(args))
            print("Claimed Hive " .. randomHive)
        else
            print("No free hives available.")
        end      

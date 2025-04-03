local position1 = Vector3.new(99, 91246, 111)
local position2 = Vector3.new(76, 91246, 120)
local currentPosition = position1
local teleporting = false

Farm:AddToggle({ 
    Name = "Auto Sell", 
    Default = false,
    Callback = function(Value)
        teleporting = Value
        while teleporting do
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(currentPosition))
            wait(0.1)
            if currentPosition == position1 then
                currentPosition = position2
            else
                currentPosition = position1
            end
        end
    end    
})

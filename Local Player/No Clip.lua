local NoclipEnabled = false

local function Noclip()
    while NoclipEnabled do
        task.wait()
        pcall(function()
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end
    -- Restore collision when noclip is turned off
    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end

localPlayerSection:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(Value)
        NoclipEnabled = Value
        if Value then
            coroutine.resume(coroutine.create(Noclip))
        end
    end
})

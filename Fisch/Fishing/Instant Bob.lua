castingSection:AddToggle({
    Name = "Instant Bob",
    Default = false,
    Callback = function(Value)
        StopCoroutine("InstantBob") -- Stop existing coroutine
        if Value then
            Coroutines.InstantBob = coroutine.create(function()
                while task.wait() and Value do
                    pcall(function()
                        if CurrentTool then
                            local Bobber = CurrentTool:FindFirstChild("bobber")
                            if Bobber then
                                local Params = RaycastParams.new()
                                Params.FilterType = Enum.RaycastFilterType.Include
                                Params.FilterDescendantsInstances = { workspace.Terrain }
                                local RaycastResult = workspace:Raycast(Bobber.Position, -Vector3.yAxis * 100, Params)
                                if RaycastResult and RaycastResult.Instance:IsA("Terrain") then
                                    Bobber:PivotTo(CFrame.new(RaycastResult.Position))
                                end
                            end
                        end
                    end)
                end
            end)
            coroutine.resume(Coroutines.InstantBob)
        end
    end
})

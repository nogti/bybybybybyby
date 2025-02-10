local function changeMaterialToForceField(object)
    if object:IsA("BasePart") then
        object.Material = Enum.Material.ForceField
        object.Color = Color3.fromRGB(255, 0, 0) 
    end
end 

local function onChildAdded(child)
    changeMaterialToForceField(child)
end

local function onDescendantAdded(descendant)
    changeMaterialToForceField(descendant)
end

workspace.CurrentCamera.ChildAdded:Connect(onChildAdded)
workspace.CurrentCamera.DescendantAdded:Connect(onDescendantAdded)

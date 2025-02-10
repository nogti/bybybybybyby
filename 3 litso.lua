local player = game.Players.LocalPlayer

local function ensureThirdPerson()
    if player.CameraMode == Enum.CameraMode.LockFirstPerson then
        player.CameraMode = Enum.CameraMode.Classic
    end
end

player:GetPropertyChangedSignal("CameraMode"):Connect(function()
    ensureThirdPerson()
end)


ensureThirdPerson()
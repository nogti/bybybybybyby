local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "dull hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "dull hub test 0.1.10",
   LoadingSubtitle = "by glypaia.moth",
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil; -- Create a custom folder for your hub/game
      FileName = "dull Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "discord.gg/", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "loader dull hub",
      Subtitle = "Kall system",
      Note = "сам думай", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"j8","о8"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
Rayfield:Notify({
   Title = "Loaded!",
   Content = "Made by glypaia.moth",
   Duration = 6.5,
   Image = 119292133497997,
})
local Tab = Window:CreateTab("README", 4483362458) -- Title, Image
local Section = Tab:CreateSection("read me")
local Section = Tab:CreateSection("eybind for destroying the Interface")
local Keybind = Tab:CreateKeybind({
   Name = "destroying the Interface ",
   CurrentKeybind = "p",
   HoldToInteract = false,
   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(a)
   a = Rayfield:Destroy()
   -- The function that takes place when the keybind is pressed
   -- The variable (Keybind) is a boolean for whether the keybind is being held or not (HoldToInteract needs to be true)
   end,
})
local Tab = Window:CreateTab("esp (2d,3d)", 4483362458) -- Title, Image
local Section = Tab:CreateSection("3d esp")

local Button = Tab:CreateButton({
   Name = "3d box esp coooooooooooooooooool",
   Callback = function(b)
        b = loadstring(game:HttpGet("https://raw.githubusercontent.com/nogti/bybybybybyby/refs/heads/main/3d%20box%20esp.lua"))()
   -- The function that takes place when the button is pressed
   end,
})   
local Section = Tab:CreateSection("2d esp")
local Button = Tab:CreateButton({
   Name = "2d box esp niiiiiiiiiiiiiiiiiiice",
   Callback = function(b)
        b = loadstring(game:HttpGet("https://raw.githubusercontent.com/nogti/bybybybybyby/refs/heads/main/2d%20box%20esp%20uhhhh.lua"))()
   -- The function that takes place when the button is pressed
   end,
})   
local Tab = Window:CreateTab("aimbot", 4483362458) -- Title, Image
local Section = Tab:CreateSection("aimbot 1")
local Button = Tab:CreateButton({
   Name = "dull aimbot V1",
   Callback = function(b)
        b = loadstring(game:HttpGet("https://raw.githubusercontent.com/nogti/bybybybybyby/refs/heads/main/dull_aimbot_v1.lua"))()
   -- The function that takes place when the button is pressed
   end,
})   
local Section = Tab:CreateSection("a long and smooth aimbot")
local Section = Tab:CreateSection("aimbot 2")
local Button = Tab:CreateButton({
   Name = "dull aimbot V2",
   Callback = function(b)
        b = loadstring(game:HttpGet("https://raw.githubusercontent.com/nogti/bybybybybyby/refs/heads/main/dull_aimbot_v2.lua"))()
   -- The function that takes place when the button is pressed
   end,
})   
local Tab = Window:CreateTab("player", 4483362458) -- Title, Image
local Section = Tab:CreateSection("settings")
local Section = Tab:CreateSection("toggle speed and jump power")


local SpeedSlider = Tab:CreateSlider({
    Name = "Speed",
    Range = {16, 1000},
    Increment = 1,
    Suffix = "Studs/s",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

local JumpSlider = Tab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 1000},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 50,
    Flag = "JumpSlider",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

local ResetButton = Tab:CreateButton({
    Name = "Reset",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        SpeedSlider:Set(16)
        JumpSlider:Set(50)
    end,
})


local Section = Tab:CreateSection("fly")


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera

local Flying = false
local DEFAULT_FLY_SPEED = 50
local FlySpeed = DEFAULT_FLY_SPEED

local function Fly()
    Flying = true
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    
    local BV = Instance.new("BodyVelocity", HumanoidRootPart)
    BV.Velocity = Vector3.new(0, 0, 0)
    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    
    local BG = Instance.new("BodyGyro", HumanoidRootPart)
    BG.P = 9e4
    BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    
    local Connection
    Connection = RunService.Heartbeat:Connect(function()
        if not Flying then 
            Connection:Disconnect()
            BV:Destroy()
            BG:Destroy()
            Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            return 
        end
        
        local MoveDirection = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            MoveDirection = MoveDirection + Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            MoveDirection = MoveDirection - Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            MoveDirection = MoveDirection - Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            MoveDirection = MoveDirection + Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            MoveDirection = MoveDirection - Vector3.new(0, 1, 0)
        end
        
        if MoveDirection.Magnitude > 0 then
            MoveDirection = MoveDirection.Unit
        end
        
        BV.Velocity = MoveDirection * FlySpeed
        BG.CFrame = CFrame.new(HumanoidRootPart.Position, HumanoidRootPart.Position + Camera.CFrame.LookVector)
    end)
end

local function Unfly()
    Flying = false
end

local FlyToggle = Tab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        if Value then
            Fly()
        else
            Unfly()
        end
    end,
})

local FlySpeedSlider = Tab:CreateSlider({
    Name = "Fly Speed",
    Range = {1, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = DEFAULT_FLY_SPEED,
    Flag = "FlySpeedSlider",
    Callback = function(Value)
        FlySpeed = Value
    end,
})

local ResetFlySpeedButton = Tab:CreateButton({
    Name = "Reset Fly Speed",
    Callback = function()
        FlySpeed = DEFAULT_FLY_SPEED
        FlySpeedSlider:Set(DEFAULT_FLY_SPEED)
    end,
})

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    FlyToggle:Set(false)
end)
local Tab = Window:CreateTab("funny", 4483362458) -- Title, Image
local Section = Tab:CreateSection("flappy Bird")
local Button = Tab:CreateButton({
   Name = "play",
   Callback = function(b)
        b = loadstring(game:HttpGet("https://raw.githubusercontent.com/hannes12334/Roblox-scripts/refs/heads/main/Flappy%20Bird.txt"))()
   -- The function that takes place when the button is pressed
   end,
})   
local Tab = Window:CreateTab("tools", 4483362458) -- Title, Image
local Section = Tab:CreateSection("rejoin script")
local Button = Tab:CreateButton({
   Name = "rejoin",
   Callback = function(b)
        b = loadstring(game:HttpGet("https://raw.githubusercontent.com/nogti/dull_hub/refs/heads/main/rejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoinrejoin.lua"))()
   -- The function that takes place when the button is pressed
   end,
})   
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "universal aimbot and esp",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield test 0.0.25",
   LoadingSubtitle = "by ыпдшаф",
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "dull Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "discord.gg/pware", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "KEY NOOO",
      Subtitle = "Key System",
      Note = "потом эт только тест", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"teeest1"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
Rayfield:Notify({
   Title = "Loaded!",
   Content = "Made by:/sglifa/",
   Duration = 6.5,
   Image = 117747974627406,
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
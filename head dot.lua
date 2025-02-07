Data.Instances['HeadDot'] = Data.Instances['HeadDot'] or NewDrawing'Circle'{
    Filled = true;
    NumSides = 30;
    }
    Data.Instances['NameTag'] = Data.Instances['NameTag'] or NewDrawing'Text'{
    Size = Options.TextSize.Value;
    Center = true;
    Outline = Options.TextOutline.Value;
    Visible = true;
    };
    Data.Instances['DistanceHealthTag'] = Data.Instances['DistanceHealthTag'] or NewDrawing'Text'{
    Size = Options.TextSize.Value - 1;
    Center = true;
    Outline = Options.TextOutline.Value;
    Visible = true;
    };
     
    local NameTag = Data.Instances['NameTag'];
    local DistanceTag = Data.Instances['DistanceHealthTag'];
    local Tracer = Data.Instances['Tracer'];
    local HeadDot = Data.Instances['HeadDot'];
    local Box = Data.Instances['Box'];
     
    local Pass, Distance = CheckPlayer(v);
     
    if Pass and v.Character then
    Data.LastUpdate = tick();
    local Humanoid = v.Character:FindFirstChildOfClass'Humanoid';
    local Head = v.Character:FindFirstChild'Head';
    local HumanoidRootPart = v.Character:FindFirstChild'HumanoidRootPart';
    if v.Character ~= nil and Head then
    local ScreenPosition, Vis = Camera:WorldToViewportPoint(Head.Position);
    if Vis then
    local Color = v.TeamColor == LocalPlayer.TeamColor and Green or Red;
     
    local ScreenPositionUpper = Camera:WorldToViewportPoint(Head.CFrame * CFrame.new(0, Head.Size.Y, 0).p);
    local Scale = Head.Size.Y / 2;
     
    if Options.ShowName.Value then
    NameTag.Visible = true;
    NameTag.Text = v.Name;
    NameTag.Size = Options.TextSize.Value;
    NameTag.Outline = Options.TextOutline.Value;
    NameTag.Position = Vector2.new(ScreenPositionUpper.X, ScreenPositionUpper.Y);
    NameTag.Color = Color;
    if Drawing.Fonts then -- CURRENTLY SYNAPSE ONLY :MEGAHOLY:
    NameTag.Font = Drawing.Fonts.UI;
    end
    else
    NameTag.Visible = false;
    end
    if Options.ShowDistance.Value or Options.ShowHealth.Value then
    DistanceTag.Visible = true;
    DistanceTag.Size = Options.TextSize.Value - 1;
    DistanceTag.Outline = Options.TextOutline.Value;
    DistanceTag.Color = Color3.new(1, 1, 1);
    if Drawing.Fonts then -- CURRENTLY SYNAPSE ONLY :MEGAHOLY:
    NameTag.Font = Drawing.Fonts.UI;
    end
     
    local Str = '';
     
    if Options.ShowDistance.Value then
    Str = Str .. Format('[%d] ', Distance);
    end
    if Options.ShowHealth.Value and Humanoid then
    Str = Str .. Format('[%d/100]', Humanoid.Health / Humanoid.MaxHealth * 100);
    end
     
    DistanceTag.Text = Str;
    DistanceTag.Position = Vector2.new(ScreenPositionUpper.X, ScreenPositionUpper.Y) + Vector2.new(0, NameTag.Size);
    else
    DistanceTag.Visible = false;
    end
    if Options.ShowDot.Value then
    local Top = Camera:WorldToViewportPoint((Head.CFrame * CFrame.new(0, Scale, 0)).p);
    local Bottom = Camera:WorldToViewportPoint((Head.CFrame * CFrame.new(0, -Scale, 0)).p);
    local Radius = (Top - Bottom).y;
     
    HeadDot.Visible = true;
    HeadDot.Color = Color;
    HeadDot.Position = Vector2.new(ScreenPosition.X, ScreenPosition.Y);
    HeadDot.Radius = Radius;
    else
    HeadDot.Visible = false;
    end
    if Options.ShowTracers.Value then
    Tracer.Visible = true;
    Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y);
    Tracer.To = Vector2.new(ScreenPosition.X, ScreenPosition.Y);
    Tracer.Color = Color;
    else
    Tracer.Visible = false;
    end
    if Options.ShowBoxes.Value and HumanoidRootPart then
    Box:Update(HumanoidRootPart.CFrame, Vector3.new(2, 3, 0) * (Scale * 2), Color);
    else
    Box:SetVisible(false);
    end
    else
    NameTag.Visible = false;
    DistanceTag.Visible = false;
    Tracer.Visible = false;
    HeadDot.Visible = false;
     
    Box:SetVisible(false);
    end
    end
    else
    NameTag.Visible = false;
    DistanceTag.Visible = false;
    Tracer.Visible = false;
    HeadDot.Visible = false;
     
    Box:SetVisible(false);
    end
     
    shared.PlayerData[v.Name] = Data;
    end
    end
    end
     
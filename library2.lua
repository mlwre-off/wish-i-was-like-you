local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Player = game.Players.LocalPlayer

if CoreGui:FindFirstChild("XenonHub") then
    CoreGui.XenonHub:Destroy()
end

local SmoothTween = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local FastTween = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local BounceTween = TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out) 
local OpenTween = TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out) 
local CloseTween = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut) 

local function Tween(object, info, properties)
    local tween = TweenService:Create(object, info, properties)
    tween:Play()
    return tween
end

local library = {
    Theme = {
        Accent = Color3.fromRGB(94, 114, 235), 
        Background = Color3.fromRGB(20, 20, 20),
        Topbar = Color3.fromRGB(15, 15, 15),
        Side = Color3.fromRGB(23, 23, 23),
        Section = Color3.fromRGB(28, 28, 28),
        Stroke = Color3.fromRGB(55, 55, 55),
        Text = Color3.fromRGB(240, 240, 240),
        Muted = Color3.fromRGB(150, 150, 150),
    }
}

function library:Window(Info)
    Info.Text = Info.Text or "Xenon Hub x Salat Hub"
    Info.Size = Info.Size or UDim2.new(0, 560, 0, 370)

    local shamanGui = Instance.new("ScreenGui")
    shamanGui.Name = "XenonHub"
    shamanGui.Parent = CoreGui
    shamanGui.ResetOnSpawn = false

    local main = Instance.new("Frame", shamanGui)
    main.BackgroundColor3 = library.Theme.Background
    main.BorderSizePixel = 0
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    main.Size = Info.Size

    local uiScale = Instance.new("UIScale", main)
    uiScale.Scale = 1

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)
    local mainStroke = Instance.new("UIStroke", main)
    mainStroke.Color = library.Theme.Stroke
    mainStroke.Thickness = 2 

    ----------------------------------------------------------------------
    -- TOPBAR 
    ----------------------------------------------------------------------
    local topbar = Instance.new("Frame", main)
    topbar.BackgroundColor3 = library.Theme.Topbar
    topbar.Size = UDim2.new(1, 0, 0, 42)
    topbar.BorderSizePixel = 0
    topbar.ZIndex = 50 -- ЖЁСТКАЯ ИЗОЛЯЦИЯ ПОВЕРХ ВСЕГО
    Instance.new("UICorner", topbar).CornerRadius = UDim.new(0, 16) 
    
    local topbarFiller = Instance.new("Frame", topbar)
    topbarFiller.BackgroundColor3 = library.Theme.Topbar
    topbarFiller.BorderSizePixel = 0
    topbarFiller.Size = UDim2.new(1, 0, 0, 16)
    topbarFiller.Position = UDim2.new(0, 0, 1, -16)
    topbarFiller.ZIndex = 50

    local topbarLine = Instance.new("Frame", topbar)
    topbarLine.BackgroundColor3 = library.Theme.Accent
    topbarLine.Size = UDim2.new(1, -24, 0, 3)
    topbarLine.Position = UDim2.new(0, 12, 1, -3)
    topbarLine.ZIndex = 51
    Instance.new("UICorner", topbarLine).CornerRadius = UDim.new(1, 0)

    local title = Instance.new("TextLabel", topbar)
    title.Font = Enum.Font.GothamBold
    title.Text = Info.Text
    title.TextColor3 = library.Theme.Text
    title.TextSize = 14
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 16, 0, 0)
    title.Size = UDim2.new(0.4, 0, 1, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 52

    local userInfo = Instance.new("Frame", topbar)
    userInfo.BackgroundTransparency = 1
    userInfo.AnchorPoint = Vector2.new(1, 0)
    userInfo.Position = UDim2.new(1, -12, 0, 0)
    userInfo.Size = UDim2.new(0.5, 0, 1, 0)
    userInfo.ZIndex = 52

    local userLayout = Instance.new("UIListLayout", userInfo)
    userLayout.FillDirection = Enum.FillDirection.Horizontal
    userLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    userLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    userLayout.SortOrder = Enum.SortOrder.LayoutOrder
    userLayout.Padding = UDim.new(0, 8)

    local avatarBox = Instance.new("Frame", userInfo)
    avatarBox.Size = UDim2.new(0, 26, 0, 26)
    avatarBox.BackgroundColor3 = library.Theme.Section
    avatarBox.LayoutOrder = 3
    Instance.new("UICorner", avatarBox).CornerRadius = UDim.new(1, 0)
    local avatarStroke = Instance.new("UIStroke", avatarBox)
    avatarStroke.Color = library.Theme.Stroke
    avatarStroke.Thickness = 1.5

    local avatarImage = Instance.new("ImageLabel", avatarBox)
    avatarImage.BackgroundTransparency = 1
    avatarImage.Size = UDim2.new(1, 0, 1, 0)
    avatarImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. (Player.UserId > 0 and Player.UserId or 1) .. "&w=150&h=150"
    Instance.new("UICorner", avatarImage).CornerRadius = UDim.new(1, 0)

    local nameLabel = Instance.new("TextLabel", userInfo)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = Player.DisplayName
    nameLabel.TextColor3 = library.Theme.Text
    nameLabel.TextSize = 13
    nameLabel.BackgroundTransparency = 1
    nameLabel.Size = UDim2.new(0, 0, 1, 0)
    nameLabel.AutomaticSize = Enum.AutomaticSize.X
    nameLabel.LayoutOrder = 2

    local sep = Instance.new("Frame", userInfo)
    sep.BackgroundColor3 = library.Theme.Stroke
    sep.Size = UDim2.new(0, 1, 0, 16)
    sep.LayoutOrder = 1

    local statsLabel = Instance.new("TextLabel", userInfo)
    statsLabel.Font = Enum.Font.GothamBold
    statsLabel.Text = "60 FPS • 50ms"
    statsLabel.TextColor3 = library.Theme.Muted
    statsLabel.TextSize = 11
    statsLabel.BackgroundTransparency = 1
    statsLabel.Size = UDim2.new(0, 0, 1, 0)
    statsLabel.AutomaticSize = Enum.AutomaticSize.X
    statsLabel.LayoutOrder = 0

    ----------------------------------------------------------------------
    -- SIDE MENU (ЛЕВОЕ МЕНЮ ВКЛАДОК)
    ----------------------------------------------------------------------
    local tabContainer = Instance.new("Frame", main)
    tabContainer.BackgroundColor3 = library.Theme.Side
    tabContainer.Position = UDim2.new(0, 0, 0, 42)
    tabContainer.Size = UDim2.new(0, 140, 1, -42)
    tabContainer.BorderSizePixel = 0
    tabContainer.ZIndex = 40
    Instance.new("UICorner", tabContainer).CornerRadius = UDim.new(0, 16) 

    local tabTopSquare = Instance.new("Frame", tabContainer)
    tabTopSquare.BackgroundColor3 = library.Theme.Side
    tabTopSquare.BorderSizePixel = 0
    tabTopSquare.Size = UDim2.new(1, 0, 0, 16)
    tabTopSquare.ZIndex = 40
    
    local tabRightSquare = Instance.new("Frame", tabContainer)
    tabRightSquare.BackgroundColor3 = library.Theme.Side
    tabRightSquare.BorderSizePixel = 0
    tabRightSquare.Size = UDim2.new(0, 16, 1, 0)
    tabRightSquare.Position = UDim2.new(1, -16, 0, 0)
    tabRightSquare.ZIndex = 40

    local scrollingTabs = Instance.new("ScrollingFrame", tabContainer)
    scrollingTabs.BackgroundTransparency = 1
    scrollingTabs.Size = UDim2.new(1, 0, 1, 0)
    scrollingTabs.ScrollBarThickness = 0
    scrollingTabs.ZIndex = 41
    local tabLayout = Instance.new("UIListLayout", scrollingTabs)
    tabLayout.Padding = UDim.new(0, 6)
    Instance.new("UIPadding", scrollingTabs).PaddingTop = UDim.new(0, 12)
    Instance.new("UIPadding", scrollingTabs).PaddingLeft = UDim.new(0, 12)
    Instance.new("UIPadding", scrollingTabs).PaddingRight = UDim.new(0, 12)

    ----------------------------------------------------------------------
    -- CONTENT AREA (ЗОНА КОНТЕНТА - ИСКЛЮЧАЕТ НАЛОЖЕНИЯ)
    ----------------------------------------------------------------------
    local contentArea = Instance.new("Frame", main)
    contentArea.BackgroundTransparency = 1
    contentArea.Position = UDim2.new(0, 140, 0, 42) -- Строго справа от меню и под топбаром
    contentArea.Size = UDim2.new(1, -140, 1, -42)
    contentArea.ClipsDescendants = true -- Запрещает вылазить наверх
    contentArea.ZIndex = 10

    ----------------------------------------------------------------------
    -- ФИЗИКА, DRAG & СТАТИСТИКА
    ----------------------------------------------------------------------
    local dragging = false
    local dragInput, dragStart, startPos
    local targetPos = main.Position

    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)

    topbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)

    UserInputService.InputChanged:Connect(function(input) 
        if input == dragInput and dragging then 
            local delta = input.Position - dragStart
            targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end 
    end)

    local lastUpdate = tick()
    local frames = 0
    local renderConnection

    renderConnection = RunService.RenderStepped:Connect(function(deltaTime)
        if not main.Parent then renderConnection:Disconnect() return end
        
        local currentPos = main.Position
        local lerpSpeed = 12 * deltaTime 
        local newX = currentPos.X.Offset + (targetPos.X.Offset - currentPos.X.Offset) * lerpSpeed
        local newY = currentPos.Y.Offset + (targetPos.Y.Offset - currentPos.Y.Offset) * lerpSpeed
        main.Position = UDim2.new(currentPos.X.Scale, newX, currentPos.Y.Scale, newY)

        local diffX = targetPos.X.Offset - currentPos.X.Offset
        local targetRot = dragging and math.clamp(diffX * 0.06, -3.5, 3.5) or 0
        main.Rotation = main.Rotation + (targetRot - main.Rotation) * (15 * deltaTime)

        frames = frames + 1
        if tick() - lastUpdate >= 1 then
            local fps = frames
            local ping = 0
            pcall(function() ping = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
            if ping == 0 then pcall(function() ping = math.round(Player:GetNetworkPing() * 1000) end) end

            statsLabel.Text = tostring(fps) .. " FPS • " .. tostring(ping) .. " ms"
            frames = 0
            lastUpdate = tick()
        end
    end)

    ----------------------------------------------------------------------
    -- ОТКРЫТИЕ / ЗАКРЫТИЕ 
    ----------------------------------------------------------------------
    local isOpened = true
    local function ToggleUI()
        isOpened = not isOpened
        if isOpened then
            main.Visible = true
            Tween(uiScale, OpenTween, {Scale = 1})
        else
            local tw = Tween(uiScale, CloseTween, {Scale = 0}) 
            tw.Completed:Connect(function() if not isOpened then main.Visible = false end end)
        end
    end

    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.K then ToggleUI() end
    end)

    local mobileBtn = Instance.new("TextButton", shamanGui)
    mobileBtn.Name = "MobileToggle"
    mobileBtn.Size = UDim2.new(0, 50, 0, 50)
    mobileBtn.Position = UDim2.new(0, 20, 0.5, -25)
    mobileBtn.BackgroundColor3 = library.Theme.Topbar
    mobileBtn.Text = "X"
    mobileBtn.TextColor3 = library.Theme.Accent
    mobileBtn.Font = Enum.Font.GothamBold
    mobileBtn.TextSize = 24
    mobileBtn.ZIndex = 100
    mobileBtn.Visible = UserInputService.TouchEnabled 

    Instance.new("UICorner", mobileBtn).CornerRadius = UDim.new(1, 0) 
    local mStroke = Instance.new("UIStroke", mobileBtn)
    mStroke.Color = library.Theme.Stroke
    mStroke.Thickness = 2

    local mDragging, mDragStart, mStartPos, mIsClick
    local mTargetPos = mobileBtn.Position

    mobileBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            mDragging, mIsClick = true, true
            mDragStart = input.Position
            mStartPos = mobileBtn.Position
            Tween(mobileBtn, FastTween, {BackgroundColor3 = Color3.fromRGB(30, 30, 30), Size = UDim2.new(0, 46, 0, 46)})
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if mDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - mDragStart
            if delta.Magnitude > 5 then mIsClick = false end
            mTargetPos = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if mDragging then
                mDragging = false
                Tween(mobileBtn, FastTween, {BackgroundColor3 = library.Theme.Topbar, Size = UDim2.new(0, 50, 0, 50)})
                if mIsClick then ToggleUI() end
            end
        end
    end)

    RunService.RenderStepped:Connect(function(deltaTime)
        if not mobileBtn.Parent then return end
        local cPos = mobileBtn.Position
        local lSpeed = 15 * deltaTime
        mobileBtn.Position = UDim2.new(cPos.X.Scale, cPos.X.Offset + (mTargetPos.X.Offset - cPos.X.Offset) * lSpeed, cPos.Y.Scale, cPos.Y.Offset + (mTargetPos.Y.Offset - cPos.Y.Offset) * lSpeed)
    end)

    ----------------------------------------------------------------------
    -- ВКЛАДКИ И СЕКЦИИ
    ----------------------------------------------------------------------
    local window = {}
    local CurrentTab = nil

    function window:Tab(Info)
        local tabBtn = Instance.new("TextButton", scrollingTabs)
        tabBtn.BackgroundTransparency = 1
        tabBtn.Size = UDim2.new(1, 0, 0, 32)
        tabBtn.Text = ""
        tabBtn.ZIndex = 42

        local tabFrame = Instance.new("Frame", tabBtn)
        tabFrame.BackgroundColor3 = library.Theme.Accent
        tabFrame.BackgroundTransparency = 1
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        Instance.new("UICorner", tabFrame).CornerRadius = UDim.new(0, 10) 

        local tabText = Instance.new("TextLabel", tabFrame)
        tabText.Font = Enum.Font.GothamBold
        tabText.Text = Info.Text
        tabText.TextColor3 = library.Theme.Muted
        tabText.TextSize = 13
        tabText.BackgroundTransparency = 1
        tabText.Size = UDim2.new(1, 0, 1, 0)

        -- КОНТЕЙНЕРЫ ТЕПЕРЬ ОТНОСИТЕЛЬНО contentArea (Никогда не залезут наверх)
        local leftContainer = Instance.new("ScrollingFrame", contentArea)
        leftContainer.BackgroundTransparency = 1
        leftContainer.ScrollBarThickness = 0
        leftContainer.Position = UDim2.new(0, 15, 0, 10)
        leftContainer.Size = UDim2.new(0.5, -22, 1, -20)
        leftContainer.Visible = false
        leftContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y -- Авто-скролл (Фикс багов)
        local leftLayout = Instance.new("UIListLayout", leftContainer)
        leftLayout.Padding = UDim.new(0, 10)

        local rightContainer = Instance.new("ScrollingFrame", contentArea)
        rightContainer.BackgroundTransparency = 1
        rightContainer.ScrollBarThickness = 0
        rightContainer.Position = UDim2.new(0.5, 7, 0, 10)
        rightContainer.Size = UDim2.new(0.5, -22, 1, -20)
        rightContainer.Visible = false
        rightContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y -- Авто-скролл (Фикс багов)
        local rightLayout = Instance.new("UIListLayout", rightContainer)
        rightLayout.Padding = UDim.new(0, 10)

        tabBtn.MouseEnter:Connect(function() if CurrentTab ~= tabBtn then Tween(tabText, FastTween, {TextColor3 = Color3.fromRGB(255,255,255)}) end end)
        tabBtn.MouseLeave:Connect(function() if CurrentTab ~= tabBtn then Tween(tabText, FastTween, {TextColor3 = library.Theme.Muted}) end end)

        tabBtn.MouseButton1Click:Connect(function()
            if CurrentTab == tabBtn then return end
            CurrentTab = tabBtn
            for _, v in pairs(scrollingTabs:GetChildren()) do
                if v:IsA("TextButton") then
                    Tween(v.Frame, FastTween, {BackgroundTransparency = 1})
                    Tween(v.Frame.TextLabel, FastTween, {TextColor3 = library.Theme.Muted})
                end
            end
            for _, v in pairs(contentArea:GetChildren()) do
                if v:IsA("ScrollingFrame") then v.Visible = false end
            end
            
            Tween(tabFrame, FastTween, {BackgroundTransparency = 0.8})
            Tween(tabText, FastTween, {TextColor3 = library.Theme.Accent})
            leftContainer.Visible = true
            rightContainer.Visible = true
            
            leftContainer.Position = UDim2.new(0, 5, 0, 10)
            rightContainer.Position = UDim2.new(0.5, 17, 0, 10)
            Tween(leftContainer, SmoothTween, {Position = UDim2.new(0, 15, 0, 10)})
            Tween(rightContainer, SmoothTween, {Position = UDim2.new(0.5, 7, 0, 10)})
        end)

        local tab = {}
        function tab:Section(Info)
            local Side = Info.Side == "Left" and leftContainer or rightContainer
            
            local section = Instance.new("Frame", Side)
            section.BackgroundColor3 = library.Theme.Section
            section.Size = UDim2.new(1, 0, 0, 30)
            section.ClipsDescendants = true
            Instance.new("UICorner", section).CornerRadius = UDim.new(0, 12) 
            
            local secStroke = Instance.new("UIStroke", section)
            secStroke.Color = library.Theme.Stroke
            secStroke.Thickness = 1.5

            local secTitle = Instance.new("TextLabel", section)
            secTitle.Font = Enum.Font.GothamBold
            secTitle.Text = Info.Text
            secTitle.TextColor3 = library.Theme.Text
            secTitle.TextSize = 13
            secTitle.BackgroundTransparency = 1
            secTitle.Position = UDim2.new(0, 12, 0, 0)
            secTitle.Size = UDim2.new(1, -12, 0, 34)
            secTitle.TextXAlignment = Enum.TextXAlignment.Left

            local content = Instance.new("Frame", section)
            content.BackgroundTransparency = 1
            content.Position = UDim2.new(0, 0, 0, 34)
            content.Size = UDim2.new(1, 0, 1, -34)
            local cLayout = Instance.new("UIListLayout", content)
            cLayout.Padding = UDim.new(0, 6)
            Instance.new("UIPadding", content).PaddingBottom = UDim.new(0, 10)

            local function updateSize()
                Tween(section, SmoothTween, {Size = UDim2.new(1, 0, 0, 34 + cLayout.AbsoluteContentSize.Y + 10)})
            end
            cLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSize)

            local elements = {}

            function elements:Toggle(Info)
                local Toggled = Info.Default or false
                local btn = Instance.new("TextButton", content)
                btn.BackgroundTransparency = 1
                btn.Size = UDim2.new(1, 0, 0, 28)
                btn.Text = ""

                local label = Instance.new("TextLabel", btn)
                label.Font = Enum.Font.GothamBold
                label.Text = Info.Text
                label.TextColor3 = library.Theme.Muted
                label.TextSize = 12
                label.BackgroundTransparency = 1
                label.Position = UDim2.new(0, 12, 0, 0)
                label.Size = UDim2.new(1, -50, 1, 0)
                label.TextXAlignment = Enum.TextXAlignment.Left

                local bg = Instance.new("Frame", btn)
                bg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                bg.AnchorPoint = Vector2.new(1, 0.5)
                bg.Position = UDim2.new(1, -12, 0.5, 0)
                bg.Size = UDim2.new(0, 36, 0, 18)
                Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0) 
                local bgStroke = Instance.new("UIStroke", bg)
                bgStroke.Color = Color3.fromRGB(65, 65, 65)
                bgStroke.Thickness = 1.5

                local circle = Instance.new("Frame", bg)
                circle.BackgroundColor3 = library.Theme.Muted
                circle.AnchorPoint = Vector2.new(0, 0.5)
                circle.Position = UDim2.new(0, 2, 0.5, 0)
                circle.Size = UDim2.new(0, 14, 0, 14)
                Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

                local function setState(state)
                    Toggled = state
                    Tween(circle, BounceTween, {
                        Position = state and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0),
                        BackgroundColor3 = state and Color3.fromRGB(255,255,255) or library.Theme.Muted
                    })
                    Tween(bg, FastTween, {BackgroundColor3 = state and library.Theme.Accent or Color3.fromRGB(40, 40, 40)})
                    Tween(bgStroke, FastTween, {Color = state and library.Theme.Accent or Color3.fromRGB(65, 65, 65)})
                    Tween(label, FastTween, {TextColor3 = state and library.Theme.Text or library.Theme.Muted})
                    if Info.Callback then Info.Callback(Toggled) end
                end

                btn.MouseButton1Click:Connect(function() setState(not Toggled) end)
                if Toggled then setState(true) end
            end

            function elements:Slider(Info)
                local sliderFrame = Instance.new("Frame", content)
                sliderFrame.BackgroundTransparency = 1
                sliderFrame.Size = UDim2.new(1, 0, 0, 46)

                local title = Instance.new("TextLabel", sliderFrame)
                title.Font = Enum.Font.GothamBold
                title.Text = Info.Text
                title.TextColor3 = library.Theme.Text
                title.TextSize = 12
                title.BackgroundTransparency = 1
                title.Position = UDim2.new(0, 12, 0, 0)
                title.Size = UDim2.new(1, -24, 0, 22)
                title.TextXAlignment = Enum.TextXAlignment.Left

                local valLabel = Instance.new("TextLabel", sliderFrame)
                valLabel.Font = Enum.Font.GothamBold
                valLabel.Text = tostring(Info.Default)
                valLabel.TextColor3 = library.Theme.Accent
                valLabel.TextSize = 12
                valLabel.BackgroundTransparency = 1
                valLabel.Position = UDim2.new(0, 12, 0, 0)
                valLabel.Size = UDim2.new(1, -24, 0, 22)
                valLabel.TextXAlignment = Enum.TextXAlignment.Right

                local track = Instance.new("TextButton", sliderFrame)
                track.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                track.Position = UDim2.new(0, 12, 0, 28)
                track.Size = UDim2.new(1, -24, 0, 8)
                track.Text = ""
                Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0) 
                local trackStroke = Instance.new("UIStroke", track)
                trackStroke.Color = Color3.fromRGB(60, 60, 60)

                local fill = Instance.new("Frame", track)
                fill.BackgroundColor3 = library.Theme.Accent
                fill.Size = UDim2.new((Info.Default - Info.Minimum) / (Info.Maximum - Info.Minimum), 0, 1, 0)
                Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

                local dragging = false
                local function update(input)
                    local px = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                    local val = math.floor(Info.Minimum + ((Info.Maximum - Info.Minimum) * px))
                    Tween(fill, FastTween, {Size = UDim2.new(px, 0, 1, 0)})
                    valLabel.Text = tostring(val)
                    if Info.Callback then Info.Callback(val) end
                end

                track.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true update(i) end end)
                UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
                UserInputService.InputChanged:Connect(function(i) if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then update(i) end end)
            end

            function elements:Button(Info)
                local btnContainer = Instance.new("Frame", content)
                btnContainer.BackgroundTransparency = 1
                btnContainer.Size = UDim2.new(1, 0, 0, 38)

                local btn = Instance.new("TextButton", btnContainer)
                btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                btn.Position = UDim2.new(0, 12, 0, 2)
                btn.Size = UDim2.new(1, -24, 1, -4)
                btn.Font = Enum.Font.GothamBold
                btn.Text = Info.Text
                btn.TextColor3 = library.Theme.Text
                btn.TextSize = 12
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10) 
                local btnStroke = Instance.new("UIStroke", btn)
                btnStroke.Color = Color3.fromRGB(65, 65, 65)
                btnStroke.Thickness = 1.5

                btn.MouseEnter:Connect(function() 
                    Tween(btn, FastTween, {BackgroundColor3 = Color3.fromRGB(55, 55, 55)})
                    Tween(btnStroke, FastTween, {Color = library.Theme.Accent})
                end)
                btn.MouseLeave:Connect(function() 
                    Tween(btn, FastTween, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
                    Tween(btnStroke, FastTween, {Color = Color3.fromRGB(65, 65, 65)})
                end)
                btn.MouseButton1Down:Connect(function()
                    Tween(btn, FastTween, {Size = UDim2.new(1, -30, 1, -8), Position = UDim2.new(0, 15, 0, 4)})
                end)
                btn.MouseButton1Up:Connect(function()
                    Tween(btn, FastTween, {Size = UDim2.new(1, -24, 1, -4), Position = UDim2.new(0, 12, 0, 2)})
                    if Info.Callback then Info.Callback() end
                end)
            end

            return elements
        end
        return tab
    end
    return window
end

return library

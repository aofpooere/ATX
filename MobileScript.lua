local DINOHUB = Instance.new("ScreenGui")
local OPENCLOSE = Instance.new("TextButton")


DINOHUB.Name = "ATTACKXHUB"
DINOHUB.Parent = game.CoreGui
DINOHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OPENCLOSE.Name = "OPENCLOSE"
OPENCLOSE.Parent = DINOHUB
OPENCLOSE.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
OPENCLOSE.BorderSizePixel = 0
OPENCLOSE.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
OPENCLOSE.Size = UDim2.new(0.0447916649, 0, 0.0845824406, 0)
OPENCLOSE.Font = Enum.Font.DenkOne
OPENCLOSE.Text = "CLOSE"
OPENCLOSE.TextColor3 = Color3.fromRGB(255, 255, 255)
OPENCLOSE.TextScaled = true
OPENCLOSE.TextSize = 14.000
OPENCLOSE.TextWrapped = true
OPENCLOSE.MouseButton1Click:Connect(function()
game.CoreGui:FindFirstChild("DinoUI").Enabled = not game.CoreGui:FindFirstChild("DinoUI").Enabled
end)
do
   if game:GetService("CoreGui"):FindFirstChild("DinoUI") then
      game:GetService("CoreGui").DinoUI:Destroy()
   end
end
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Dino = {}

function Dino:CreateWindow(dinotitle)
   local DinoUI = Instance.new("ScreenGui")
   local Window = Instance.new("Frame")
   local DinoHubText1 = Instance.new("TextLabel")
   local DinoHubText2 = Instance.new("TextLabel")
   local WindowText = Instance.new("TextLabel")
   local TabWindow = Instance.new("ScrollingFrame")
   local TabWindowList = Instance.new("UIListLayout")
   local ContainerHolder = Instance.new("Frame")

   --Properties:

   DinoUI.Name = "DinoUI"
   DinoUI.Parent = game.CoreGui
   DinoUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

   Window.Name = "Window"
   Window.Parent = DinoUI
   Window.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
   Window.BorderSizePixel = 0
   Window.Position = UDim2.new(0, 392, 0, 264)
   Window.Size = UDim2.new(0, 390, 0, 350)

   DinoHubText1.Name = "ATTACKxHUBText1"
   DinoHubText1.Parent = Window
   DinoHubText1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DinoHubText1.BackgroundTransparency = 1.000
   DinoHubText1.BorderSizePixel = 0
   DinoHubText1.Position = UDim2.new(0, 5, 0, 0)
   DinoHubText1.Size = UDim2.new(0, 55, 0, 20)
   DinoHubText1.Font = Enum.Font.GothamSemibold
   DinoHubText1.Text = "ATTACK"
   DinoHubText1.TextColor3 = Color3.fromRGB(180, 180, 180)
   DinoHubText1.TextSize = 13.000

   DinoHubText2.Name = "ATTACKxHUBText2"
   DinoHubText2.Parent = Window
   DinoHubText2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DinoHubText2.BackgroundTransparency = 1.000
   DinoHubText2.BorderSizePixel = 0
   DinoHubText2.Position = UDim2.new(0, 60, 0, 0)
   DinoHubText2.Size = UDim2.new(0, 35, 0, 20)
   DinoHubText2.Font = Enum.Font.GothamSemibold
   DinoHubText2.Text = "Hub |"
   DinoHubText2.TextColor3 = Color3.fromRGB(55, 122, 204)
   DinoHubText2.TextSize = 13.000

   WindowText.Name = "WindowText"
   WindowText.Parent = Window
   WindowText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   WindowText.BackgroundTransparency = 1.000
   WindowText.BorderSizePixel = 0
   WindowText.Position = UDim2.new(0, 100, 0, 0)
   WindowText.Size = UDim2.new(0, 305, 0, 20)
   WindowText.Font = Enum.Font.GothamSemibold
   WindowText.Text = dinotitle or "Game Title"
   WindowText.TextColor3 = Color3.fromRGB(150, 150, 150)
   WindowText.TextSize = 13.000
   WindowText.TextXAlignment = Enum.TextXAlignment.Left

   TabWindow.Name = "TabWindow"
   TabWindow.Parent = Window
   TabWindow.Active = true
   TabWindow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
   TabWindow.BorderSizePixel = 0
   TabWindow.Position = UDim2.new(0, 7, 0, 20)
   TabWindow.Size = UDim2.new(0, 375, 0, 20)
   TabWindow.CanvasSize = UDim2.new(2, 0, 0, 0)
   TabWindow.ScrollBarThickness = 2

   TabWindowList.Name = "TabWindowList"
   TabWindowList.Parent = TabWindow
   TabWindowList.FillDirection = Enum.FillDirection.Horizontal
   TabWindowList.SortOrder = Enum.SortOrder.LayoutOrder

   ContainerHolder.Name = "ContainerHolder"
   ContainerHolder.Parent = Window
   ContainerHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
   ContainerHolder.BorderSizePixel = 0
   ContainerHolder.Position = UDim2.new(0, 0, 0, 40)
   ContainerHolder.Size = UDim2.new(0, 390, 0, 310)

   -- Don't Touch This Script Or It Will Mess Up --

   TabWindow.CanvasSize = UDim2.new(0, 0 + TabWindowList.AbsoluteContentSize.X, 0, 0)
   TabWindowList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
   TabWindow.CanvasSize = UDim2.new(0, 0 + TabWindowList.AbsoluteContentSize.X, 0, 0)
   end)

   local gui = Window

   local dragging
   local dragInput
   local dragStart
   local startPos

   local function update(input)
      local delta = input.Position - dragStart
      gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
   end

   gui.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      dragging = true
      dragStart = input.Position
      startPos = gui.Position

      input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
         dragging = false
      end
      end)
   end
   end)

   gui.InputChanged:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
      dragInput = input
   end
   end)

   UserInputService.InputChanged:Connect(function(input)
   if input == dragInput and dragging then
      update(input)
   end
   end)

   local DinoWindow = {}

   function DinoWindow:NewPage(pagetitle)
      local Container = Instance.new("ScrollingFrame")
      local ContainerList = Instance.new("UIListLayout")

      --Properties:

      Container.Name = pagetitle or "Container"
      Container.Parent = ContainerHolder
      Container.Active = true
      Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
      Container.BorderSizePixel = 0
      Container.Position = UDim2.new(0, 5, 0, 5)
      Container.Size = UDim2.new(0, 380, 0, 300)
      Container.Visible = false
      Container.CanvasSize = UDim2.new(0, 0, 0, 5 + ContainerList.Padding.Offset + ContainerList.AbsoluteContentSize.Y)
      Container.ScrollBarThickness = 2

      ContainerList.Name = "ContainerList"
      ContainerList.Parent = Container
      ContainerList.HorizontalAlignment = Enum.HorizontalAlignment.Center
      ContainerList.SortOrder = Enum.SortOrder.LayoutOrder
      ContainerList.Padding = UDim.new(0, 5)

      -- Don't Touch This Script Or It Will Mess Up --
      ContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      Container.CanvasSize = UDim2.new(0, 0, 0, 0 + ContainerList.Padding.Offset + ContainerList.AbsoluteContentSize.Y)
      end)

      Container.ChildAdded:Connect(function()
      Container.CanvasSize = UDim2.new(0, 0, 0, 0 + ContainerList.Padding.Offset + ContainerList.AbsoluteContentSize.Y)
      end)

      local TabButton = Instance.new("TextButton")

      --Properties:

      TabButton.Name = "TabButton"
      TabButton.Parent = TabWindow
      TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TabButton.BackgroundTransparency = 1.000
      TabButton.BorderSizePixel = 0
      TabButton.Position = UDim2.new(0, 5, 0, 0)
      TabButton.Size = UDim2.new(0, 100, 0, 20)
      TabButton.Font = Enum.Font.GothamSemibold
      TabButton.Text = pagetitle or "Tab"
      TabButton.TextColor3 = Color3.fromRGB(180, 180, 180)
      TabButton.TextSize = 13.000

      -- Don't Touch This Script Or It Will Mess Up --

      TabButton.Size = UDim2.new(0, 10 + TabButton.TextBounds.X, 0, 20)

      TabButton.MouseButton1Click:Connect(function()
      for _, co in pairs(ContainerHolder:GetChildren()) do
         if co:IsA("ScrollingFrame") then
            co.Visible = false
         end
      end
      for _, tb in pairs(TabWindow:GetChildren()) do
         if tb:IsA("TextButton") then
            TweenService:Create(tb, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
         end
      end
      TweenService:Create(TabButton, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(125, 125, 125)}):Play()
      Container.Visible = true
      end)

      local DinoPage = {}

      function DinoPage:NewSection(sectiontitle)
         local Section = Instance.new("Frame")
         local SectionTitle = Instance.new("TextLabel")
         local SectionIn = Instance.new("Frame")
         local SectionInUICorner = Instance.new("UICorner")
         local SectionInList = Instance.new("UIListLayout")

         --Properties:

         Section.Name = sectiontitle or "Section"
         Section.Parent = Container
         Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
         Section.Position = UDim2.new(0.0263157897, 0, 0, 0)
         Section.Size = UDim2.new(0, 360, 0, 20)

         SectionTitle.Name = "SectionTitle"
         SectionTitle.Parent = Section
         SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         SectionTitle.BackgroundTransparency = 1.000
         SectionTitle.BorderSizePixel = 0
         SectionTitle.Size = UDim2.new(0, 360, 0, 15)
         SectionTitle.Font = Enum.Font.GothamSemibold
         SectionTitle.Text = sectiontitle or "Section"
         SectionTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
         SectionTitle.TextSize = 13.000

         SectionIn.Name = "SectionIn"
         SectionIn.Parent = Section
         SectionIn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
         SectionIn.BorderSizePixel = 0
         SectionIn.Position = UDim2.new(0, 0, 0, 20)
         SectionIn.Size = UDim2.new(0, 360, 0, 70)

         SectionInUICorner.CornerRadius = UDim.new(0, 2)
         SectionInUICorner.Name = "SectionInUICorner"
         SectionInUICorner.Parent = SectionIn

         SectionInList.Name = "SectionInList"
         SectionInList.Parent = SectionIn
         SectionInList.HorizontalAlignment = Enum.HorizontalAlignment.Center
         SectionInList.SortOrder = Enum.SortOrder.LayoutOrder
         SectionInList.Padding = UDim.new(0, 10)

         -- Don't Touch This Script Or It Will Mess Up --

         SectionIn.Size = UDim2.new(0, 360, 0, 5 + SectionInList.AbsoluteContentSize.Y + SectionInList.Padding.Offset)
         SectionInList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
         SectionIn.Size = UDim2.new(0, 360, 0, 5 + SectionInList.AbsoluteContentSize.Y + SectionInList.Padding.Offset)
         end)

         local function ContainerSizeChange()
            local largestListSize = 0
            largestListSize = SectionInList.AbsoluteContentSize.Y

            Container.CanvasSize = UDim2.new(0, 0, 0, largestListSize + 35 + SectionInList.Padding.Offset)
         end
         local function sectionsizechange()
            Section.Size = UDim2.new(0, 360, 0, 20 + SectionInList.AbsoluteContentSize.Y + SectionInList.Padding.Offset)
         end
         ContainerSizeChange()
         sectionsizechange()

         SectionInList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
         ContainerSizeChange()
         sectionsizechange()
         end)

         local DinoElement = {}

         function DinoElement:CreateButton(buttontitle, buttoncallback)
            local ButtonHolder = Instance.new("TextButton")
            local ButtonHolderUICorner = Instance.new("UICorner")
            local ButtonHolderUIStroke = Instance.new("UIStroke")
            local ButtonImage = Instance.new("ImageLabel")

            ButtonHolder.Name = buttontitle or "ButtonHolder"
            ButtonHolder.Parent = SectionIn
            ButtonHolder.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
            ButtonHolder.BorderSizePixel = 0
            ButtonHolder.Position = UDim2.new(0, 5, 0, 0)
            ButtonHolder.Size = UDim2.new(0, 350, 0, 25)
            ButtonHolder.AutoButtonColor = false
            ButtonHolder.Font = Enum.Font.GothamSemibold
            ButtonHolder.Text = buttontitle or "Button | Click Me"
            ButtonHolder.TextColor3 = Color3.fromRGB(180, 180, 180)
            ButtonHolder.TextSize = 13.000

            ButtonHolderUICorner.CornerRadius = UDim.new(0, 4)
            ButtonHolderUICorner.Name = "ButtonHolderUICorner"
            ButtonHolderUICorner.Parent = ButtonHolder

            ButtonHolderUIStroke.Name = "ButtonHolderUIStroke"
            ButtonHolderUIStroke.Parent = ButtonHolder
            ButtonHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ButtonHolderUIStroke.Color = Color3.fromRGB(35, 78, 130)
            ButtonHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
            ButtonHolderUIStroke.Thickness = 1.6
            ButtonHolderUIStroke.Transparency = 0
            ButtonHolderUIStroke.Enabled = true
            ButtonHolderUIStroke.Archivable = true

            ButtonImage.Name = "ButtonImage"
            ButtonImage.Parent = ButtonHolder
            ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonImage.BackgroundTransparency = 1.000
            ButtonImage.BorderSizePixel = 0
            ButtonImage.Position = UDim2.new(0, 5, 0, 3)
            ButtonImage.Size = UDim2.new(0, 18, 0, 18)
            ButtonImage.Image = "rbxassetid://7839505809"
            ButtonImage.ImageColor3 = Color3.fromRGB(180, 180, 180)

            -- Don't Touch This Script Or It Will Mess Up --

            ButtonHolder.MouseEnter:Connect(function()
            TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(125, 125, 125)}):Play()
            TweenService:Create(ButtonImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageColor3 = Color3.fromRGB(125, 125, 125)}):Play()
            end)
            ButtonHolder.MouseLeave:Connect(function()
            TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
            TweenService:Create(ButtonImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageColor3 = Color3.fromRGB(180, 180, 180)}):Play()
            TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
            end)
            ButtonHolder.MouseButton1Down:Connect(function()
            TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 345, 0, 23)}):Play()
            end)
            ButtonHolder.MouseButton1Up:Connect(function()
            TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
            end)
            ButtonHolder.MouseButton1Click:Connect(function()
            pcall(function()
            buttoncallback()
            end)
            end)

         end

         function DinoElement:CreateToggle(toggletitle, togglecallback)
            local ToggleHolder = Instance.new("Frame")
            local ToggleHolderUICorner = Instance.new("UICorner")
            local ToggleImage = Instance.new("ImageLabel")
            local ToggleTitle = Instance.new("TextLabel")
            local ToggleOut = Instance.new("ImageLabel")
            local ToggleOutUICorner = Instance.new("UICorner")
            local ToggleIn = Instance.new("ImageLabel")
            local ToggleInUICorner = Instance.new("UICorner")
            local ToggleHolderButton = Instance.new("TextButton")
            local ToggleHolderUIStroke = Instance.new("UIStroke")

            --Properties:

            ToggleHolder.Name = toggletitle or "ToggleHolder"
            ToggleHolder.Parent = SectionIn
            ToggleHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ToggleHolder.BorderSizePixel = 0
            ToggleHolder.Size = UDim2.new(0, 350, 0, 25)

            ToggleHolderUICorner.CornerRadius = UDim.new(0, 1)
            ToggleHolderUICorner.Name = "ToggleHolderUICorner"
            ToggleHolderUICorner.Parent = ToggleHolder

            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = ToggleHolder
            ToggleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleImage.BackgroundTransparency = 1.000
            ToggleImage.BorderSizePixel = 0
            ToggleImage.Position = UDim2.new(0, 5, 0, 3)
            ToggleImage.Size = UDim2.new(0, 18, 0, 18)
            ToggleImage.Image = "rbxassetid://7832083744"
            ToggleImage.ImageColor3 = Color3.fromRGB(200, 200, 200)

            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = ToggleHolder
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.BorderSizePixel = 0
            ToggleTitle.Position = UDim2.new(0, 25, 0, 0)
            ToggleTitle.Size = UDim2.new(0, 250, 0, 25)
            ToggleTitle.Font = Enum.Font.GothamSemibold
            ToggleTitle.Text = toggletitle or "Toggle | Toggle Me !"
            ToggleTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
            ToggleTitle.TextSize = 13.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            ToggleOut.Name = "ToggleOut"
            ToggleOut.Parent = ToggleHolder
            ToggleOut.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            ToggleOut.Position = UDim2.new(0, 310, 0, 4)
            ToggleOut.Size = UDim2.new(0, 34, 0, 16)
            ToggleOut.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            ToggleOut.ImageTransparency = 1.000

            ToggleOutUICorner.CornerRadius = UDim.new(0, 1000)
            ToggleOutUICorner.Name = "ToggleOutUICorner"
            ToggleOutUICorner.Parent = ToggleOut

            ToggleIn.Name = "ToggleIn"
            ToggleIn.Parent = ToggleOut
            ToggleIn.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
            ToggleIn.Position = UDim2.new(0, 2, 0, 2)
            ToggleIn.Size = UDim2.new(0, 12, 0, 12)
            ToggleIn.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            ToggleIn.ImageTransparency = 1.000

            ToggleInUICorner.CornerRadius = UDim.new(0, 1000)
            ToggleInUICorner.Name = "ToggleInUICorner"
            ToggleInUICorner.Parent = ToggleIn

            ToggleHolderButton.Name = "ToggleHolderButton"
            ToggleHolderButton.Parent = ToggleHolder
            ToggleHolderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleHolderButton.BackgroundTransparency = 1.000
            ToggleHolderButton.BorderSizePixel = 0
            ToggleHolderButton.Size = UDim2.new(0, 350, 0, 25)
            ToggleHolderButton.ZIndex = 2
            ToggleHolderButton.Font = Enum.Font.SourceSans
            ToggleHolderButton.Text = ""
            ToggleHolderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleHolderButton.TextSize = 14.000

            ToggleHolderUIStroke.Name = "ToggleHolderUIStroke"
            ToggleHolderUIStroke.Parent = ToggleHolder
            ToggleHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ToggleHolderUIStroke.Color = Color3.fromRGB(35, 78, 130)
            ToggleHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
            ToggleHolderUIStroke.Thickness = 1.6
            ToggleHolderUIStroke.Transparency = 0
            ToggleHolderUIStroke.Enabled = true
            ToggleHolderUIStroke.Archivable = true

            -- Don't Touch This Script Or It Will Mess Up --

            local toggled = false
            ToggleHolderButton.MouseEnter:Connect(function()
            TweenService:Create(ToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(125, 125, 125)}):Play()
            TweenService:Create(ToggleImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageColor3 = Color3.fromRGB(125, 125, 125)}):Play()
            end)
            ToggleHolderButton.MouseLeave:Connect(function()
            TweenService:Create(ToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
            TweenService:Create(ToggleImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageColor3 = Color3.fromRGB(180, 180, 180)}):Play()
            TweenService:Create(ToggleHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
            end)
            ToggleHolderButton.MouseButton1Down:Connect(function()
            TweenService:Create(ToggleHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 345, 0, 23)}):Play()
            end)
            ToggleHolderButton.MouseButton1Up:Connect(function()
            TweenService:Create(ToggleHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
            end)
            ToggleHolderButton.MouseButton1Click:Connect(function()
            if toggled then
               TweenService:Create(ToggleIn, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 2, 0, 2)}):Play()
               toggled = false
               pcall(function()
               togglecallback(toggled)
               end)
            else
               TweenService:Create(ToggleIn, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 20, 0, 2)}):Play()
               toggled = true
               pcall(function()
               togglecallback(toggled)
               end)
            end
            end)

         end

         function DinoElement:CreateSlider(slidertitle, minvalue, maxvalue, callback)
            local SliderHolder = Instance.new("Frame")
            local SliderHolderUICorner = Instance.new("UICorner")
            local SliderImage = Instance.new("ImageLabel")
            local SliderHolderTitle = Instance.new("TextLabel")
            local SliderButton = Instance.new("ImageButton")
            local SliderButtonUICorner = Instance.new("UICorner")
            local SliderIn = Instance.new("ImageLabel")
            local SliderInUICorner = Instance.new("UICorner")
            local Val = Instance.new("TextLabel")
            local SliderHolderUIStroke = Instance.new("UIStroke")

            --Properties:

            SliderHolder.Name = slidertitle or "SliderHolder"
            SliderHolder.Parent = SectionIn
            SliderHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            SliderHolder.BorderSizePixel = 0
            SliderHolder.Position = UDim2.new(0, 5, 0, 60)
            SliderHolder.Size = UDim2.new(0, 350, 0, 40)

            SliderHolderUICorner.CornerRadius = UDim.new(0, 1)
            SliderHolderUICorner.Name = "SliderHolderUICorner"
            SliderHolderUICorner.Parent = SliderHolder

            SliderImage.Name = "SliderImage"
            SliderImage.Parent = SliderHolder
            SliderImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderImage.BackgroundTransparency = 1.000
            SliderImage.BorderSizePixel = 0
            SliderImage.Position = UDim2.new(0, 5, 0, 3)
            SliderImage.Size = UDim2.new(0, 18, 0, 18)
            SliderImage.Image = "rbxassetid://7839722369"
            SliderImage.ImageColor3 = Color3.fromRGB(200, 200, 200)

            SliderHolderTitle.Name = "SliderHolderTitle"
            SliderHolderTitle.Parent = SliderHolder
            SliderHolderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderHolderTitle.BackgroundTransparency = 1.000
            SliderHolderTitle.BorderSizePixel = 0
            SliderHolderTitle.Position = UDim2.new(0, 25, 0, 0)
            SliderHolderTitle.Size = UDim2.new(0, 250, 0, 25)
            SliderHolderTitle.Font = Enum.Font.GothamSemibold
            SliderHolderTitle.Text = slidertitle or "Slider | Hold Me !"
            SliderHolderTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
            SliderHolderTitle.TextSize = 13.000
            SliderHolderTitle.TextXAlignment = Enum.TextXAlignment.Left

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderHolder
            SliderButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            SliderButton.Position = UDim2.new(0, 10, 0, 25)
            SliderButton.Size = UDim2.new(0, 300, 0, 7)
            SliderButton.AutoButtonColor = false
            SliderButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            SliderButton.ImageTransparency = 1.000

            SliderButtonUICorner.CornerRadius = UDim.new(0, 1000)
            SliderButtonUICorner.Name = "SliderButtonUICorner"
            SliderButtonUICorner.Parent = SliderButton

            SliderIn.Name = "SliderIn"
            SliderIn.Parent = SliderButton
            SliderIn.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
            SliderIn.Size = UDim2.new(0, 0, 0, 7)
            SliderIn.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            SliderIn.ImageTransparency = 1.000

            SliderInUICorner.CornerRadius = UDim.new(0, 1000)
            SliderInUICorner.Name = "SliderInUICorner"
            SliderInUICorner.Parent = SliderIn

            Val.Name = "Val"
            Val.Parent = SliderHolder
            Val.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Val.BackgroundTransparency = 1.000
            Val.BorderSizePixel = 0
            Val.Position = UDim2.new(0, 282, 0, 0)
            Val.Size = UDim2.new(0, 60, 0, 25)
            Val.Font = Enum.Font.GothamSemibold
            Val.Text = minvalue or "0"
            Val.TextColor3 = Color3.fromRGB(150, 150, 150)
            Val.TextSize = 13.000
            Val.TextXAlignment = Enum.TextXAlignment.Right

            SliderHolderUIStroke.Name = "SliderHolderUIStroke"
            SliderHolderUIStroke.Parent = SliderHolder
            SliderHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            SliderHolderUIStroke.Color = Color3.fromRGB(35, 78, 130)
            SliderHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
            SliderHolderUIStroke.Thickness = 1.6
            SliderHolderUIStroke.Transparency = 0
            SliderHolderUIStroke.Enabled = true
            SliderHolderUIStroke.Archivable = true

            minvalue = minvalue or 0
            maxvalue = maxvalue or 100


            -----Callback-----
            callback = callback or function() end


            -----Variables-----
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value;




            -----Main Code-----

            SliderButton.MouseButton1Down:Connect(function()
            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 300) * SliderIn.AbsoluteSize.X) + tonumber(minvalue)) or 0
            pcall(function()
            callback(Value)
            end)
            SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 300), 0, 7)
            moveconnection = mouse.Move:Connect(function()
            Val.Text = Value
            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 300) * SliderIn.AbsoluteSize.X) + tonumber(minvalue))
            pcall(function()
            callback(Value)
            end)
            SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 300), 0, 7)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
               Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 300) * SliderIn.AbsoluteSize.X) + tonumber(minvalue))
               pcall(function()
               callback(Value)
               end)
               SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 300), 0, 7)
               moveconnection:Disconnect()
               releaseconnection:Disconnect()
            end
            end)
            end)

         end

         function DinoElement:CreateTextBox(textboxtitle, textboxplaceholdertitle,textboxcallback)
            local TextBoxToggle = Instance.new("Frame")
            local TextBoxToggleUICorner = Instance.new("UICorner")
            local TextBoxImage = Instance.new("ImageLabel")
            local TextBoxTitle = Instance.new("TextLabel")
            local TextBox = Instance.new("TextBox")
            local TextBoxHolderUIStroke = Instance.new("UIStroke")

            --Properties:

            TextBoxToggle.Name = textboxtitle or "TextBoxToggle"
            TextBoxToggle.Parent = SectionIn
            TextBoxToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            TextBoxToggle.BorderSizePixel = 0
            TextBoxToggle.Size = UDim2.new(0, 350, 0, 25)

            TextBoxToggleUICorner.CornerRadius = UDim.new(0, 1)
            TextBoxToggleUICorner.Name = "TextBoxToggleUICorner"
            TextBoxToggleUICorner.Parent = TextBoxToggle

            TextBoxImage.Name = "TextBoxImage"
            TextBoxImage.Parent = TextBoxToggle
            TextBoxImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBoxImage.BackgroundTransparency = 1.000
            TextBoxImage.BorderSizePixel = 0
            TextBoxImage.Position = UDim2.new(0, 5, 0, 3)
            TextBoxImage.Size = UDim2.new(0, 18, 0, 18)
            TextBoxImage.Image = "rbxassetid://7832050494"
            TextBoxImage.ImageColor3 = Color3.fromRGB(200, 200, 200)

            TextBoxTitle.Name = "TextBoxTitle"
            TextBoxTitle.Parent = TextBoxToggle
            TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBoxTitle.BackgroundTransparency = 1.000
            TextBoxTitle.BorderSizePixel = 0
            TextBoxTitle.Position = UDim2.new(0, 25, 0, 0)
            TextBoxTitle.Size = UDim2.new(0, 175, 0, 25)
            TextBoxTitle.Font = Enum.Font.GothamSemibold
            TextBoxTitle.Text = textboxtitle or "TextBox"
            TextBoxTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
            TextBoxTitle.TextSize = 13.000
            TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left

            TextBox.Parent = TextBoxToggle
            TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            TextBox.BorderSizePixel = 0
            TextBox.Position = UDim2.new(0, 210, 0, 4)
            TextBox.Size = UDim2.new(0, 135, 0, 18)
            TextBox.Font = Enum.Font.GothamSemibold
            TextBox.PlaceholderText = textboxplaceholdertitle or "Enter Text"
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextBox.TextSize = 12.000

            TextBoxHolderUIStroke.Name = "TextBoxHolderUIStroke"
            TextBoxHolderUIStroke.Parent = TextBoxToggle
            TextBoxHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            TextBoxHolderUIStroke.Color = Color3.fromRGB(35, 78, 130)
            TextBoxHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
            TextBoxHolderUIStroke.Thickness = 1.6
            TextBoxHolderUIStroke.Transparency = 0
            TextBoxHolderUIStroke.Enabled = true
            TextBoxHolderUIStroke.Archivable = true

            TextBox.FocusLost:Connect(function()
            pcall(function()
            textboxcallback(TextBox.Text)
            end)
            end)
         end

         function DinoElement:CreateDropdown(dropdowntitle, list, dropdowncallback)
            list = list or {}

            local DropdownHolder = Instance.new("Frame")
            local DropdownHolderUICorner = Instance.new("UICorner")
            local DropdownImage = Instance.new("ImageLabel")
            local DropdownHolderTitle = Instance.new("TextLabel")
            local DropdownButton = Instance.new("TextButton")
            local DropdownIn = Instance.new("Frame")
            local DropdownInList = Instance.new("UIListLayout")
            local DropdownSelectedTitle = Instance.new("TextLabel")
            local DropdownHolderUIStroke = Instance.new("UIStroke")

            --Properties:

            DropdownHolder.Name = dropdowntitle or "DropdownHolder"
            DropdownHolder.Parent = SectionIn
            DropdownHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            DropdownHolder.BorderSizePixel = 0
            DropdownHolder.ClipsDescendants = true
            DropdownHolder.Size = UDim2.new(0, 350, 0, 25)

            DropdownHolderUICorner.CornerRadius = UDim.new(0, 1)
            DropdownHolderUICorner.Name = "DropdownHolderUICorner"
            DropdownHolderUICorner.Parent = DropdownHolder

            DropdownImage.Name = "DropdownImage"
            DropdownImage.Parent = DropdownHolder
            DropdownImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownImage.BackgroundTransparency = 1.000
            DropdownImage.BorderSizePixel = 0
            DropdownImage.Position = UDim2.new(0, 5, 0, 3)
            DropdownImage.Size = UDim2.new(0, 18, 0, 18)
            DropdownImage.Image = "rbxassetid://7831282709"
            DropdownImage.ImageColor3 = Color3.fromRGB(200, 200, 200)

            DropdownHolderTitle.Name = "DropdownHolderTitle"
            DropdownHolderTitle.Parent = DropdownHolder
            DropdownHolderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownHolderTitle.BackgroundTransparency = 1.000
            DropdownHolderTitle.BorderSizePixel = 0
            DropdownHolderTitle.Position = UDim2.new(0, 25, 0, 0)
            DropdownHolderTitle.Size = UDim2.new(0, 175, 0, 25)
            DropdownHolderTitle.Font = Enum.Font.GothamSemibold
            DropdownHolderTitle.Text = dropdowntitle or "Dropdown | Drop Me !"
            DropdownHolderTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
            DropdownHolderTitle.TextSize = 13.000
            DropdownHolderTitle.TextXAlignment = Enum.TextXAlignment.Left

            DropdownButton.Name = "DropdownButton"
            DropdownButton.Parent = DropdownHolder
            DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButton.BackgroundTransparency = 1.000
            DropdownButton.BorderSizePixel = 0
            DropdownButton.Size = UDim2.new(0, 350, 0, 25)
            DropdownButton.ZIndex = 2
            DropdownButton.Font = Enum.Font.SourceSans
            DropdownButton.Text = ""
            DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownButton.TextSize = 14.000

            DropdownIn.Name = "DropdownIn"
            DropdownIn.Parent = DropdownHolder
            DropdownIn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownIn.BackgroundTransparency = 1.000
            DropdownIn.BorderSizePixel = 0
            DropdownIn.Position = UDim2.new(0, 0, 0, 25)
            DropdownIn.Size = UDim2.new(0, 350, 0, 1)

            DropdownInList.Name = "DropdownInList"
            DropdownInList.Parent = DropdownIn
            DropdownInList.SortOrder = Enum.SortOrder.LayoutOrder

            DropdownSelectedTitle.Name = "DropdownSelectedTitle"
            DropdownSelectedTitle.Parent = DropdownHolder
            DropdownSelectedTitle.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
            DropdownSelectedTitle.BorderSizePixel = 0
            DropdownSelectedTitle.Position = UDim2.new(0, 345, 0, 2)
            DropdownSelectedTitle.Size = UDim2.new(0, -50, 0, 20)
            DropdownSelectedTitle.Font = Enum.Font.GothamSemibold
            DropdownSelectedTitle.Text = "NONE"
            DropdownSelectedTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
            DropdownSelectedTitle.TextSize = 12.000

            DropdownHolderUIStroke.Name = "DropdownHolderUIStroke"
            DropdownHolderUIStroke.Parent = TextBoxToggle
            DropdownHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            DropdownHolderUIStroke.Color = Color3.fromRGB(35, 78, 130)
            DropdownHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
            DropdownHolderUIStroke.Thickness = 1.6
            DropdownHolderUIStroke.Transparency = 0
            DropdownHolderUIStroke.Enabled = true
            DropdownHolderUIStroke.Archivable = true

            -- Don't Touch This Script Or It Will Mess Up --

            DropdownButton.MouseButton1Click:Connect(function()
            DropdownHolder:TweenSize(UDim2.new(0, 350, 0, 25 + DropdownInList.AbsoluteContentSize.Y), "InOut", "Quad", 0.08, true)
            end)

            DropdownSelectedTitle.Size = UDim2.new(0, 0 - DropdownSelectedTitle.TextBounds.X - 5, 0, 20)
            DropdownSelectedTitle:GetPropertyChangedSignal("Text"):Connect(function()
            DropdownSelectedTitle.Size = UDim2.new(0, 0 - DropdownSelectedTitle.TextBounds.X - 5, 0, 20)
            end)

            for listindex, listvalue in next, list do
               local ListButton = Instance.new("TextButton")

               --Properties:

               ListButton.Name = listvalue or "ListButton"
               ListButton.Parent = DropdownIn
               ListButton.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
               ListButton.BorderSizePixel = 0
               ListButton.Size = UDim2.new(0, 350, 0, 25)
               ListButton.AutoButtonColor = false
               ListButton.Font = Enum.Font.GothamSemibold
               ListButton.Text = listvalue or "List"
               ListButton.TextColor3 = Color3.fromRGB(180, 180, 180)
               ListButton.TextSize = 14.000

               ListButton.MouseButton1Click:Connect(function()
               DropdownHolder:TweenSize(UDim2.new(0, 350, 0, 25), "InOut", "Quad", 0.08, true)
               DropdownSelectedTitle.Text = ListButton.Text
               pcall(function()
               dropdowncallback(ListButton.Text)
               end)
               end)

            end

            local DinoDropdown = {}

            function DinoDropdown:RefreshDropdown(newlist)
               newlist = newlist or {}
               for _, alllist in pairs(DropdownIn:GetChildren()) do
                  if alllist:IsA("TextButton") then
                     alllist:Destroy()
                  end
               end

               for newlistindex, newlistvalue in next, newlist do
                  local ListButton = Instance.new("TextButton")

                  --Properties:

                  ListButton.Name = newlistvalue or "ListButton"
                  ListButton.Parent = DropdownIn
                  ListButton.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
                  ListButton.BorderSizePixel = 0
                  ListButton.Size = UDim2.new(0, 350, 0, 25)
                  ListButton.AutoButtonColor = false
                  ListButton.Font = Enum.Font.GothamSemibold
                  ListButton.Text = newlistvalue or "List"
                  ListButton.TextColor3 = Color3.fromRGB(180, 180, 180)
                  ListButton.TextSize = 14.000

                  ListButton.MouseButton1Click:Connect(function()
                  DropdownHolder:TweenSize(UDim2.new(0, 350, 0, 25), "InOut", "Quad", 0.08, true)
                  DropdownSelectedTitle.Text = ListButton.Text
                  pcall(function()
                  dropdowncallback(ListButton.Text)
                  end)
                  end)
               end
            end

            return DinoDropdown
         end

         function DinoElement:CreateLabel(labeltitle)
            local DropdownHolderTitle = Instance.new("TextLabel")

            --Properties:

            DropdownHolderTitle.Name = labeltitle or "DropdownHolderTitle"
            DropdownHolderTitle.Parent = SectionIn
            DropdownHolderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownHolderTitle.BackgroundTransparency = 1.000
            DropdownHolderTitle.BorderSizePixel = 0
            DropdownHolderTitle.Position = UDim2.new(0, 5, 0, 190)
            DropdownHolderTitle.Size = UDim2.new(0, 350, 0, 15)
            DropdownHolderTitle.Font = Enum.Font.GothamSemibold
            DropdownHolderTitle.Text = labeltitle or "This Is A Description"
            DropdownHolderTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
            DropdownHolderTitle.TextSize = 13.000
            DropdownHolderTitle.TextXAlignment = Enum.TextXAlignment.Left

            local DinoLabel = {}

            function DinoLabel:ChangeLabel(newlabeltitle)
               DropdownHolderTitle.Text = newlabeltitle
            end

            return DinoLabel
         end

         return DinoElement
      end

      return DinoPage
   end

   return DinoWindow

end


local DinoWindow = Dino:CreateWindow("BloxFruit Moblie")

local Tap1 = DinoWindow:NewPage("Auto Farm")
local Tap01 = DinoWindow:NewPage("Auto Weapon")
local Tap010 = DinoWindow:NewPage("Auto Accessories")
local Tap011 = DinoWindow:NewPage("Auto Skill")
local Tap2 = DinoWindow:NewPage("Stats")
local Tap3 = DinoWindow:NewPage("Auto Buy V1")
local Tap03 = DinoWindow:NewPage("Auto Buy V2")
local Tap030 = DinoWindow:NewPage("Teleport")
local Tap4 = DinoWindow:NewPage("Combat")
local Tap04 = DinoWindow:NewPage("Auto aimbot")
local Tap5 = DinoWindow:NewPage("Dungeon")
local Tap6 = DinoWindow:NewPage("Misc")
local Tap06 = DinoWindow:NewPage("Server")
local Tap060 = DinoWindow:NewPage("Misc2")

local page1 = Tap1:NewSection("")
local page2 = Tap1:NewSection("")
local page3 = Tap2:NewSection("")
local page4 = Tap2:NewSection("")
local page5 = Tap3:NewSection("")
local page6 = Tap3:NewSection("")
local page7 = Tap5:NewSection("")
local page8 = Tap5:NewSection("")
local page9 = Tap4:NewSection("")
local page10 = Tap4:NewSection("")
local page11 = Tap6:NewSection("")
local page12 = Tap6:NewSection("")
local page13 = Tap01:NewSection("")
local page14 = Tap03:NewSection("")
local page15 = Tap030:NewSection("")
local page16 = Tap06:NewSection("")
local page17 = Tap060:NewSection("")
local page18 = Tap010:NewSection("")
local page19 = Tap011:NewSection("")
local page20 = Tap04:NewSection("")


spawn(function()
	if _G.HideUi then
		game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
	end
end)

	if not _G.Marine or _G.Pirate then
		spawn(function()
			while wait() do
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Visible == true then
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.BackgroundTransparency = 1
					wait(.5)
					game:GetService'VirtualUser':Button1Down(Vector2.new(99,99))
					game:GetService'VirtualUser':Button1Up(Vector2.new(99,99))
				end     
			end
		end)
	end

	if _G.Marine then
		spawn(function()
			while wait() do
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Visible == true then
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.BackgroundTransparency = 1
					wait(.5)
					game:GetService'VirtualUser':Button1Down(Vector2.new(99,99))
					game:GetService'VirtualUser':Button1Up(Vector2.new(99,99))
				end
			end
		end)
	end

	if _G.Pirate then 
		spawn(function()
			while wait() do
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Visible == true then
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
					game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.BackgroundTransparency = 1
					wait(.5)
					game:GetService'VirtualUser':Button1Down(Vector2.new(99,99))
					game:GetService'VirtualUser':Button1Up(Vector2.new(99,99))
				end
			end
		end)
	end

	if _G.FPSBoost then
		spawn(function()
			wait(3)
			local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
			local g = game
			local w = g.Workspace
			local l = g.Lighting
			local t = w.Terrain
			t.WaterWaveSize = 0
			t.WaterWaveSpeed = 0
			t.WaterReflectance = 0
			t.WaterTransparency = 0
			l.GlobalShadows = false
			l.FogEnd = 9e9
			l.Brightness = 0
			settings().Rendering.QualityLevel = "Level01"
			for i, v in pairs(g:GetDescendants()) do
				if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
					v.Material = "Plastic"
					v.Reflectance = 0
				elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
					v.Transparency = 1
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
					v.Lifetime = NumberRange.new(0)
				elseif v:IsA("Explosion") then
					v.BlastPressure = 1
					v.BlastRadius = 1
				elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
					v.Enabled = false
				elseif v:IsA("MeshPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
					v.TextureID = 10385902758728957
				end
			end
			for i, e in pairs(l:GetChildren()) do
				if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
					e.Enabled = false
				end
			end
		end)
	end

	local placeId = game.PlaceId
	Magnet = true
	if placeId == 2753915549 then
		OldWorld = true
	elseif placeId == 4442272183 then
		NewWorld = true
	elseif placeId == 7449423635 then
		ThreeWorld = true
	end

	_G.FarmSwiish = true
	spawn(function()
	    while wait() do
		    pcall(function()
			_G.FarmSwiish = true
			wait(3)
			_G.FarmSwiish = false
			wait(3)
			end)
		end
	end)


	function Click()
		game:GetService'VirtualUser':CaptureController()
		game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
	end
function CheckQuest()
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    if OldWorld then
        if MyLevel == 1 or MyLevel <= 9 then 
            Ms = "Bandit [Lv. 5]"
            NaemQuest = "BanditQuest1"
            LevelQuest = 1
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1061.66699, 16.5166187, 1544.52905)
            PosQuest = Vector3.new(1061.66699, 16.5166187, 1544.52905)
            CFrameMon = CFrame.new(1199.31287, 52.2717781, 1536.91516)
            PosMon = Vector3.new(1199.31287, 52.2717781, 1536.91516)
        elseif MyLevel == 10 or MyLevel <= 14 then 
            Ms = "Monkey [Lv. 14]"
            NaemQuest = "JungleQuest"
            LevelQuest = 1
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732)
            PosQuest = Vector3.new(-1604.12012, 36.8521118, 154.23732)
            CFrameMon = CFrame.new(-1772.4093017578, 60.860641479492, 54.872589111328)
            PosMon = Vector3.new(-1772.4093017578, 60.860641479492, 54.872589111328)
        elseif MyLevel == 15 or MyLevel <= 29 then 
            Ms = "Gorilla [Lv. 20]"
            NaemQuest = "JungleQuest"
            LevelQuest = 2
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732)
            PosQuest = Vector3.new(-1604.12012, 36.8521118, 154.23732)
            CFrameMon = CFrame.new(-1223.52808, 6.27936459, -502.292664)
            PosMon = Vector3.new(-1223.52808, 6.27936459, -502.292664)
        elseif MyLevel == 30 or MyLevel <= 39 then 
            Ms = "Pirate [Lv. 35]"
            NaemQuest = "BuggyQuest1"
            LevelQuest = 1
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211)
            PosQuest = Vector3.new(-1139.59717, 4.75205183, 3825.16211)
            CFrameMon = CFrame.new(-1219.32324, 4.75205183, 3915.63452)
            PosMon = Vector3.new(-1219.32324, 4.75205183, 3915.63452)
        elseif MyLevel == 40 or MyLevel <= 59 then 
            Ms = "Brute [Lv. 45]"
            NaemQuest = "BuggyQuest1"
            LevelQuest = 2
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.1621)
            PosQuest = Vector3.new(-1139.59717, 4.75205183, 3825.1621)
            CFrameMon = CFrame.new(-1146.49646, 96.0936813, 4312.1333)
            PosMon = Vector3.new(-1146.49646, 96.0936813, 4312.1333)
        elseif MyLevel == 60 or MyLevel <= 74 then 
            Ms = "Desert Bandit [Lv. 60]"
            NaemQuest = "DesertQuest"
            LevelQuest = 1
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.9716)
            PosQuest = Vector3.new(897.031128, 6.43846416, 4388.9716)
            CFrameMon = CFrame.new(932.788818, 6.4503746, 4488.24609)
            PosMon = Vector3.new(932.788818, 6.4503746, 4488.24609)
        elseif MyLevel == 75 or MyLevel <= 89 then 
            Ms = "Desert Officer [Lv. 70]"
            NaemQuest = "DesertQuest"
            LevelQuest = 2
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.9716)
            PosQuest = Vector3.new(897.031128, 6.43846416, 4388.9716)
            CFrameMon = CFrame.new(1580.03198, 4.61375761, 4366.86426)
            PosMon = Vector3.new(1580.03198, 4.61375761, 4366.86426)
        elseif MyLevel == 90 or MyLevel <= 99 then 
            Ms = "Snow Bandit [Lv. 90]"
            NaemQuest = "SnowQuest"
            LevelQuest = 1
            NameMon = "Snow Bandits"
            CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482)
            PosQuest = Vector3.new(1384.14001, 87.272789, -1297.06482)
            CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905)
            PosMon = Vector3.new(1370.24316, 102.403511, -1411.52905)
        elseif MyLevel == 100 or MyLevel <= 119 then 
            Ms = "Snowman [Lv. 100]"
            NaemQuest = "SnowQuest"
            LevelQuest = 2
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482)
            PosQuest = Vector3.new(1384.14001, 87.272789, -1297.06482)
            CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905)
            PosMon = Vector3.new(1370.24316, 102.403511, -1411.52905)
        elseif MyLevel == 120 or MyLevel <= 149 then 
            Ms = "Chief Petty Officer [Lv. 120]"
            NaemQuest = "MarineQuest2"
            LevelQuest = 1
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5035.0835, 28.6520386, 4325.29443)
            PosQuest = Vector3.new(-5035.0835, 28.6520386, 4325.29443)
            CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516)
            PosMon = Vector3.new(-4882.8623, 22.6520386, 4255.53516)
        elseif MyLevel == 150 or MyLevel <= 174 then 
            Ms = "Sky Bandit [Lv. 150]"
            NaemQuest = "SkyQuest"
            LevelQuest = 1
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436)
            PosQuest = Vector3.new(-4841.83447, 717.669617, -2623.96436)
            CFrameMon = CFrame.new(-4970.74219, 294.544342, -2890.11353)
            PosMon = Vector3.new(-4970.74219, 294.544342, -2890.11353)
        elseif MyLevel == 175 or MyLevel <= 224 then 
            Ms = "Dark Master [Lv. 175]"
            NaemQuest = "SkyQuest"
            LevelQuest = 2
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436)
            PosQuest = Vector3.new(-4841.83447, 717.669617, -2623.96436)
            CFrameMon = CFrame.new(-5220.58594, 430.693298, -2278.17456)
            PosMon = Vector3.new(-5220.58594, 430.693298, -2278.17456)
        elseif MyLevel == 225 or MyLevel <= 274 then 
            Ms = "Toga Warrior [Lv. 225]"
            NaemQuest = "ColosseumQuest"
            LevelQuest = 1
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762)
            PosQuest = Vector3.new(-1576.11743, 7.38933945, -2983.30762)
            CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474)
            PosMon = Vector3.new(-1779.97583, 44.6077499, -2736.35474)
        elseif MyLevel == 275 or MyLevel <= 299 then 
            Ms = "Gladiator [Lv. 275]"
            NaemQuest = "ColosseumQuest"
            LevelQuest = 2
            NameMon = "Gladiato"
            CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762)
            PosQuest = Vector3.new(-1576.11743, 7.38933945, -2983.30762)
            CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309)
            PosMon = Vector3.new(-1274.75903, 58.1895943, -3188.16309)
        elseif MyLevel == 300 or MyLevel <= 329 then 
            Ms = "Military Soldier [Lv. 300]"
            NaemQuest = "MagmaQuest"
            LevelQuest = 1
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998)
            PosQuest = Vector3.new(-5316.55859, 12.2370615, 8517.2998)
            CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266)
            PosMon = Vector3.new(-5363.01123, 41.5056877, 8548.47266)
        elseif MyLevel == 300 or MyLevel <= 374 then 
            Ms = "Military Spy [Lv. 330]"
            NaemQuest = "MagmaQuest"
            LevelQuest = 2
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998)
            PosQuest = Vector3.new(-5316.55859, 12.2370615, 8517.2998)
            CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293)
            PosMon = Vector3.new(-5787.99023, 120.864456, 8762.25293)
        elseif MyLevel == 375 or MyLevel <= 399 then 
            Ms = "Fishman Warrior [Lv. 375]"
            NaemQuest = "FishmanQuest"
            LevelQuest = 1
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
            PosQuest = Vector3.new(61122.5625, 18.4716396, 1568.16504)
            CFrameMon = CFrame.new(61163.8515625, 5.3073043823242, 1819.7841796875)
            PosMon = Vector3.new(61163.8515625, 5.3073043823242, 1819.7841796875)
            if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif MyLevel == 400 or MyLevel <= 449 then 
            Ms = "Fishman Commando [Lv. 400]"
            NaemQuest = "FishmanQuest"
            LevelQuest = 2
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
            PosQuest = Vector3.new(61122.5625, 18.4716396, 1568.16504)
            CFrameMon = CFrame.new(61163.8515625, 5.3073043823242, 1819.7841796875)
            PosMon = Vector3.new(61163.8515625, 5.3073043823242, 1819.7841796875)
            if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif MyLevel == 450 or MyLevel <= 474 then 
            Ms = "God's Guard [Lv. 450]"
            NaemQuest = "SkyExp1Quest"
            LevelQuest = 1
            NameMon = "God's Guards"
            CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
            PosQuest = Vector3.new(-4721.71436, 845.277161, -1954.20105)
            CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
            PosMon = Vector3.new(-4716.95703, 853.089722, -1933.925427)
            if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
			end
        elseif MyLevel == 475 or MyLevel <= 524 then 
            Ms = "Shanda [Lv. 475]"
            NaemQuest = "SkyExp1Quest"
            LevelQuest = 2
            NameMon = "Shandas"
            CFrameQuest = CFrame.new(-7863.63672, 5545.49316, -379.826324)
            PosQuest = Vector3.new(-7863.63672, 5545.49316, -379.826324)
            CFrameMon = CFrame.new(-7685.12354, 5601.05127, -443.171509)
            PosMon = Vector3.new(-7685.12354, 5601.05127, -443.171509)
            if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
			end
        elseif MyLevel == 525 or MyLevel <= 549 then 
            Ms = "Royal Squad [Lv. 525]"
            NaemQuest = "SkyExp2Quest"
            LevelQuest = 1
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802)
            PosQuest = Vector3.new(-7902.66895, 5635.96387, -1411.71802)
            CFrameMon = CFrame.new(-7685.02051, 5606.87842, -1442.729)
            PosMon = Vector3.new(-7685.02051, 5606.87842, -1442.729)
        elseif MyLevel == 550 or MyLevel <= 624 then 
            Ms = "Royal Soldier [Lv. 550]"
            NaemQuest = "SkyExp2Quest"
            LevelQuest = 2
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802)
            PosQuest = Vector3.new(-7902.66895, 5635.96387, -1411.71802)
            CFrameMon = CFrame.new(-7864.44775, 5661.94092, -1708.22351)
            PosMon = Vector3.new(-7864.44775, 5661.94092, -1708.22351)
        elseif MyLevel == 625 or MyLevel <= 649 then 
            Ms = "Galley Pirate [Lv. 625]"
            NaemQuest = "FountainQuest"
            LevelQuest = 1
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678)
            PosQuest = Vector3.new(5254.60156, 38.5011406, 4049.69678)
            CFrameMon = CFrame.new(5595.06982, 41.5013695, 3961.47095)
            PosMon = Vector3.new(5595.06982, 41.5013695, 3961.47095)
        elseif MyLevel >= 650 then 
            Ms = "Galley Captain [Lv. 650]"
            NaemQuest = "FountainQuest"
            LevelQuest = 2
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678)
            PosQuest = Vector3.new(5254.60156, 38.5011406, 4049.69678)
            CFrameMon = CFrame.new(5658.5752, 38.5361786, 4928.93506)
            PosMon = Vector3.new(5658.5752, 38.5361786, 4928.93506)
        end
    end
    if NewWorld then
        if MyLevel == 700 or MyLevel <= 724 then 
            Ms = "Raider [Lv. 700]"
            NaemQuest = "Area1Quest"
            LevelQuest = 1
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589)
            PosQuest = Vector3.new(-424.080078, 73.0055847, 1836.91589)
            CFrameMon = CFrame.new(-737.026123, 39.1748352, 2392.57959)
            PosMon = Vector3.new(-737.026123, 39.1748352, 2392.57959)
        elseif MyLevel == 725 or MyLevel <= 774 then 
            Ms = "Mercenary [Lv. 725]"
            NaemQuest = "Area1Quest"
            LevelQuest = 2
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589)
            PosQuest = Vector3.new(-424.080078, 73.0055847, 1836.91589)
            CFrameMon = CFrame.new(-973.731995, 95.8733215, 1836.46936)
            PosMon = Vector3.new(-973.731995, 95.8733215, 1836.46936)
        elseif MyLevel == 775 or MyLevel <= 874 then 
            Ms = "Swan Pirate [Lv. 775]"
            NaemQuest = "Area2Quest"
            LevelQuest = 1
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321)
            PosQuest = Vector3.new(632.698608, 73.1055908, 918.666321)
            CFrameMon = CFrame.new(970.369446, 142.653198, 1217.3667)
            PosMon = Vector3.new(970.369446, 142.653198, 1217.3667)
        elseif MyLevel == 875 or MyLevel <= 899 then 
            Ms = "Marine Lieutenant [Lv. 875]"
            NaemQuest = "MarineQuest3"
            LevelQuest = 1
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523)
            PosQuest = Vector3.new(-2442.65015, 73.0511475, -3219.11523)
            CFrameMon = CFrame.new(-3069.66, 101.71, -3171.04)
            PosMon = Vector3.new(-3069.66, 101.71, -3171.04)
        elseif MyLevel == 900 or MyLevel <= 949 then 
            Ms = "Marine Captain [Lv. 900]"
            NaemQuest = "MarineQuest3"
            LevelQuest = 2
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523)
            PosQuest = Vector3.new(-2442.65015, 73.0511475, -3219.11523)
            CFrameMon = CFrame.new(-1868.67688, 73.0011826, -3321.66333)
            PosMon = Vector3.new(-1868.67688, 73.0011826, -3321.66333)
        elseif MyLevel == 950 or MyLevel <= 974 then 
            Ms = "Zombie [Lv. 950]"
            NaemQuest = "ZombieQuest"
            LevelQuest = 1
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571)
            PosQuest = Vector3.new(-5492.79395, 48.5151672, -793.710571)
            CFrameMon = CFrame.new(-5634.83838, 126.067039, -697.665039)
            PosMon = Vector3.new(-5634.83838, 126.067039, -697.665039)
        elseif MyLevel == 975 or MyLevel <= 999 then 
            Ms = "Vampire [Lv. 975]"
            NaemQuest = "ZombieQuest"
            LevelQuest = 2
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571)
            PosQuest = Vector3.new(-5492.79395, 48.5151672, -793.710571)
            CFrameMon = CFrame.new(-6030.32031, 6.4377408, -1313.5564)
            PosMon = Vector3.new(-6030.32031, 6.4377408, -1313.5564)
        elseif MyLevel == 1000 or MyLevel <= 1049 then 
            Ms = "Snow Trooper [Lv. 1000]"
            NaemQuest = "SnowMountainQuest"
            LevelQuest = 1
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287)
            PosQuest = Vector3.new(604.964966, 401.457062, -5371.69287)
            CFrameMon = CFrame.new(535.893433, 401.457062, -5329.6958)
            PosMon = Vector3.new(535.893433, 401.457062, -5329.6958)
        elseif MyLevel == 1050 or MyLevel <= 1099 then 
            Ms = "Winter Warrior [Lv. 1050]"
            NaemQuest = "SnowMountainQuest"
            LevelQuest = 2
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287)
            PosQuest = Vector3.new(604.964966, 401.457062, -5371.69287)
            CFrameMon = CFrame.new(1223.7417, 454.575226, -5170.02148)
            PosMon = Vector3.new(1223.7417, 454.575226, -5170.02148)
        elseif MyLevel == 1100 or MyLevel <= 1124 then 
            Ms = "Lab Subordinate [Lv. 1100]"
            NaemQuest = "IceSideQuest"
            LevelQuest = 1
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876)
            PosQuest = Vector3.new(-6060.10693, 15.9868021, -4904.7876)
            CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721)
            PosMon = Vector3.new(-5769.2041, 37.9288292, -4468.38721)
        elseif MyLevel == 1125 or MyLevel <= 1174 then 
            Ms = "Horned Warrior [Lv. 1125]"
            NaemQuest = "IceSideQuest"
            LevelQuest = 2
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876)
            PosQuest = Vector3.new(-6060.10693, 15.9868021, -4904.7876)
            CFrameMon = CFrame.new(-6400.85889, 24.7645149, -5818.63574)
            PosMon = Vector3.new(-6400.85889, 24.7645149, -5818.63574)
        elseif MyLevel == 1175 or MyLevel <= 1199 then 
            Ms = "Magma Ninja [Lv. 1175]"
            NaemQuest = "FireSideQuest"
            LevelQuest = 1
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223)
            PosQuest = Vector3.new(-5431.09473, 15.9868021, -5296.53223)
            CFrameMon = CFrame.new(-5496.65576, 58.6890411, -5929.76855)
            PosMon = Vector3.new(-5496.65576, 58.6890411, -5929.76855)
        elseif MyLevel == 1200 or MyLevel <= 1349 then 
            Ms = "Lava Pirate [Lv. 1200]"
            NaemQuest = "FireSideQuest"
            LevelQuest = 2
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223)
            PosQuest = Vector3.new(-5431.09473, 15.9868021, -5296.53223)
            CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633)
            PosMon = Vector3.new(-5169.71729, 34.1234779, -4669.73633)
        elseif MyLevel == 1250 or MyLevel <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
            Ms = "Ship Deckhand [Lv. 1250]"
            NaemQuest = "ShipQuest1"
            LevelQuest = 1
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
			if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif MyLevel == 1275 or MyLevel <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
            Ms = "Ship Engineer [Lv. 1275]"
            NaemQuest = "ShipQuest1"
            LevelQuest = 2
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
			if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif MyLevel == 1300 or MyLevel <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
            Ms = "Ship Steward [Lv. 1300]"
            NaemQuest = "ShipQuest2"
            LevelQuest = 1
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
			if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif MyLevel == 1325 or MyLevel <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
            Ms = "Ship Officer [Lv. 1325]"
            NaemQuest = "ShipQuest2"
            LevelQuest = 2
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
			if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif MyLevel == 1350 or MyLevel <= 1374 then 
            Ms = "Arctic Warrior [Lv. 1350]"
            NaemQuest = "FrostQuest"
            LevelQuest = 1
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107)
            PosQuest = Vector3.new(5669.43506, 28.2117786, -6482.60107)
            CFrameMon = CFrame.new(5995.07471, 57.3188477, -6183.47314)
            PosMon = Vector3.new(5995.07471, 57.3188477, -6183.47314)
            if _G.AutoFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			end
        elseif MyLevel == 1375 or MyLevel <= 1424 then 
            Ms = "Snow Lurker [Lv. 1375]"
            NaemQuest = "FrostQuest"
            LevelQuest = 2
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107)
            PosQuest = Vector3.new(5669.43506, 28.2117786, -6482.60107)
            CFrameMon = CFrame.new(5518.00684, 60.5559731, -6828.80518)
            PosMon = Vector3.new(5518.00684, 60.5559731, -6828.80518)
        elseif MyLevel == 1425 or MyLevel <= 1449 then 
            Ms = "Sea Soldier [Lv. 1425]"
            NaemQuest = "ForgottenQuest"
            LevelQuest = 1
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943)
            PosQuest = Vector3.new(-3052.99097, 236.881363, -10148.1943)
            CFrameMon = CFrame.new(-3030.3696289063, 191.13464355469, -9859.7958984375)
            PosMon = Vector3.new(-3030.3696289063, 191.13464355469, -9859.7958984375)
        elseif MyLevel >= 1450 then 
            Ms = "Water Fighter [Lv. 1450]"
            NaemQuest = "ForgottenQuest"
            LevelQuest = 2
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943)
            PosQuest = Vector3.new(-3052.99097, 236.881363, -10148.1943)
            CFrameMon = CFrame.new(-3436.7727050781, 290.52191162109, -10503.438476563)
            PosMon = Vector3.new(-3436.7727050781, 290.52191162109, -10503.438476563)
        end
    end
    if ThreeWorld then
        if MyLevel >= 1500 and MyLevel <= 1524 then
            Ms = "Pirate Millionaire [Lv. 1500]"
            NaemQuest = "PiratePortQuest"
            LevelQuest = 1
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984)
            PosQuest = Vector3.new(-290.074677, 42.9034653, 5581.58984)
            CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            PosMon = Vector3.new(81.164993286133, 43.755737304688, 5724.7021484375)
        elseif MyLevel >= 1525 and MyLevel <= 1574 then
            Ms = "Pistol Billionaire [Lv. 1525]"
            NaemQuest = "PiratePortQuest"
            LevelQuest = 2
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984)
            PosQuest = Vector3.new(-290.074677, 42.9034653, 5581.58984)
            CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            PosMon = Vector3.new(81.164993286133, 43.755737304688, 5724.7021484375)
        elseif MyLevel >= 1575 and MyLevel <= 1599 then
            Ms = "Dragon Crew Warrior [Lv. 1575]"
            NaemQuest = "AmazonQuest"
            LevelQuest = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563)
            PosQuest = Vector3.new(5832.83594, 51.6806107, -1101.51563)
            CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
            PosMon = Vector3.new(6241.9951171875, 51.522083282471, -1243.9771728516)
        elseif MyLevel >= 1600 and MyLevel <= 1624 then
            Ms = "Dragon Crew Archer [Lv. 1600]"
            NaemQuest = "AmazonQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563)
            PosQuest = Vector3.new(5832.83594, 51.6806107, -1101.51563)
            CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
            PosMon = Vector3.new(6488.9155273438, 383.38375854492, -110.66246032715)
        elseif MyLevel >= 1625 and MyLevel <= 1649 then
            Ms = "Female Islander [Lv. 1625]"
            NaemQuest = "AmazonQuest2"
            LevelQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676)
            PosQuest = Vector3.new(5448.86133, 601.516174, 751.130676)
            CFrameMon = CFrame.new(5825.2241210938, 682.89245605469, 704.57958984375)
            PosMon = Vector3.new(5825.2241210938, 682.89245605469, 704.57958984375)
        elseif MyLevel >= 1650 and MyLevel <= 1699 then
            Ms = "Giant Islander [Lv. 1650]"
            NaemQuest = "AmazonQuest2"
            LevelQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676)
            PosQuest = Vector3.new(5448.86133, 601.516174, 751.130676)
            CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
            PosMon = Vector3.new(4530.3540039063, 656.75695800781, -131.60952758789)
        elseif MyLevel >= 1700 and MyLevel <= 1724 then
            Ms = "Marine Commodore [Lv. 1700]"
            NaemQuest = "MarineTreeIsland"
            LevelQuest = 1
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498)
            PosQuest = Vector3.new(2180.54126, 27.8156815, -6741.5498)
            CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
            PosMon = Vector3.new(2490.0844726563, 190.4232635498, -7160.0502929688)
        elseif MyLevel >= 1725 and MyLevel <= 1774 then
            Ms = "Marine Rear Admiral [Lv. 1725]"
            NaemQuest = "MarineTreeIsland"
            LevelQuest = 2
            NameMon = "Marine Rear Admiral"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498)
            PosQuest = Vector3.new(2180.54126, 27.8156815, -6741.5498)
            CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
            PosMon = Vector3.new(3951.3903808594, 229.11549377441, -6912.81640625)
        elseif MyLevel >= 1775 and MyLevel <= 1799 then
            Ms = "Fishman Raider [Lv. 1775]"
            NaemQuest = "DeepForestIsland3"
            LevelQuest = 1
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosQuest = Vector3.new(-10581.6563, 330.872955, -8761.18652)
            CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
            PosMon = Vector3.new(-10322.400390625, 390.94473266602, -8580.0908203125)
        elseif MyLevel >= 1800 and MyLevel <= 1824 then
            Ms = "Fishman Captain [Lv. 1800]"
            NaemQuest = "DeepForestIsland3"
            LevelQuest = 2
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosQuest = Vector3.new(-10581.6563, 330.872955, -8761.18652)
            CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
            PosMon = Vector3.new(-11194.541992188, 442.02795410156, -8608.806640625)
        elseif MyLevel >= 1825 and MyLevel <= 1849 then
            Ms = "Forest Pirate [Lv. 1825]"
            NaemQuest = "DeepForestIsland"
            LevelQuest = 1
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137)
            PosQuest = Vector3.new(-13234.04, 331.488495, -7625.40137)
            CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
            PosMon = Vector3.new(-13225.809570313, 428.19387817383, -7753.1245117188)
        elseif MyLevel >= 1850 and MyLevel <= 1899 then
            Ms = "Mythological Pirate [Lv. 1850]"
            NaemQuest = "DeepForestIsland"
            LevelQuest = 2
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137)
            PosQuest = Vector3.new(-13234.04, 331.488495, -7625.40137)
            CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
            PosMon = Vector3.new(-13869.172851563, 564.95251464844, -7084.4135742188)
        elseif MyLevel >= 1900 and MyLevel <= 1924 then
            Ms = "Jungle Pirate [Lv. 1900]"
            NaemQuest = "DeepForestIsland2"
            LevelQuest = 1
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            PosQuest = Vector3.new(-12680.3818, 389.971039, -9902.01953)
            CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
            PosMon = Vector3.new(-11982.221679688, 376.32522583008, -10451.415039063)
        elseif MyLevel >= 1925 and MyLevel <= 1974 then
            Ms = "Musketeer Pirate [Lv. 1925]"
            NaemQuest = "DeepForestIsland2"
            LevelQuest = 2
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            PosQuest = Vector3.new(-12680.3818, 389.971039, -9902.01953)
            CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
            PosMon = Vector3.new(-13282.3046875, 496.23684692383, -9565.150390625)
        elseif MyLevel >= 1975 and MyLevel <= 1999 then
            Ms = "Reborn Skeleton [Lv. 1975]"
            NaemQuest = "HauntedQuest1"
            LevelQuest = 1
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            PosQuest = Vector3.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
            PosMon = Vector3.new(-8817.880859375, 191.16761779785, 6298.6557617188)
        elseif MyLevel >= 2000 and MyLevel <= 2024 then
            Ms = "Living Zombie [Lv. 2000]"
            NaemQuest = "HauntedQuest1"
            LevelQuest = 2
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            PosQuest = Vector3.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
            PosMon = Vector3.new(-10125.234375, 183.94705200195, 6242.013671875)
        elseif MyLevel >= 2025 and MyLevel <= 2049  then
            Ms = "Demonic Soul [Lv. 2025]"
            NaemQuest = "HauntedQuest2"
            LevelQuest = 1
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            PosQuest = Vector3.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
            PosMon = Vector3.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif MyLevel >= 2050 and MyLevel <= 2074  then
            Ms = "Posessed Mummy [Lv. 2050]"
            NaemQuest = "HauntedQuest2"
            LevelQuest = 2
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            PosQuest = Vector3.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
            PosMon = Vector3.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif MyLevel >= 2075 and MyLevel <= 2099  then
            Ms = "Peanut Scout [Lv. 2075]"
            NaemQuest = "NutsIslandQuest"
            LevelQuest = 1
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            PosQuest = Vector3.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2126.47998, 192.095154, -10204.6553, 0.0779861137, -9.29044361e-08, 0.996954441, 6.59006432e-08, 1, 8.80332109e-08, -0.996954441, 5.88345728e-08, 0.0779861137)    
            PosMon = Vector3.new(-2126.47998, 192.095154, -10204.6553, 0.0779861137, -9.29044361e-08, 0.996954441, 6.59006432e-08, 1, 8.80332109e-08, -0.996954441, 5.88345728e-08, 0.0779861137)
        elseif MyLevel >= 2100 and MyLevel <= 2124  then
            Ms = "Peanut President [Lv. 2100]"
            NaemQuest = "NutsIslandQuest"
            LevelQuest = 2
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            PosQuest = Vector3.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2126.47998, 192.095154, -10204.6553, 0.0779861137, -9.29044361e-08, 0.996954441, 6.59006432e-08, 1, 8.80332109e-08, -0.996954441, 5.88345728e-08, 0.0779861137)    
            PosMon = Vector3.new(-2126.47998, 192.095154, -10204.6553, 0.0779861137, -9.29044361e-08, 0.996954441, 6.59006432e-08, 1, 8.80332109e-08, -0.996954441, 5.88345728e-08, 0.0779861137)
        elseif MyLevel >= 2125 and MyLevel <= 2149  then
            Ms = "Ice Cream Chef [Lv. 2125]"
            NaemQuest = "IceCreamIslandQuest"
            LevelQuest = 1
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            PosQuest = Vector3.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)    
            PosMon = Vector3.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        elseif MyLevel >= 2150 then
            Ms = "Ice Cream Commander [Lv. 2150]"
            NaemQuest = "IceCreamIslandQuest"
            LevelQuest = 2
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            PosQuest = Vector3.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)    
            PosMon = Vector3.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        end
    end
end
	CheckQuest()
	function EquipWeapon(ToolSe)
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.4)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		end
	end
	
	spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and (_G.NoClip or _G.AutoFarm or _G.Observation or _G.AutoNew or _G.Factory or _G.GunMastery or _G.Mastery or FramBoss or FramAllBoss or _G.AutoBartilo or _G.MobAura or _G.AutoRengoku or _G.AutoSharkman or _G.Ectoplasm or _G.PoleHop or _G.SwanHop or _G.BlackBeardHop or _G.Chest or _G.Electro or rainbowhaki or Hunter or observationv2 or _G.ElitehuntHop or _G.EliteHunt or _G.Pole or _G.Tushitahop or _G.YamaHop or _G.StoreFruit or _G.HolyTorch)  then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.NoClip or _G.AutoFarm or _G.Observation or _G.AutoNew or _G.Factory or _G.GunMastery or _G.Mastery or FramBoss or FramAllBoss or _G.AutoBartilo or _G.MobAura or _G.AutoRengoku or _G.AutoSharkman or _G.Ectoplasm or _G.PoleHop or _G.SwanHop or _G.BlackBeardHop or _G.Chest or _G.Electro or rainbowhaki or Hunter or observationv2 or _G.ElitehuntHop or _G.EliteHunt or _G.Pole or _G.Tushitahop or _G.YamaHop or _G.StoreFruit or _G.HolyTorch then
            if not game:GetService("Workspace"):FindFirstChild("LOL") then
                local LOL = Instance.new("Part")
                LOL.Name = "LOL"
                LOL.Parent = game.Workspace
                LOL.Anchored = true
                LOL.Transparency = 1
                LOL.Size = Vector3.new(30,-0.5,30)
            elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
            end
        else
            if game:GetService("Workspace"):FindFirstChild("LOL") then
                game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
            end
        end
    end)
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.NoClip or _G.AutoFarm or _G.Observation or _G.AutoNew or _G.Factory or _G.GunMastery or _G.Mastery or FramBoss or FramAllBoss or _G.AutoBartilo or _G.MobAura or _G.AutoRengoku or _G.AutoSharkman or _G.Ectoplasm or _G.PoleHop or _G.SwanHop or _G.BlackBeardHop or _G.Chest or _G.Electro or rainbowhaki or Hunter or observationv2 or _G.ElitehuntHop or _G.EliteHunt or _G.Pole or _G.Tushitahop or _G.YamaHop or _G.StoreFruit or _G.HolyTorch then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

	page1:CreateToggle("Auto Farm",function(vu)
		_G.AutoFarm = vu
		_G.FastFarm = vu
		_G.Main = vu 
	end)

	page1:CreateToggle("Auto Quest",function(x)
		AutoQuest = x
	end)

	spawn(function()
		while wait() do
			if _G.AutoFarm then
				autofarm()
			end
		end
	end)
	game:GetService("RunService").Heartbeat:Connect(
	function()
		if _G.NoClip or _G.AutoFarm or _G.Observation or _G.AutoNew or _G.Factory or _G.GunMastery or _G.Mastery or FramBoss or FramAllBoss or _G.AutoBartilo or _G.MobAura or _G.AutoRengoku or _G.AutoSharkman or _G.Ectoplasm or _G.PoleHop or _G.SwanHop or _G.BlackBeardHop or _G.Chest or _G.Electro or rainbowhaki or Hunter or observationv2 or _G.ElitehuntHop or _G.EliteHunt or _G.Pole or _G.Tushitahop or _G.YamaHop or _G.StoreFruit or _G.HolyTorch then
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end
	end
	)
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local VirtualUser = game:GetService('VirtualUser')

function totarget(CFgo)
    pcall(function()
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
        tween:Play()
    end)
    if not tween then return err end
    end)
   
end

function StopTween()
	pcall(function()
		tween:Cancel()
		_G.StopTween = true
		_G.NoClip = false
		wait()
		_G.StopTween = false
	end)
end

function autofarm()
    pcall(function()
	if _G.AutoFarm then
		if AutoQuest then
			if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				StopTween()
				StatrMagnet = false
				CheckQuest()
				repeat totarget(CFrameQuest) wait() until _G.StopTween == true or not _G.AutoFarm or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 8
				wait(0.9)
				if _G.AutoFarm then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
				end
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				CheckQuest()
				if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
					pcall(function()
							for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								CheckQuest()  
								if v.Name == Ms then
									repeat wait()
										spawn(function()
											if game:GetService("Workspace").Enemies:FindFirstChild(Ms) and v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") then
												if LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameMon) then
													totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
													PosHee = v.HumanoidRootPart.CFrame
													EquipWeapon(_G.SelectWeapon)
													PosHee = v.HumanoidRootPart.CFrame
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
													StatrMagnet = true
												else
													StopTween()
													local args = {
														[1] = "AbandonQuest"
													 }
													 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
												end  
											else
												CheckQuest() 
												StatrMagnet = false
												repeat totarget(CFrameMon) wait() until _G.StopTween == true or not _G.AutoFarm or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 8
											end 
										end)
									until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFarm == false or LocalPlayer.PlayerGui.Main.Quest.Visible == false
									CheckQuest() 
									StatrMagnet = false
								end
							end
						end
					)
				else
					CheckQuest()
					StatrMagnet = false
					repeat totarget(CFrameMon) wait() until _G.StopTween == true or not _G.AutoFarm or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 8
				end 
			end
		else
			CheckQuest()
			if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
				pcall(
					function()
						for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							CheckQuest() 
							if v.Name == Ms then
								repeat wait()
									if game:GetService("Workspace").Enemies:FindFirstChild(Ms) and v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") then
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										EquipWeapon(_G.SelectWeapon)
										PosHee = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
										StatrMagnet = true
									else
										CheckQuest() 
										StatrMagnet = false
										repeat totarget(CFrameMon) wait() until _G.StopTween == true or not _G.AutoFarm or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 8
									end 
								until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFarm == false
								CheckQuest() 
								StatrMagnet = false
							end
						end
					end
				)
			else
				CheckQuest()
				StatrMagnet = false
				repeat totarget(CFrameMon) wait() until _G.StopTween == true or not _G.AutoFarm or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 8
		     	end 
		    end
	    end
	end)
end
     
     spawn(function()
while wait() do
	if _G.EquipMelee then
		pcall(function()
			for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			   if v.ToolTip == "Melee" then
			  if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
				  local ToolSe = tostring(v.Name)
				 local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
				 wait(.4)
				 game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
			  end
			   end
			end
		end)
end
end
end)

	spawn(function()
		while wait() do
			pcall(function()
        		if _G.AutoNew == true then
            		if _G.SelectWeapon == nil then
                        _G.EquipMelee  = true
            		end
		        else 
		            _G.EquipMelee = false
				end
			end)
		end
	end)


spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastFarm then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastFarm then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
end)

	-- Auto New World
	if OldWorld then
		page1:CreateToggle("Auto Second Sea",function(x)
			_G.AutoNew = x
		end)
	end
	
		spawn(function()
			game:GetService("RunService").Heartbeat:connect(function()
				pcall(function()
					if _G.AutoNew then
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
							game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end
				end)
			end)
		end)
	
		spawn(function()
			while wait(.1) do
				if _G.AutoNew then
					if OldWorld then
						local MyLevel = game.Players.localPlayer.Data.Level.Value
						if MyLevel >= 700 and OldWorld then
							_G.AutoFarm = false
							_G.SelectWeapon = "Key"
							repeat wait()
								totarget(CFrame.new(4849.29883, 5.65138149, 719.611877))
							until _G.StopTween == true or not _G.AutoNew or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(4849.29883, 5.65138149, 719.611877).Position).Magnitude <= 10
							wait(0.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
							wait(0.5)
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
								local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
								wait(.4)
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
							end
							repeat wait()
								totarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
							until _G.StopTween == true or not _G.AutoNew or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(1347.7124, 37.3751602, -1325.6488).Position).Magnitude <= 10
							wait(0.5)
							Click()
							if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
								CheckBoss = true
								_G.SelectWeapon = _G.SelectToolWeaponOld
								EquipWeapon(_G.SelectWeapon)
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
								end
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
										end
										repeat wait(.1)
											pcall(function()
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.BrickColor = BrickColor.new("White")
												v.HumanoidRootPart.CanCollide = false
												totarget(v.HumanoidRootPart.CFrame*CFrame.new(0, 10, 10))
												Click()
											end)
										until not CheckBoss or not v.Parent or v.Humanoid.Health <= 0
									end
								end
								CheckBoss = false
								wait(0.5)
								repeat wait()
									totarget(CFrame.new(-1166.23743, 7.65220165, 1728.36487))
								until (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - CFrame.new(-1166.23743, 7.65220165, 1728.36487).Position).Magnitude <= 10
								wait(0.5)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
							else
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
									local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
									wait(.4)
									game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
								end
								totarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
							end
						end
					end
				end
			end
		end)


if NewWorld then
	page13:CreateToggle("Auto Open Swan+Hop",function (t)
_G.OpenSwan = t
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
	if v:IsA("Tool") then
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
	end
end
end)
millionfruit = {
	"Dragon Fruit",
	"Control Fruit",
	"Dough Fruit",
	"Gravity Fruit",
	"Paw Fruit",
	"Rumble Fruit",
	"String Fruit",
	"Quake Fruit",
	"Venom Fruit",
}
function hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

	spawn(function()
		while wait() do
			if _G.OpenSwan then
				for i,v in pairs(millionfruit) do
					if game.Players.LocalPlayer.Character:FindFirstChild(v) then
						repeat totarget(CFrame.new(-342.28921508789, 331.8864440918, 643.62438964844)) wait() until _G.StopTween == true or not AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-342.28921508789, 331.8864440918, 643.62438964844)).Magnitude <= 10
						wait(1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
					else
						hop()
					end
				end
			end        
		end
	end)
end

	if NewWorld then
		page13:CreateToggle("Auto Rengoku",function(v)
			_G.AutoRengoku = v
		end)
			spawn(function()
				while wait() do
					if _G.AutoRengoku then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or  game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
							EquipWeapon("Hidden Key")
							totarget(CFrame.new(6571.81885, 296.689758, -6966.76514))
						elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if v.Name == "Snow Lurker [Lv. 1375]" and v.Humanoid.Health > 0 then
									repeat wait()
										if game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											PosMonRengoku = v.HumanoidRootPart.CFrame
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
											VirtualUser:CaptureController()
											VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
											StatrMagnetRengoku = true
										else
											StatrMagnetRengoku = false
											totarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
										end
									until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
									StatrMagnetRengoku = false
									totarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
								end
							end
						else
							StatrMagnetRengoku = false
							totarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
						end
					end
				end
			end)
	    end

	if NewWorld then
		page13:CreateToggle("Auto Sea 3",function(value)
			local args = {
				[1] = "AbandonQuest"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			Sea3 = value
			Sea33 = value
			Check = true
			Checka = true
		end)
	end

	spawn(function()
		while wait() do
			pcall(function()
				if Sea3 and Checka then
					if NewWorld then
						local MyLevel = game.Players.localPlayer.Data.Level.Value
						if MyLevel >= 1500 then
							Sea33 = false
							if Check then
								repeat totarget(CFrame.new(-1925.56482, 12.8456564, 1737.36609)) wait() until _G.StopTween == true or not Sea3 or Sea33 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1925.56482, 12.8456564, 1737.36609)).Magnitude <= 10
							end
							Check = false
							wait(0.5)
							local args = {
								[1] = "ZQuestProgress",
								[2] = "Check"
							}

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							local args = {
								[1] = "ZQuestProgress",
								[2] = "Begin"
							}

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							Checka = false
						end
					end
				end
			end)
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if Sea3 and Checka == false then
					for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "rip_indra [Lv. 1500] [Boss]" then
							for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "rip_indra [Lv. 1500] [Boss]" then
									repeat wait()
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))										
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
										EquipWeapon(_G.SelectWeapon)
										Click()
										spawn(function()
											wait(1)
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
										end)
									until v.Humanoid.Health <= 0 or Sea3 == false
								end
							end
							repeat totarget(CFrame.new(-26640.7559, 6.94934607, 439.43512)) wait() until _G.StopTween == true or not Sea3 or Sea33 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-26640.7559, 6.94934607, 439.43512)).Magnitude <= 10
						end
					end
				end
			end)
		end
	end)

	if NewWorld then
		page13:CreateToggle("Auto Factory",function(vu)
			_G.Factory = vu
			while _G.Factory do wait()
				if game.Workspace.Enemies:FindFirstChild("Core") then
					_G.Core = true
					_G.AutoFarm = false
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.Core and v.Name == "Core" and v.Humanoid.Health > 0 then
							repeat wait(.1)
								repeat totarget(CFrame.new(448.46756, 199.356781, -441.389252)) wait() until _G.StopTween == true or not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
								EquipWeapon(_G.SelectWeapon)
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
							until not _G.Core or v.Humanoid.Health <= 0  or _G.Factory == false
						end
					end
				elseif game.ReplicatedStorage:FindFirstChild("Core") then
					_G.Core = true
					_G.AutoFarm = false
					repeat totarget(CFrame.new(448.46756, 199.356781, -441.389252)) wait() until _G.StopTween == true or not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
				elseif _G.Main then
					_G.Core = false
					_G.AutoFarm = true
				end
			end
		end)
	end

	function EquipWeapon(ToolSe)
	    pcall(function()
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.4)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		    end
		end)
	end

	if OldWorld then
		page13:CreateToggle("Auto Saber",function(Value)
			_G.AutoSaber = Value
		end)

	spawn(function()
		while wait(.1) do
			if _G.AutoSaber then
				local off = game:GetService("Workspace").Map.Jungle.Final:FindFirstChild("Part")
				local MyLevel = game.Players.localPlayer.Data.Level.Value
				if MyLevel >= 200 and _G.AutoFarm == true then
					repeat wait(.1)
						_G.AutoFarm = false
						function accept1()
							local string_1 = "ProQuestProgress";
							local string2 = "SickMan";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string_2);
						end

						function accept2()
							local string_1 = "ProQuestProgress";
							local string2 = "RichSon";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string2);
						end
						function saber()
							if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Mob Leader [Lv. 120] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
										repeat wait()
											pcall(function()
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													local args = {
														[1] = "Buso"
													}
													game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
												end
												EquipWeapon(_G.SelectWeapon)
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.CanCollide = false
												totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											end)
										until v.Humanoid.Health == 0
									end
								end
							end

							function accept3()
								local string_1 = "ProQuestProgress";
								local string2 = "RichSon";
								local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
								Target:InvokeServer(string_1, string_2);
							end

							wait(.1)
							repeat totarget(CFrame.new(-1421.87024, 55.4666862, 21.7750397)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1421.87024, 55.4666862, 21.7750397)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1647.19556, 29.1544189, 438.299408)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1647.19556, 29.1544189, 438.299408)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1324.10144, 31.4560413, -461.404114)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1324.10144, 31.4560413, -461.404114)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1152.38464, 9.74718285, -700.309875)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1152.38464, 9.74718285, -700.309875)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1180.89563, 21.0007095, 187.861374)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1180.89563, 21.0007095, 187.861374)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1610.00757, 11.5049858, 164.001587)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1610.00757, 11.5049858, 164.001587)).Magnitude <= 10
							wait(2)
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Torch")
							wait(.4)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
							wait(.1)
							repeat totarget(CFrame.new(1114.55762, 4.9214654, 4349.2334)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.55762, 4.9214654, 4349.2334)).Magnitude <= 10
							wait(5.5)
							repeat totarget(CFrame.new(1114.26721, 4.16943789, 4366.15332)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.26721, 4.16943789, 4366.15332)).Magnitude <= 10
							wait(1)
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Cup")
							wait(.4)
							EquipWeapon("Cup")
							wait(1)
							repeat totarget(CFrame.new(1397.0614, 37.3480072, -1321.03955)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1397.0614, 37.3480072, -1321.03955)).Magnitude <= 10
							wait(4.5)
							repeat totarget(CFrame.new(1457.87976, 88.2521744, -1390.39575)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1457.87976, 88.2521744, -1390.39575)).Magnitude <= 10
							wait(1.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
							wait(1)
							repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
							wait(1)
							repeat totarget(CFrame.new(-2852.90234, 7.56227827, 5367.72412)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-2852.90234, 7.56227827, 5367.72412)).Magnitude <= 10
							wait(1.5)
							EquipWeapon(_G.SelectWeapon)
							wait(1)
							saber()
							wait(2)
							repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")
							wait(1)
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Relic")
							wait(.4)
							EquipWeapon("Relic")
							wait(1)
							repeat totarget(CFrame.new(-1405.84094, 29.8519993, 5.05432224)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1405.84094, 29.8519993, 5.05432224)).Magnitude <= 10
							
							wait(1)
							if off.CanCollide == false then
								_G.AutoSaber = false
								_G.AutoFarm = true
							end
						end
					until _G.AutoSaber == false or off.CanCollide == false or _G.AutoFarm == true

				elseif MyLevel >= 200 then
					repeat wait(.1)
						function accept1()
							local string_1 = "ProQuestProgress";
							local string2 = "SickMan";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string_2);
						end

						function accept2()
							local string_1 = "ProQuestProgress";
							local string2 = "RichSon";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string2);
						end
						function saber()
							for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Mob Leader [Lv. 120] [Boss]" then
									repeat wait()
										for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if v.Name == "Mob Leader [Lv. 120] [Boss]" then
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													local args = {
														[1] = "Buso"
													}
													game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
												end
												_G.FastBoss = true
												EquipWeapon(_G.SelectWeapon)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
												game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
											end
										end
									until v.Humanoid.Health == 0
									_G.FastBoss = false
								end
							end
						end

						function accept3()
							local string_1 = "ProQuestProgress";
							local string2 = "RichSon";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string_2);
						end

						wait(.1)
						repeat totarget(CFrame.new(-1421.87024, 55.4666862, 21.7750397)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1421.87024, 55.4666862, 21.7750397)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1647.19556, 29.1544189, 438.299408)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1647.19556, 29.1544189, 438.299408)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1324.10144, 31.4560413, -461.404114)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1324.10144, 31.4560413, -461.404114)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1152.38464, 9.74718285, -700.309875)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1152.38464, 9.74718285, -700.309875)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1180.89563, 21.0007095, 187.861374)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1180.89563, 21.0007095, 187.861374)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1610.00757, 11.5049858, 164.001587)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1610.00757, 11.5049858, 164.001587)).Magnitude <= 10
						wait(2)
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Torch")
						wait(.4)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
						wait(.1)
						repeat totarget(CFrame.new(1114.55762, 4.9214654, 4349.2334)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.55762, 4.9214654, 4349.2334)).Magnitude <= 10
						wait(5.5)
						repeat totarget(CFrame.new(1114.26721, 4.16943789, 4366.15332)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.26721, 4.16943789, 4366.15332)).Magnitude <= 10
						wait(1)
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Cup")
						wait(.4)
						EquipWeapon("Cup")
						wait(1)
						repeat totarget(CFrame.new(1397.0614, 37.3480072, -1321.03955)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1397.0614, 37.3480072, -1321.03955)).Magnitude <= 10
						wait(4.5)
						repeat totarget(CFrame.new(1457.87976, 88.2521744, -1390.39575)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1457.87976, 88.2521744, -1390.39575)).Magnitude <= 10
						wait(1.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
						wait(1)
						repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
						wait(1)
						repeat totarget(CFrame.new(-2852.90234, 7.56227827, 5367.72412)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-2852.90234, 7.56227827, 5367.72412)).Magnitude <= 10
						wait(1.5)
						EquipWeapon(_G.SelectWeapon)
						wait(1)
						saber()
						wait(2)
						repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")
						wait(1)
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Relic")
						wait(.4)
						EquipWeapon("Relic")
						wait(1)
						repeat totarget(CFrame.new(-1405.84094, 29.8519993, 5.05432224)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1405.84094, 29.8519993, 5.05432224)).Magnitude <= 10
						if off.CanCollide == false then
							_G.AutoSaber = false
						end
					until _G.AutoOpenSaber == false or off.CanCollide == false
					if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Saber Expert [Lv. 200] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat wait()
									pcall(function()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
										v.HumanoidRootPart.CanCollide = false
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end)
								until _G.AutoSaber == true or v.Humanoid.Health <= 0
							end
						end
					end
				end
			end
		end
	end)
end

	page13:CreateToggle("Auto Superhuman",function(vu)
		_G.Superhuman = vu
	end)
	spawn(function()
		while wait() do wait()
			if _G.Superhuman then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end   
				if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
					_G.SelectWeapon = "Superhuman"
				end  
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
						_G.SelectWeapon = "Black Leg"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
						_G.SelectWeapon = "Electro"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
						_G.SelectWeapon = "Fishman Karate"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
						_G.SelectWeapon = "Dragon Claw"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "1"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "2"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "1"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "2"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
						local args = {
							[1] = "BuySuperhuman"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
						local args = {
							[1] = "BuySuperhuman"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end 
				end
			end
		end
	end)

         --	spawn(function()
         --		pcall(function()
         --		while wait(.1) do
         --			if _G.Superhuman then
         --				local args = {
         --					[1] = "BuySuperhuman"
         --				}
         --				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         --				-----------------
         --				local MyLevel = game.Players.LocalPlayer.Data.Level.Value
         --				if MyLevel >= 1100 then
         --					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
         --				_G.autoraid = false
         --					else
		 --						_G.AutoFarm = false
         --						_G.CHIP = "Flame"
		 --						_G.autoraid = true
         --							local args = {
         --								[1] = "BlackbeardReward",
         --								[2] = "DragonClaw",
         --								[3] = "1"
         --							}
         --						
         --							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         --							local args = {
         --								[1] = "BlackbeardReward",
         --								[2] = "DragonClaw",
         --								[3] = "2"
         --							}
         --						
         --							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         --					end
         --				end
       --  			end
    --     		end
  --       	end)
 --       end) 

page13:CreateToggle("Auto Death Step",function(vu)
		_G.DeathStep = vu
	end)
	spawn(function()
		while wait() do wait()
			if _G.DeathStep then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
						local args = {
							[1] = "BuyDeathStep"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						_G.SelectWeapon = "Death Step"
					end  
					if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
						local args = {
							[1] = "BuyDeathStep"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

						_G.SelectWeapon = "Death Step"
					end  
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
						_G.SelectWeapon = "Black Leg"
					end 
				else 
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end
	end)

	page13:CreateToggle("Auto Electric Claw V2",function(x)
		_G.AutoElectricClawV2 = x
	end)

	spawn(function()
		while wait() do wait()
			if _G.AutoElectricClawV2 then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
						_G.SelectWeapon = "Electric Claw"
					end  
					if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

						_G.SelectWeapon = "Electric Claw"
					end  
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
						_G.SelectWeapon = "Electro"
					end 
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
				end
			end
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if _G.AutoElectricClawV2 then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
							if _G.AutoFarm == false then
								repeat wait()
									totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
								until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
								wait(2)
								repeat wait()
									totarget(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
								until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
								wait(1)
								repeat wait()
									totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
								until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
								wait(1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
							elseif _G.AutoFarm == true then
								_G.AutoFarm = false
								wait(1)
								repeat wait()
									totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
								until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
								wait(2)
								repeat wait()
									totarget(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
								until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
								wait(1)
								repeat wait()
									totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
								until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
								wait(1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
								_G.SelectWeapon = "Electric Claw"
								wait(.1)
								_G.AutoFarm = true
							end
						end
					end
				end
			end)
		end
	end)

	if ThreeWorld then
		page13:CreateToggle("Auto Elite Hunter",function (t)
			_G.EliteHunt = t
		end)
		spawn(function()
			while wait() do
				if  _G.EliteHunt then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					    repeat totarget(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188)).Magnitude <= 10
						wait(.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
					else
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Diablo (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Diablo [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											if setsimulationradius then
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.EliteHunt == false or v.Humanoid.Health <= 0
									end
								end
							else
								spawn(function()
								    totarget(game:GetService("ReplicatedStorage")["Diablo [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Deandre (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Deandre [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											if setsimulationradius then
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.EliteHunt == false or v.Humanoid.Health <= 0
									end
								end
							else
								spawn(function()
								    totarget(game:GetService("ReplicatedStorage")["Deandre [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Urban (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Urban [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											if setsimulationradius then
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.EliteHunt == false or v.Humanoid.Health <= 0
									end
								end
							else
								spawn(function()
								    totarget(game:GetService("ReplicatedStorage")["Urban [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						end
					end
				end
			end
		end)
	end
	if ThreeWorld then
		page13:CreateToggle("Auto Elite Hunter + Hop",function (t)
			_G.ElitehuntHop = t
		end)
		spawn(function()
			while wait() do
				if  _G.ElitehuntHop then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					    repeat totarget(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188)).Magnitude <= 10
						wait(.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
					else
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Diablo (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Diablo [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											if setsimulationradius then
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.ElitehuntHop == false or v.Humanoid.Health <= 0
									end
								end
							else
								spawn(function()
								    totarget(game:GetService("ReplicatedStorage")["Diablo [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Deandre (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Deandre [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											if setsimulationradius then
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.ElitehuntHop == false or v.Humanoid.Health <= 0
									end
								end
							else
								spawn(function()
								    totarget(game:GetService("ReplicatedStorage")["Deandre [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Urban (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Urban [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											if setsimulationradius then
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.ElitehuntHop == false or v.Humanoid.Health <= 0
									end
								end
							else
								spawn(function()
								    totarget(game:GetService("ReplicatedStorage")["Urban [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						end
					end
				end
			end
		end)
	end

	spawn(function()
		while wait() do
			if _G.ElitehuntHop then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
					else
						wait(12)
						if not game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
							local PlaceID = game.PlaceId
							local AllIDs = {}
							local foundAnything = ""
							local actualHour = os.date("!*t").hour
							local Deleted = false
							function TPReturner()
								local Site;
								if foundAnything == "" then
									Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
								else
									Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
								end
								local ID = ""
								if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
									foundAnything = Site.nextPageCursor
								end
								local num = 0;
								for i,v in pairs(Site.data) do
									local Possible = true
									ID = tostring(v.id)
									if tonumber(v.maxPlayers) > tonumber(v.playing) then
										for _,Existing in pairs(AllIDs) do
											if num ~= 0 then
												if ID == tostring(Existing) then
													Possible = false
												end
											else
												if tonumber(actualHour) ~= tonumber(Existing) then
													local delFile = pcall(function()
														-- delfile("NotSameServers.json")
														AllIDs = {}
														table.insert(AllIDs, actualHour)
													end)
												end
											end
											num = num + 1
										end
										if Possible == true then
											table.insert(AllIDs, ID)
											wait()
											pcall(function()
												-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
												wait()
												game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
											end)
											wait(4)
										end
									end
								end
							end
							function Teleport() 
								while wait() do
									pcall(function()
										TPReturner()
										if foundAnything ~= "" then
											TPReturner()
										end
									end)
								end
							end
							Teleport()
						end
					end
				end) 
			end
		end
	end)
	if ThreeWorld then
		page13:CreateToggle("Auto RainbowHaki",function(t)
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
			rainbowhaki = t
		end)
		spawn(function()
			while wait() do
				if rainbowhaki then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						repeat wait()
							totarget(CFrame.new(-11891.202148438, 930.57678222656, -8760.0498046875))
						until _G.StopTween == true or not rainbowhaki or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-11891.202148438, 930.57678222656, -8760.0498046875).Position).Magnitude <= 10
						wait(.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
					else
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Stone (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Stone [Lv. 1550] [Boss]" then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end
								end
							else
							    totarget(CFrame.new(-1109.6944580078, 40.006885528564, 6730.9833984375))
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Island Empress (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Island Empress [Lv. 1675] [Boss]" then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end
								end
							else
							    totarget(CFrame.new(5702.2724609375, 601.94860839844, 201.07873535156))
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Kilo Admiral (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end
								end
							else
							    totarget(CFrame.new(2861.53515625, 423.58441162109, -7254.0751953125))
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Captain Elephant (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end
								end
							else
							    totarget(CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875))
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Beautiful Pirate (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end
								end
							else
							    totarget(CFrame.new(5378.6337890625, 22.56223487854, -26.053804397583))
							end
						end
					end
				end
			end
		end)
	end
	
	page13:CreateToggle("Auto Observation Haki V2",function(x)
		_G.AutoObservationHakiV2 = x
	end)

	spawn(function()
		while wait() do
			if _G.AutoObservationHakiV2 then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					repeat 
						totarget(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
						wait() 
					until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
					wait(1)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
				else
					if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Forest Pirate [Lv. 1825]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										PosHee =  v.HumanoidRootPart.CFrame
										if sethiddenproperty then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										StatrMagnet = true
									until _G.AutoObservationHakiV2 == false or v.Humanoid.Health <= 0
									StatrMagnet = false
								end
							end
						else
							repeat 
								totarget(CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)) 
								wait() 
							until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13277.568359375, 370.34185791016, -7821.1572265625)).Magnitude <= 10
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text ==  "Defeat  Captain Elephant (0/1)" then 
						if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))										
										if sethiddenproperty then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.AutoObservationHakiV2 == false or v.Humanoid.Health <= 0
								end
							end
						else
							repeat 
								totarget(CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)) 
								wait() 
							until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13493.12890625, 318.89553833008, -8373.7919921875)).Magnitude <= 10
						end        
					end
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Banana") and  game.Players.LocalPlayer.Backpack:FindFirstChild("Apple") and game.Players.LocalPlayer.Backpack:FindFirstChild("Pineapple") then
					repeat 
						totarget(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
						wait() 
					until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
				elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game.Players.LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
					repeat 
						totarget(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
						wait() 
					until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
					wait(1)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
				else
					for i,v in pairs(game.Workspace:GetDescendants()) do
						if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
							v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
							wait()
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
							wait()
						end
					end   
				end
			end
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if _G.AutoObservationHakiV2 then
					if sethiddenproperty then
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
					end
				end
			end)
			game:GetService("RunService").Heartbeat:Wait()
		end
	end)

	spawn(function()
		game:GetService("RunService").Heartbeat:connect(function()
			pcall(function()
				if _G.AutoObservationHakiV2 then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
					end
				end
			end)
		end)
	end)

	spawn(function()
		pcall(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				game:GetService("RunService").Heartbeat:Wait()
				if _G.AutoObservationHakiV2 and StatrMagnet then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == "Forest Pirate [Lv. 1825]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
							if v.Name == "Forest Pirate [Lv. 1825]" then
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
								v.HumanoidRootPart.CFrame = PosHee
							end
						end
					end
				end
			end)
		end)
	end)

	spawn(function()
		game:GetService("RunService").Heartbeat:connect(function()
			game:GetService("RunService").Heartbeat:Wait()
			pcall(function()
				if _G.AutoObservationHakiV2 and StatrMagnet then
					CheckQuest()
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == Ms then
							v.Humanoid:ChangeState(11)
						end
					end
				end
			end)
			game:GetService("RunService").Heartbeat:Wait()
		end)
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if _G.AutoObservationHakiV2 and StatrMagnet then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == Ms and v:FindFirstChild("HumanoidRootPart") then
							if not v.HumanoidRootPart:FindFirstChild("BringEE") then
								local bv = Instance.new("BodyVelocity")
								bv.Parent = v.HumanoidRootPart
								bv.Name = "BringEE"
								bv.MaxForce = Vector3.new(100000,100000,100000)
								bv.Velocity = Vector3.new(0,0,0)
							end
						end
					end
				end
			end)
			wait()
		end
	end)


	if ThreeWorld then
		page13:CreateToggle("Auto Yama + Hop",function(t)
			_G.YamaHop = t
		end)
	end

	spawn(function()
		while wait() do
			pcall(function()
				if _G.YamaHop then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
						fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
					else
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							repeat totarget(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)) wait() until _G.StopTween == true or not _G.YamaHop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188)).Magnitude <= 10
							wait(.9)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
						else
							if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Diablo (0/1)" then
								if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Diablo [Lv. 1750]" then
											repeat wait()
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
												end
												EquipWeapon(_G.SelectWeapon)
												totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
												v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												v.Humanoid:ChangeState(11)
												_G.FastBoss = true
											until _G.YamaHop == false or v.Humanoid.Health <= 0
											_G.FastBoss = false
										end
									end
								else
									spawn(function()
									    totarget(game:GetService("ReplicatedStorage")["Diablo [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
									end)
								end
							elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Deandre (0/1)" then
								if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Deandre [Lv. 1750]" then
											repeat wait()
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
												end
												EquipWeapon(_G.SelectWeapon)
                                                totarget(v.HumanoidRootPart.Position + Vector3.new(1,20,1) , v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))												
                                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
												v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												v.Humanoid:ChangeState(11)
												_G.FastBoss = true
											until _G.YamaHop == false or v.Humanoid.Health <= 0
											_G.FastBoss = false
										end
									end
								else
									spawn(function()
									    totarget(game:GetService("ReplicatedStorage")["Deandre [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
									end)
								end
							elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Urban (0/1)" then
								if game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Urban [Lv. 1750]" then
											repeat wait()
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
												end
												EquipWeapon(_G.SelectWeapon)
                                                totarget(v.HumanoidRootPart.Position + Vector3.new(1,20,1) , v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))												
                                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
												v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												v.Humanoid:ChangeState(11)
												_G.FastBoss = true
											until _G.YamaHop == false or v.Humanoid.Health <= 0
											_G.FastBoss = false
										end
									end
								else
									spawn(function()
									    totarget(game:GetService("ReplicatedStorage")["Urban [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
									end)
								end
							end
						end
					end
				end
			end)
		end
	end)

	spawn(function()
		while wait() do
			if _G.YamaHop then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
					else
						wait(12)
						if not game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
							local PlaceID = game.PlaceId
							local AllIDs = {}
							local foundAnything = ""
							local actualHour = os.date("!*t").hour
							local Deleted = false
							function TPReturner()
								local Site;
								if foundAnything == "" then
									Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
								else
									Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
								end
								local ID = ""
								if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
									foundAnything = Site.nextPageCursor
								end
								local num = 0;
								for i,v in pairs(Site.data) do
									local Possible = true
									ID = tostring(v.id)
									if tonumber(v.maxPlayers) > tonumber(v.playing) then
										for _,Existing in pairs(AllIDs) do
											if num ~= 0 then
												if ID == tostring(Existing) then
													Possible = false
												end
											else
												if tonumber(actualHour) ~= tonumber(Existing) then
													local delFile = pcall(function()
														-- delfile("NotSameServers.json")
														AllIDs = {}
														table.insert(AllIDs, actualHour)
													end)
												end
											end
											num = num + 1
										end
										if Possible == true then
											table.insert(AllIDs, ID)
											wait()
											pcall(function()
												-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
												wait()
												game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
											end)
											wait(4)
										end
									end
								end
							end
							function Teleport() 
								while wait() do
									pcall(function()
										TPReturner()
										if foundAnything ~= "" then
											TPReturner()
										end
									end)
								end
							end
							Teleport()
						end
					end
				end) 
			end
		end
	end)

	if ThreeWorld then
		page18:CreateToggle("Auto Tushita + Hop",function(t)
			_G.Tushitahop = t
		end)
	end

	spawn(function()
		while wait(.1) do
			if _G.Tushitahop then
				autoTushita()
			end
		end
	end)


	function enemyrip()
	    totarget(CFrame.new(-5332.30371, 423.985413, -2673.48218))
		wait()
		if game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
			local mobs = game.Workspace.Enemies:GetChildren()
			for i,v in pairs(mobs) do
				if v.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
					v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
					return v
				end
			end
		end
		return game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")
	end
	function enemyEliteBoss()
		if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") then
			local mobs = game.Workspace.Enemies:GetChildren()
			for i,v in pairs(mobs) do
				if v.Name == "Deandre [Lv. 1750]" or v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]"  and v:IsA("Model") and v:FindFirstChild("Humanoid") and
					v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
					return v
				end
			end
		end
		return game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]")
	end

	function enemylongma()
	    totarget(CFrame.new(-10171.7051, 406.981995, -9552.31738))
		if game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") then
			local mobs = game.Workspace.Enemies:GetChildren()
			for i,v in pairs(mobs) do
				if v.Name == "Longma [Lv. 2000] [Boss]" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
					v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
					return v
				end
			end
		end
		return game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]")
	end

	_G.checkup = true
	function autoTushita()
		if _G.checkup and not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
			if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]") then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					_G.FastBoss = false
					repeat totarget(CFrame.new(5420.49219, 314.446045, -2823.07373)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
					wait(1)
					repeat totarget(CFrame.new(5420.49219, 314.446045, -2823.07373)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
					wait(1.1)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
					wait(1)
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					CheckQuest()
					pcall(function()
						EquipWeapon(_G.SelectWeapon)
						pcall(function()
							local v = enemyEliteBoss()
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
							_G.FastBoss = true
						end)
					end)
				end
			elseif _G.ServerHop then
				_G.FastBoss = false
				totarget(CFrame.new(-12554.9443, 337.194092, -7501.44727))
				wait(1)
				Hopey()
			end
		elseif game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
			_G.checkup = false
			_G.FastBoss = false
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
			wait(0.5)
			repeat totarget(CFrame.new(-5420.16602, 1084.9657, -2666.8208)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
			wait(0.5)
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
			wait(0.5)
			repeat totarget(CFrame.new(-5414.41357, 309.865753, -2212.45776)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10
			wait(0.5)
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
			wait(0.5)
			repeat totarget(CFrame.new(-4971.47559, 331.565765, -3720.02954)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
			wait(0.5)
			EquipWeapon("God's Chalice")
			wait(0.5)
			repeat totarget(CFrame.new(-5560.27295, 313.915466, -2663.89795)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5560.27295, 313.915466, -2663.89795)).Magnitude <= 10
			wait(0.5)
			repeat totarget(CFrame.new(-5561.37451, 313.342529, -2663.4948)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(1)
			repeat totarget(CFrame.new(5154.17676, 141.786423, 911.046326)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(0.2)
			repeat totarget(CFrame.new(5148.03613, 162.352493, 910.548218)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(1)
			EquipWeapon("Holy Torch")
			wait(1)
			wait(0.4)
			repeat totarget(CFrame.new(-10752.7695, 412.229523, -9366.36328)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(0.4)
			repeat totarget(CFrame.new(-11673.4111, 331.749023, -9474.34668)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(0.4)
			repeat totarget(CFrame.new(-12133.3389, 519.47522, -10653.1904)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(0.4)
			repeat totarget(CFrame.new(-13336.5, 485.280396, -6983.35254)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(0.4)
			repeat totarget(CFrame.new(-13487.4131, 334.84845, -7926.34863)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
			wait(1)
		elseif game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") or game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]") then
			pcall(function()
				EquipWeapon(_G.SelectWeapon)
				pcall(function()
					local v = enemylongma()
					v.HumanoidRootPart.CanCollide = false
					v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
					totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
					_G.FastBoss = true
				end)
			end)
		elseif game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")  or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
			pcall(function()
				EquipWeapon(_G.SelectWeapon)
				pcall(function()
					local v = enemyrip()
					v.HumanoidRootPart.CanCollide = false
					v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
					totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
					_G.FastBoss = true
				end)
			end)
		elseif _G.ServerHop then
			_G.FastBoss = false
			totarget(CFrame.new(-12554.9443, 337.194092, -7501.44727))
			wait(1)
			Hopey()  
		end
	end

	if ThreeWorld then
		page13:CreateToggle("Auto Beautiful Pirate",function(vu)
		    totarget(CFrame.new(5310.80957, 22.5622349, 129.390533))
			_G.Cave = vu
		end)
		spawn(function()
			while wait() do
				if _G.Cave then
					if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat wait()
									pcall(function()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
										v.HumanoidRootPart.CanCollide = false
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end)
								until _G.Cave == false or v.Humanoid.Health <= 0
							end
						end
					end
				end
			end
		end)
	end

	page18:CreateToggle("Auto Player Hunter",function(x)
		_G.AutoPlayerHunter = x
	end)

	spawn(function()
		game:GetService("RunService").Heartbeat:connect(function()
			pcall(function()
				if _G.AutoPlayerHunter then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
					end
				end
			end)
		end)
	end)

	spawn(function()
		while wait() do
			if _G.AutoPlayerHunter then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					repeat 
						totarget(CFrame.new(-5560.00390625, 313.74130249023, -2838.4792480469)) 
						wait() 
					until _G.StopTween == true or not _G.AutoPlayerHunter or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5560.00390625, 313.74130249023, -2838.4792480469)).Magnitude <= 10
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
				else
					for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
							repeat wait()
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeapon)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,10,1))								
								v.HumanoidRootPart.Size = Vector3.new(60,60,60)
								game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
							until _G.AutoPlayerHunter == false or v.Humanoid.Health <= 0
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
					end
				end
			end
		end
	end)



		

	if ThreeWorld then
		page13:CreateToggle("Auto Torch",function(vu)
			_G.HolyTorch = vu
		end)
		spawn(function()
			while wait() do
				if _G.HolyTorch then
					wait(1)
					repeat totarget(CFrame.new(-10752, 417, -9366)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10752, 417, -9366)).Magnitude <= 10
					wait(1)
					repeat totarget(CFrame.new(-11672, 334, -9474)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-11672, 334, -9474)).Magnitude <= 10
					wait(1)
					repeat totarget(CFrame.new(-12132, 521, -10655)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12132, 521, -10655)).Magnitude <= 10
					wait(1)
					repeat totarget(CFrame.new(-13336, 486, -6985)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13336, 486, -6985)).Magnitude <= 10
					wait(1)
					repeat totarget(CFrame.new(-13489, 332, -7925)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13489, 332, -7925)).Magnitude <= 10
				end
			end
		end)
	end
	
	spawn(function()
	pcall(function()
		while wait(.1) do
			if _G.AutoStoreFruit then
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike")
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kilo-Kilo")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Falcon")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Revive-Dark")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Door-Door")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Human-Human: Buddha")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","String-String")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Phoenix")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Paw-Paw")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control")
                end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon")
				end
			end
		end
	end)
end)
	
	
		page1:CreateToggle("Auto Random Bone",function(e)
			_G.RandomBone = e
		end)
		
		 page1:CreateToggle("Auto Store Fruit All",function(ll)
    _G.AutoStoreFruit = ll
		 end)
		 
    
		
		spawn(function()
		    while wait() do
		        if _G.RandomBone then
                        local args = {
                            [1] = "Bones",
                            [2] = "Buy",
                            [3] = 1,
                            [4] = 1
                        }
                        
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		            end
		        end
		    end)

		page18:CreateToggle("Auto Pole",function(vu)
		    totarget(Vector3.new(-7911.14453, 5613.89795, -2272.67822),CFrame.new(-7911.14453, 5613.89795, -2272.67822))
			_G.Pole = vu
		end)
		spawn(function()
			while wait() do
				if _G.Pole then
					if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Thunder God [Lv. 575] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat wait()
									pcall(function()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										v.Humanoid:ChangeState(11)
										v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
										v.HumanoidRootPart.CanCollide = false
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end)
								until _G.Pole == false or v.Humanoid.Health <= 0
							end
						end
					end
				end
			end
		end)

		spawn(function()
			while wait() do
				if _G.Pole then
					EquipWeapon(_G.SelectWeapon)
				end
			end
		end)

		page18:CreateToggle("Auto Pole+Hop",function(eiei)
			wait(1)
			_G.PoleHop = eiei
		end)
		spawn(function()
			while wait() do
				if _G.PoleHop then
					pcall(function()
						if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Thunder God [Lv. 575] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
									repeat wait()
										pcall(function()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
											v.HumanoidRootPart.CanCollide = false
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										end)
									until _G.PoleHop == false or v.Humanoid.Health <= 0
								end
							end
						else
						    repeat totarget(CFrame.new(-7747.6977539063, 5606.9404296875, -2420.6140136719)) wait() until _G.StopTween == true or not _G.PoleHop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-7747.6977539063, 5606.9404296875, -2420.6140136719)).Magnitude <= 10
							wait(1)
							if not game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]") then
								local PlaceID = game.PlaceId
								local AllIDs = {}
								local foundAnything = ""
								local actualHour = os.date("!*t").hour
								local Deleted = false
								function TPReturner()
									local Site;
									if foundAnything == "" then
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
									else
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
									end
									local ID = ""
									if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
										foundAnything = Site.nextPageCursor
									end
									local num = 0;
									for i,v in pairs(Site.data) do
										local Possible = true
										ID = tostring(v.id)
										if tonumber(v.maxPlayers) > tonumber(v.playing) then
											for _,Existing in pairs(AllIDs) do
												if num ~= 0 then
													if ID == tostring(Existing) then
														Possible = false
													end
												else
													if tonumber(actualHour) ~= tonumber(Existing) then
														local delFile = pcall(function()
															-- delfile("NotSameServers.json")
															AllIDs = {}
															table.insert(AllIDs, actualHour)
														end)
													end
												end
												num = num + 1
											end
											if Possible == true then
												table.insert(AllIDs, ID)
												wait()
												pcall(function()
													-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
													wait()
													game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
												end)
												wait(4)
											end
										end
									end
								end
								function Teleport() 
									while wait() do
										pcall(function()
											TPReturner()
											if foundAnything ~= "" then
												TPReturner()
											end
										end)
									end
								end
								Teleport()
							end
						end
					end) 
				end
			end
		end)
		
		page18:CreateToggle("Auto SwanGlasses",function(vu)
		    totarget(Vector3.new(2191.1674804688, 15.177842140198, 694.69873046875),CFrame.new(2191.1674804688, 15.177842140198, 694.69873046875))
			_G.SwanGlasses = vu
		end)
		spawn(function()
			while wait() do
				if _G.SwanGlasses then
					if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Don Swan [Lv. 1000] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat wait()
									pcall(function()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
										v.HumanoidRootPart.CanCollide = false
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end)
								until _G.SwanGlasses == false or v.Humanoid.Health <= 0
							end
						end
					end
				end
			end
		end)

		spawn(function()
			while wait() do
				if _G.SwanGlasses then
					EquipWeapon(_G.SelectWeapon)
				end
			end
		end)

	if NewWorld then
		page1:CreateToggle("Auto Swan+Hop",function(eiei)
			_G.SwanHop = eiei
		end)
	end
		spawn(function()
			while wait() do
				if _G.SwanHop then
					pcall(function()
						if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Don Swan [Lv. 1000] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
									repeat wait()
										pcall(function()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
											v.HumanoidRootPart.CanCollide = false
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										end)
									until _G.SwanHop == false or v.Humanoid.Health <= 0
								end
							end
						else
							repeat totarget(CFrame.new(2191.1674804688, 15.177842140198, 694.69873046875)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2191.1674804688, 15.177842140198, 694.69873046875)).Magnitude <= 10
							wait(1)
							if not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
								local PlaceID = game.PlaceId
								local AllIDs = {}
								local foundAnything = ""
								local actualHour = os.date("!*t").hour
								local Deleted = false
								function TPReturner()
									local Site;
									if foundAnything == "" then
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
									else
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
									end
									local ID = ""
									if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
										foundAnything = Site.nextPageCursor
									end
									local num = 0;
									for i,v in pairs(Site.data) do
										local Possible = true
										ID = tostring(v.id)
										if tonumber(v.maxPlayers) > tonumber(v.playing) then
											for _,Existing in pairs(AllIDs) do
												if num ~= 0 then
													if ID == tostring(Existing) then
														Possible = false
													end
												else
													if tonumber(actualHour) ~= tonumber(Existing) then
														local delFile = pcall(function()
															-- delfile("NotSameServers.json")
															AllIDs = {}
															table.insert(AllIDs, actualHour)
														end)
													end
												end
												num = num + 1
											end
											if Possible == true then
												table.insert(AllIDs, ID)
												wait()
												pcall(function()
													-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
													wait()
													game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
												end)
												wait(4)
											end
										end
									end
								end
								function Teleport() 
									while wait() do
										pcall(function()
											TPReturner()
											if foundAnything ~= "" then
												TPReturner()
											end
										end)
									end
								end
								Teleport()
							end
						end
					end) 
				end
			end
		end)

	if NewWorld then
		page13:CreateToggle("Auto Dark Coat+Hop",function(eiei)
			_G.BlackBeardHop = eiei
		end)
	end
		spawn(function()
			while wait() do
				if _G.BlackBeardHop then
					pcall(function()
						if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Darkbeard [Lv. 1000] [Raid Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
									repeat wait()
										pcall(function()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											EquipWeapon(_G.SelectWeapon)
											v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
											v.HumanoidRootPart.CanCollide = false
											totarget(v.HumanoidRootPart.Position + Vector3.new(1,20,1) , v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										end)
									until _G.BlackBeardHop == false or v.Humanoid.Health <= 0
								end
							end
						else
							repeat totarget(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(3798.4575195313, 13.826690673828, -3399.806640625)).Magnitude <= 10
							wait(1)
							if not game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
								local PlaceID = game.PlaceId
								local AllIDs = {}
								local foundAnything = ""
								local actualHour = os.date("!*t").hour
								local Deleted = false
								function TPReturner()
									local Site;
									if foundAnything == "" then
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
									else
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
									end
									local ID = ""
									if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
										foundAnything = Site.nextPageCursor
									end
									local num = 0;
									for i,v in pairs(Site.data) do
										local Possible = true
										ID = tostring(v.id)
										if tonumber(v.maxPlayers) > tonumber(v.playing) then
											for _,Existing in pairs(AllIDs) do
												if num ~= 0 then
													if ID == tostring(Existing) then
														Possible = false
													end
												else
													if tonumber(actualHour) ~= tonumber(Existing) then
														local delFile = pcall(function()
															-- delfile("NotSameServers.json")
															AllIDs = {}
															table.insert(AllIDs, actualHour)
														end)
													end
												end
												num = num + 1
											end
											if Possible == true then
												table.insert(AllIDs, ID)
												wait()
												pcall(function()
													-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
													wait()
													game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
												end)
												wait(4)
											end
										end
									end
								end
								function Teleport() 
									while wait() do
										pcall(function()
											TPReturner()
											if foundAnything ~= "" then
												TPReturner()
											end
										end)
									end
								end
								Teleport()
							end
						end
					end) 
				end
			end
		end)


	if NewWorld then
		page13:CreateToggle("Auto Buy Buso Color",function(Value)
			_G.BuyEn = Value 
		end)   
	end
		spawn(function()
			while _G.BuyEn do wait()
				if _G.BuyEn then
					local args = {
						[1] = "ColorsDealer",
						[2] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
		end)

	if NewWorld then
		page13:CreateToggle("Auto Buy Haki+Hop",function(Value)
			_G.HakiColorHop = Value
		end)
	end
		spawn(function()
			while _G.HakiColorHop do wait()
				if _G.HakiColorHop then
					local args = {
						[1] = "ColorsDealer",
						[2] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
		end)

	if NewWorld then
		page13:CreateToggle("Auto Buy Legendary Sword",function(Value)
			_G.BuySword = Value
		end)
		spawn(function()
			while _G.BuySword do wait()
				if _G.BuySword then
					local args = {
						[1] = "LegendarySwordDealer",
						[2] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
		end)
	end

	if NewWorld then
		page13:CreateToggle("Auto Buy Legendary Sword+Hop",function(Value)
			_G.AutoBuySwordHop = Value
		end)
		spawn(function()
			while _G.AutoBuySwordHop do wait()
				if _G.AutoBuySwordHop then
					local args = {
						[1] = "LegendarySwordDealer",
						[2] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
		end)
	end

	spawn(function()
		while wait(7) do
			if _G.AutoBuySwordHop or _G.HakiColorHop then
				local PlaceID = game.PlaceId
				local AllIDs = {}
				local foundAnything = ""
				local actualHour = os.date("!*t").hour
				local Deleted = false
				function TPReturner()
					local Site;
					if foundAnything == "" then
						Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
					else
						Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
					end
					local ID = ""
					if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
						foundAnything = Site.nextPageCursor
					end
					local num = 0;
					for i,v in pairs(Site.data) do
						local Possible = true
						ID = tostring(v.id)
						if tonumber(v.maxPlayers) > tonumber(v.playing) then
							for _,Existing in pairs(AllIDs) do
								if num ~= 0 then
									if ID == tostring(Existing) then
										Possible = false
									end
								else
									if tonumber(actualHour) ~= tonumber(Existing) then
										local delFile = pcall(function()
											-- delfile("NotSameServers.json")
											AllIDs = {}
											table.insert(AllIDs, actualHour)
										end)
									end
								end
								num = num + 1
							end
							if Possible == true then
								table.insert(AllIDs, ID)
								wait()
								pcall(function()
									-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
									wait()
									game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
								end)
								wait(4)
							end
						end
					end
				end
				function Teleport() 
					while wait() do
						pcall(function()
							TPReturner()
							if foundAnything ~= "" then
								TPReturner()
							end
						end)
					end
				end
				Teleport()
			end
		end
	end)

	page18:CreateToggle("Mob Aura",function(v)
		_G.MobAura = v 
		spawn(function()
			while _G.MobAura do wait()
				if _G.MobAura then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.MobAura and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= DistanceNear then
							repeat wait()
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeapon)
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
								if HideHitBlox then
									v.HumanoidRootPart.Transparency = 1
								else
									v.HumanoidRootPart.Transparency = 0.75
								end
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								if Magnet then
									if setsimulationradius then 
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
								end
                            totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))						
                            until _G.MobAura == false or not v.Parent or v.Humanoid.Health <= 0
						end
					end
				end
			end
		end)
	end)
	DistanceNear = 1000000

	Wapon = {}
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if v:IsA("Tool") then
			table.insert(Wapon ,v.Name)
		end
	end
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
		if v:IsA("Tool") then
			table.insert(Wapon, v.Name)
		end
	end
	local SelectWeapona = page1:CreateDropdown("Select Weapon",Wapon,function(Value)
		_G.SelectWeapon = Value
		_G.SelectToolWeaponOld = Value
	end)
	page1:CreateButton("Refresh Weapon",function()
		SelectWeapona:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				SelectWeapona:Add(v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				SelectWeapona:Add(v.Name)
			end
		end
	end) 

	function equip()
		pcall(function()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.Name == _G.SelectWeapon then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				end
			end
		end)
	end

	WaponAccessories = {} 
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if v:IsA("Tool") then 
			if v.ToolTip == "Wear" then    
				table.insert(WaponAccessories, v.Name)
			end
		end
	end
	SelectTooAccessories = ""
	page18:CreateToggle("Auto Accessories",function(Value)
		AutoAccessories = Value 
	end)
	spawn(function()
		while wait() do
			if AutoAccessories then
				CheckAccessories = game.Players.LocalPlayer.Character 
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
					if CheckAccessories:FindFirstChild("CoolShades") or CheckAccessories:FindFirstChild("BlackSpikeyCape") or CheckAccessories:FindFirstChild("BlueSpikeyCape") or CheckAccessories:FindFirstChild("RedSpikeyCape") or CheckAccessories:FindFirstChild("Chopper") or CheckAccessories:FindFirstChild("MarineCape") or CheckAccessories:FindFirstChild("GhoulMask") or CheckAccessories:FindFirstChild("MarineCap") or CheckAccessories:FindFirstChild("PinkCape") or CheckAccessories:FindFirstChild("SaboTopHat") or CheckAccessories:FindFirstChild("SwanGlasses") or CheckAccessories:FindFirstChild("UsoapHat") or CheckAccessories:FindFirstChild("Corrida") or CheckAccessories:FindFirstChild("ZebraCap") or CheckAccessories:FindFirstChild("TomoeRing") or CheckAccessories:FindFirstChild("BlackCape") or CheckAccessories:FindFirstChild("SwordsmanHat") or CheckAccessories:FindFirstChild("SantaHat") or CheckAccessories:FindFirstChild("ElfHat") or CheckAccessories:FindFirstChild("DarkCoat") or CheckAccessories:FindFirstChild("Valkyrie Helm") then
					else
						EquipWeapon(SelectTooAccessories)
						wait(0.1)
						game:GetService'VirtualUser':CaptureController()
						game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
						wait(0.1)
						if game.Players.LocalPlayer.Character:FindFirstChild(SelectTooAccessories) then
							game.Players.LocalPlayer.Character:FindFirstChild(SelectTooAccessories).Parent = game.Players.LocalPlayer:FindFirstChild("Backpack")
						end
						wait(1)
					end
				end
			end
		end
	end)

	local SelectAccessories = page18:CreateDropdown("Select Accessories",WaponAccessories,function(Value)
		SelectTooAccessories = Value
	end)
	page18:CreateButton("Refresh Accessories",function()
		SelectAccessories:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then 
				if v.ToolTip == "Wear" then    
					SelectAccessories:Add(v.Name)
				end
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then 
				if v.ToolTip == "Wear" then    
					SelectAccessories:Add(v.Name)
				end
			end
		end
	end)

	game:GetService("RunService").Heartbeat:Connect(
	function()
		if _G.Mastery then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
		if _G.GunMastery then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end
	)
	_G.WeponMatary = ""
	--page2:CreateToggle("Auto Farm Mastery Devil Fruit",_G.Mastery,function(v)
	--	CheckQuest()
	--	local args = {
	--		[1] = "AbandonQuest"
	--	}
	--	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	--	_G.Mastery = v
	--end)
	LocalPlayer = game:GetService("Players").LocalPlayer
	spawn(function()
		while wait() do
			pcall(function()
				if _G.Mastery then
					if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						StatrMagnetDevilFruitMastery = false
						CheckQuest()
						totarget(CFrameQuest)
						repeat wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-CFrameQuest.Position).Magnitude <= 10
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						CheckQuest()
						totarget(CFrameMon)
						if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
							pcall(
								function()
									for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										CheckQuest()  
										if v.Name == Ms then
											if setsimulationradius then 
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											repeat wait() CheckQuest()  
												if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
													if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
														if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
															local args = {
																[1] = "Buso"
															}
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
														end
														HealthMin = v.Humanoid.MaxHealth*Persen/100
														PosHee = v.HumanoidRootPart.CFrame
														if v.Humanoid.Health <= HealthMin then
															UseDF = true
															EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
															v.HumanoidRootPart.CanCollide = false
															v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
															v.HumanoidRootPart.Transparency = 0.75
															totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
															if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
																if SkillZ and v.Humanoid.Health <= HealthMin then
																	local args = {
																		[1] = v.HumanoidRootPart.Position
																	}
																	game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteEvent:FireServer(unpack(args))
																	local args = {
																		[1] = "Z",
																		[2] = Vector3.new(0,0,0)
																	}
																	game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteFunction:InvokeServer(unpack(args))
																end
																if SkillX and v.Humanoid.Health <= HealthMin then
																	local args = {
																		[1] = v.HumanoidRootPart.Position
																	}
																	game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteEvent:FireServer(unpack(args))
																	local args = {
																		[1] = "X"
																	}
																	game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteFunction:InvokeServer(unpack(args))
																end   
															elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
																if SkillZ and v.Humanoid.Health <= HealthMin then
																	local args = {
																		[1] = v.HumanoidRootPart.Position
																	}
																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																	local args = {
																		[1] = "Z",
																		[2] = Vector3.new(0,0,0)
																	}
																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																end
																if SkillX and v.Humanoid.Health <= HealthMin then
																	local args = {
																		[1] = v.HumanoidRootPart.Position
																	}
																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																	local args = {
																		[1] = "X",
																		[2] = Vector3.new(0,0,0)
																	}

																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																end
																if SkillC and v.Humanoid.Health <= HealthMin then
																	local args = {
																		[1] = v.HumanoidRootPart.Position
																	}
																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																	local args = {
																		[1] = "C",
																		[2] = Vector3.new(0,0,0)
																	}
																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																end
																if SkillV and v.Humanoid.Health <= HealthMin then
																	local args = {
																		[1] = v.HumanoidRootPart.Position
																	}
																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																	local args = {
																		[1] = "V",
																		[2] = Vector3.new(0,0,0)
																	}
																	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																end
															end   
														else
															UseDF = false
															if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
																local args = {
																	[1] = "Buso"
																}
																game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
															end
															EquipWeapon(_G.WeponMatary)
															if HideHitBlox then
																v.HumanoidRootPart.Transparency = 0.75
															else
																v.HumanoidRootPart.Transparency = 1
															end
															v.HumanoidRootPart.CanCollide = false
															v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
															totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
															game:GetService'VirtualUser':CaptureController()
															game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))  
														end
														StatrMagnetDevilFruitMastery = true 
													else
														StatrMagnet = false
														CheckQuest()
														print()
														totarget(CFrameQuest)
														wait(1.5)
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
													end  
												else
													CheckQuest() 
													totarget(CFrameMon)
													repeat wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-CFrameQuest.Position).Magnitude <= 10
												end 
											until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFarm == false or LocalPlayer.PlayerGui.Main.Quest.Visible == false
											StatrMagnetDevilFruitMastery = false
											CheckQuest() 
											totarget(CFrameMon)
										end
									end
								end
							)
						else
							CheckQuest()
							totarget(CFrameMon)
						end 
					end 
				end
			end) 
		end
	end)

	---Gun---
	spawn(function()
		while wait() do
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then 
						_G.SelectToolWeaponGun = v.Name
					end
				end
			end
		end
	end)
	spawn(function()
		while wait() do
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then 
						_G.SelectToolWeaponGun = v.Name
					end
				end
			end
		end
	end)
	page19:CreateToggle("Auto Farm Gun Mastery",function(v)
		CheckQuest()
		local args = {
			[1] = "AbandonQuest"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		_G.GunMastery = v
		Ms = ""
	end)
	spawn(function()
		while wait() do
			pcall(function()
				if _G.GunMastery then
					if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then  
						CheckQuest()
						totarget(CFrameQuest)
						repeat wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-CFrameQuest.Position).Magnitude <= 10
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
						wait(0.5)
						totarget(CFrameMon)
					elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then  
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							CheckQuest()
							pcall(function()
								if game.Workspace.Enemies:FindFirstChild(Ms) then
									if _G.GunMastery and v.Name == Ms then
										if setsimulationradius then 
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										repeat wait()
											pcall(function()
												if game.Workspace.Enemies:FindFirstChild(Ms) then
													if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
														HealthMin = v.Humanoid.MaxHealth*Persen/100
														PosHee = v.HumanoidRootPart.CFrame
														if v.Humanoid.Health <= HealthMin then
															EquipWeapon(_G.SelectToolWeaponGun)
															v.HumanoidRootPart.CanCollide = false
															v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
															v.HumanoidRootPart.Transparency = 0.75
															totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
															local args = {
																[1] = v.HumanoidRootPart.Position,
																[2] = v.HumanoidRootPart
															}
															game:GetService("Players").LocalPlayer.Character[_G.SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
														else
															if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
																local args = {
																	[1] = "Buso"
																}
																game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
															end
															EquipWeapon(_G.WeponMatary)
															if HideHitBlox then
																v.HumanoidRootPart.Transparency = 0.75
															else
																v.HumanoidRootPart.Transparency = 1
															end
															v.HumanoidRootPart.CanCollide = false
															v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
															totarget(v.HumanoidRootPart.CFrame * CFrame.new(20,1,1))
															game:GetService'VirtualUser':CaptureController()
															game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
														end 
														StatrMagnet = true
													else
														CheckQuest()
														totarget(CFrameQuest)
						                                repeat wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-CFrameQuest.Position).Magnitude <= 10
														wait(1.1)
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
														wait(0.5)
														totarget(CFrameMon)
													end
												else
													CheckQuest()
													totarget(CFrameMon)
												end
											end)
										until game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or _G.GunMastery == false or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
									end
								else
									CheckQuest()
									totarget(CFrameMon)
								end
							end)
						end
					end 
				end
			end) 
		end
	end)


	page19:CreateToggle("Skill Z",function(a)
		SkillZ = a
	end)
	page19:CreateToggle("Skill X",function(a)
		SkillX = a
	end)
	page19:CreateToggle("Skill C",function(a)
		SkillC = a
	end)
	page19:CreateToggle("Skill V",function(a)
		SkillV = a
	end)
	Persen = 30
	page19:CreateSlider("Health",0,100,Persen,function(v)
        Persen = v["s"]
    end)
	local AMonster = page19:CreateDropdown("Select Weapon",Wapon,function(v)
		_G.WeponMatary = v
	end)
	page19:CreateButton("Refresh Weapon",function()
		AMonster:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				AMonster:Add(v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				AMonster:Add(v.Name)
			end
		end
	end)

	-- Fram Boss Tab
	function CheckQuestBoss()
		if SelectBoss == "Diamond [Lv. 750] [Boss]" then
			MsBoss = "Diamond [Lv. 750] [Boss]"
			NaemQuestBoss = "Area1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
		elseif SelectBoss == "Jeremy [Lv. 850] [Boss]" then
			MsBoss = "Jeremy [Lv. 850] [Boss]"
			NaemQuestBoss = "Area2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
		elseif SelectBoss == "Fajita [Lv. 925] [Boss]" then
			MsBoss = "Fajita [Lv. 925] [Boss]"
			NaemQuestBoss = "MarineQuest3"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
		elseif SelectBoss == "Don Swan [Lv. 1000] [Boss]" then
			MsBoss = "Don Swan [Lv. 1000] [Boss]"
			CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
		elseif SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
			MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
			NaemQuestBoss = "IceSideQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
			CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
		elseif SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
			MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
			CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
		elseif SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
			MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
			CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
		elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
			MsBoss = "Order [Lv. 1250] [Raid Boss]"
			CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
		elseif SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
			MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
			NaemQuestBoss = "FrostQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
			CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
		elseif SelectBoss == "Tide Keeper [Lv. 1475] [Boss]" then
			MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
			NaemQuestBoss = "ForgottenQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
			CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
			-- Old World
		elseif SelectBoss == "Saber Expert [Lv. 200] [Boss]" then
			MsBoss = "Saber Expert [Lv. 200] [Boss]"
			CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
		elseif SelectBoss == "The Saw [Lv. 100] [Boss]" then
			MsBoss = "The Saw [Lv. 100] [Boss]"
			CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
		elseif SelectBoss == "The Gorilla King [Lv. 25] [Boss]" then
			MsBoss = "The Gorilla King [Lv. 25] [Boss]"
			NaemQuestBoss = "JungleQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
		elseif SelectBoss == "Bobby [Lv. 55] [Boss]" then
			MsBoss = "Bobby [Lv. 55] [Boss]"
			NaemQuestBoss = "BuggyQuest1"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
		elseif SelectBoss == "Yeti [Lv. 110] [Boss]" then
			MsBoss = "Yeti [Lv. 110] [Boss]"
			NaemQuestBoss = "SnowQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
			CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
		elseif SelectBoss == "Mob Leader [Lv. 120] [Boss]" then
			MsBoss = "Mob Leader [Lv. 120] [Boss]"
			CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.928248107)
			--The Gorilla King [Lv. 25] [Boss]
		elseif SelectBoss == "Vice Admiral [Lv. 130] [Boss]" then
			MsBoss = "Vice Admiral [Lv. 130] [Boss]"
			NaemQuestBoss = "MarineQuest2"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
			CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
		elseif SelectBoss == "Warden [Lv. 175] [Boss]" then
			MsBoss = "Warden [Lv. 175] [Boss]"
			NaemQuestBoss = "ImpelQuest"
			LevelQuestBoss = 1
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Chief Warden [Lv. 200] [Boss]" then
			MsBoss = "Chief Warden [Lv. 200] [Boss]"
			NaemQuestBoss = "ImpelQuest"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Swan [Lv. 225] [Boss]" then
			MsBoss = "Swan [Lv. 225] [Boss]"
			NaemQuestBoss = "ImpelQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Magma Admiral [Lv. 350] [Boss]" then
			MsBoss = "Magma Admiral [Lv. 350] [Boss]"
			NaemQuestBoss = "MagmaQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
			CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
		elseif SelectBoss == "Fishman Lord [Lv. 425] [Boss]" then
			MsBoss = "Fishman Lord [Lv. 425] [Boss]"
			NaemQuestBoss = "FishmanQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
			CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
		elseif SelectBoss == "Wysper [Lv. 500] [Boss]" then
			MsBoss = "Wysper [Lv. 500] [Boss]"
			NaemQuestBoss = "SkyExp1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
			CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
		elseif SelectBoss == "Thunder God [Lv. 575] [Boss]" then
			MsBoss = "Thunder God [Lv. 575] [Boss]"
			NaemQuestBoss = "SkyExp2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
			CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
		elseif SelectBoss == "Cyborg [Lv. 675] [Boss]" then
			MsBoss = "Cyborg [Lv. 675] [Boss]"
			NaemQuestBoss = "FountainQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
			CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
			--Three World
		elseif SelectBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
			MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
			NaemQuestBoss = "MarineTreeIsland"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameBoss = CFrame.new(2955.1189, 423.584412, -7240.22217, -0.761679471, 7.01648872e-08, 0.647953987, 8.75833539e-09, 1, -9.79912755e-08, -0.647953987, -6.89629474e-08, -0.761679471)
		elseif SelectBoss == "Captain Elephant [Lv. 1875] [Boss]" then
			MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
			NaemQuestBoss = "DeepForestIsland"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameBoss = CFrame.new(-13592.9053, 332.23584, -8134.08643, -0.866908491, -1.7684858e-08, 0.498467356, -3.95491107e-08, 1, -3.33032872e-08, -0.498467356, -4.85848446e-08, -0.866908491)
		elseif SelectBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
			MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
			NaemQuestBoss = "DeepForestIsland2"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameBoss = CFrame.new(5310.80957, 22.5622349, 129.390533, 1, -2.47274325e-08, 1.41872977e-13, 2.47274325e-08, 1, -4.55364528e-08, -1.40746979e-13, 4.55364528e-08, 1)
		elseif SelectBoss == "Longma [Lv. 2000] [Boss]" then
			MsBoss = "Longma [Lv. 2000] [Boss]"
			CFrameBoss = CFrame.new(-10293.208, 332.791351, -9450.625, 0.132661447, -0.213521436, -0.96788919, -0.0110089043, 0.976142585, -0.21685116, 0.991100252, 0.0394231752, 0.127145842)
		elseif SelectBoss == "Stone [Lv. 1550] [Boss]" then
			MsBoss = "Stone [Lv. 1550] [Boss]"
			NaemQuestBoss = "PiratePortQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameBoss = CFrame.new(-970.778564, 40.0068855, 6795.5249, -0.179641441, -2.87076816e-08, 0.983732164, -4.4126935e-08, 1, 2.11243023e-08, -0.983732164, -3.96142852e-08, -0.179641441)
		elseif SelectBoss == "Island Empress [Lv. 1675] [Boss]" then
			MsBoss = "Island Empress [Lv. 1675] [Boss]"
			NaemQuestBoss = "AmazonQuest2"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameBoss = CFrame.new(5813.94140625, 661.14862060547, 202.04710388184)
		end
	end
	local Boss = {}
	for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
		if string.find(v.Name, "Boss") then
			if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
			else
				table.insert(Boss, v.Name)
			end
		end
	end
	for i, v in pairs(game.workspace.Enemies:GetChildren()) do
		if string.find(v.Name, "Boss") then
			if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
			else
				table.insert(Boss, v.Name)
			end
		end
	end
	local BossName = page1:CreateDropdown("Select Boss",Boss,function(Value)
		SelectBoss = Value
		Don = false
	end)
	TOOLS = {}
	 for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	   if v:IsA("Tool") then
		  table.insert(TOOLS,v.Name)
	   end
	 end
	local SelectWeaponBoss = "" 
	local SelectWeaponKillBoss = page1:CreateDropdown("Select Weapon Kill Boss",Wapon,function(Value)
		_G.SelectWeaponBoss = Value
	end)
	page1:CreateButton("Refresh Weapon Boss",function()
		SelectWeaponKillBoss:Clear()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				SelectWeaponKillBoss:Add(v.Name)
			end
		end
		for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				SelectWeaponKillBoss:Add(v.Name)
			end
		end
	end)
	page1:CreateButton("Refresh Boss",function()
		BossName:Clear()
		for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
				else
					BossName:Add(v.Name)
				end
			end
		end
		for i, v in pairs(game.workspace.Enemies:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
				else
					BossName:Add(v.Name)
				end
			end
		end
	end)
	function AutoFramBoss()
		CheckQuestBoss()
		if SelectBoss == "Don Swan [Lv. 1000] [Boss]" or SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or SelectBoss == "Saber Expert [Lv. 200] [Boss]" or SelectBoss == "Mob Leader [Lv. 120] [Boss]" or SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" or SelectBoss == "Longma [Lv. 2000] [Boss]" then
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if FramBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						repeat
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeaponBoss)
								if HideHitBlox then
									v.HumanoidRootPart.Transparency = 0.75
								else
									v.HumanoidRootPart.Transparency = 1
								end
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							end)
						until not FramBoss or not v.Parent or v.Humanoid.Health <= 0
					end
				end
			else
			    totarget(CFrameBoss)
			end
		elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if FramBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						repeat 
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeaponBoss)
								if HideHitBlox then
									v.HumanoidRootPart.Transparency = 0.75
								else
									v.HumanoidRootPart.Transparency = 1
								end
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							end)
						until not FramBoss or not v.Parent or v.Humanoid.Health <= 0
					end
				end
			else
			    totarget(CFrameBoss)
			end
		else
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) or game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss) then
				if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
		
					CheckQuestBoss()
					totarget(CFrameQuestBoss)
					repeat wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-CFrameQuestBoss.Position).Magnitude <= 10
					wait(1.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuestBoss, LevelQuestBoss)
					wait(1)
					totarget(CFrameBoss)
				elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if FramBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
							repeat
								pcall(function() wait() 
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeaponBoss)
									v.HumanoidRootPart.Transparency = 1
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									VirtualUser:CaptureController()
									VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
								end)
							until not FramBoss or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
						end
					end
					totarget(CFrameBoss)
				end
			end
		end
	end
	page1:CreateToggle("Auto Farm Boss",function(Value)
		local args = {
			[1] = "AbandonQuest"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		FramBoss = Value
		MsBoss = ""
		while FramBoss do wait()
			AutoFramBoss()
		end
	end)
	KillBossuse = true
	function AutoFramAllBoss()
		for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
			if KillBossuse then
				if v.Name == "Diamond [Lv. 750] [Boss]" then
					SelectBoss = "Diamond [Lv. 750] [Boss]"
				elseif v.Name == "Jeremy [Lv. 850] [Boss]" then
					SelectBoss = "Jeremy [Lv. 850] [Boss]"
				elseif v.Name == "Fajita [Lv. 925] [Boss]" then
					SelectBoss = "Fajita [Lv. 925] [Boss]"
				elseif v.Name == "Don Swan [Lv. 1000] [Boss]" and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
					SelectBoss = "Don Swan [Lv. 1000] [Boss]" 
				elseif v.Name == "Smoke Admiral [Lv. 1150] [Boss]"  then
					SelectBoss = "Smoke Admiral [Lv. 1150] [Boss]"
				elseif v.Name == "Cursed Captain [Lv. 1325] [Raid Boss]"  then
					SelectBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
				elseif v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
					SelectBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
				elseif v.Name == "Tide Keeper [Lv. 1475] [Boss]" then
					SelectBoss = "Tide Keeper [Lv. 1475] [Boss]"
				elseif v.Name == "Saber Expert [Lv. 200] [Boss]" then
					SelectBoss = "Saber Expert [Lv. 200] [Boss]"
				elseif v.Name == "The Gorilla King [Lv. 25] [Boss]"  then
					SelectBoss = "The Gorilla King [Lv. 25] [Boss]"
				elseif v.Name == "Bobby [Lv. 55] [Boss]" then
					SelectBoss = "Bobby [Lv. 55] [Boss]" 
				elseif v.Name == "Yeti [Lv. 110] [Boss]"  then
					SelectBoss = "Yeti [Lv. 110] [Boss]"
				elseif v.Name == "Mob Leader [Lv. 120] [Boss]" then
					SelectBoss = "Mob Leader [Lv. 120] [Boss]"
				elseif v.Name == "Vice Admiral [Lv. 130] [Boss]" then
					SelectBoss = "Vice Admiral [Lv. 130] [Boss]"
				elseif v.Name == "Warden [Lv. 175] [Boss]" then
					SelectBoss = "Warden [Lv. 175] [Boss]"
				elseif v.Name == "Chief Warden [Lv. 200] [Boss]"then
					SelectBoss = "Chief Warden [Lv. 200] [Boss]"
				elseif v.Name == "Swan [Lv. 225] [Boss]" then
					SelectBoss = "Swan [Lv. 225] [Boss]"
				elseif v.Name == "Magma Admiral [Lv. 350] [Boss]" then
					SelectBoss = "Magma Admiral [Lv. 350] [Boss]"
				elseif v.Name == "Fishman Lord [Lv. 425] [Boss]" then
					SelectBoss = "Fishman Lord [Lv. 425] [Boss]"
				elseif v.Name == "Wysper [Lv. 500] [Boss]" then
					SelectBoss = "Wysper [Lv. 500] [Boss]"
				elseif v.Name == "Thunder God [Lv. 575] [Boss]" then
					SelectBoss = "Thunder God [Lv. 575] [Boss]"
				elseif v.Name == "Cyborg [Lv. 675] [Boss]" then
					SelectBoss = "Cyborg [Lv. 675] [Boss]"
				elseif v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
					SelectBoss = "Kilo Admiral [Lv. 1750] [Boss]"
				elseif v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
					SelectBoss = "Captain Elephant [Lv. 1875] [Boss]"
				elseif v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
					SelectBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
				elseif v.Name == "Longma [Lv. 2000] [Boss]" then
					SelectBoss = "Longma [Lv. 2000] [Boss]"
				elseif v.Name == "Stone [Lv. 1550] [Boss]" then
					SelectBoss = "Stone [Lv. 1550] [Boss]"
				elseif v.Name == "Island Empress [Lv. 1675] [Boss]" then
					SelectBoss = "Island Empress [Lv. 1675] [Boss]"
				end
			end   
		end
		for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
			if KillBossuse then
				if v.Name == "Diamond [Lv. 750] [Boss]" then
					SelectBoss = "Diamond [Lv. 750] [Boss]"
				elseif v.Name == "Jeremy [Lv. 850] [Boss]"then
					SelectBoss = "Jeremy [Lv. 850] [Boss]"
				elseif v.Name == "Fajita [Lv. 925] [Boss]"  then
					SelectBoss = "Fajita [Lv. 925] [Boss]"
				elseif v.Name == "Don Swan [Lv. 1000] [Boss]" and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
					SelectBoss = "Don Swan [Lv. 1000] [Boss]" 
				elseif v.Name == "Smoke Admiral [Lv. 1150] [Boss]"  then
					SelectBoss = "Smoke Admiral [Lv. 1150] [Boss]"
				elseif v.Name == "Cursed Captain [Lv. 1325] [Raid Boss]"  then
					SelectBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
				elseif v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]"  then
					SelectBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
				elseif v.Name == "Tide Keeper [Lv. 1475] [Boss]"  then
					SelectBoss = "Tide Keeper [Lv. 1475] [Boss]"
				elseif v.Name == "Saber Expert [Lv. 200] [Boss]"then
					SelectBoss = "Saber Expert [Lv. 200] [Boss]"
				elseif v.Name == "The Gorilla King [Lv. 25] [Boss]" then
					SelectBoss = "The Gorilla King [Lv. 25] [Boss]"
				elseif v.Name == "Bobby [Lv. 55] [Boss]"  then
					SelectBoss = "Bobby [Lv. 55] [Boss]" 
				elseif v.Name == "Yeti [Lv. 110] [Boss]"   then
					SelectBoss = "Yeti [Lv. 110] [Boss]"
				elseif v.Name == "Mob Leader [Lv. 120] [Boss]" then
					SelectBoss = "Mob Leader [Lv. 120] [Boss]"
				elseif v.Name == "Vice Admiral [Lv. 130] [Boss]"  then
					SelectBoss = "Vice Admiral [Lv. 130] [Boss]"
				elseif v.Name == "Warden [Lv. 175] [Boss]" then
					SelectBoss = "Warden [Lv. 175] [Boss]"
				elseif v.Name == "Chief Warden [Lv. 200] [Boss]"  then
					SelectBoss = "Chief Warden [Lv. 200] [Boss]"
				elseif v.Name == "Swan [Lv. 225] [Boss]"  then
					SelectBoss = "Swan [Lv. 225] [Boss]"
				elseif v.Name == "Magma Admiral [Lv. 350] [Boss]"  then
					SelectBoss = "Magma Admiral [Lv. 350] [Boss]"
				elseif v.Name == "Fishman Lord [Lv. 425] [Boss]"  then
					SelectBoss = "Fishman Lord [Lv. 425] [Boss]"
				elseif v.Name == "Wysper [Lv. 500] [Boss]"   then
					SelectBoss = "Wysper [Lv. 500] [Boss]"
				elseif v.Name == "Thunder God [Lv. 575] [Boss]"   then
					SelectBoss = "Thunder God [Lv. 575] [Boss]"
				elseif v.Name == "Cyborg [Lv. 675] [Boss]" then
					SelectBoss = "Cyborg [Lv. 675] [Boss]"
				elseif v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
					SelectBoss = "Kilo Admiral [Lv. 1750] [Boss]"
				elseif v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
					SelectBoss = "Captain Elephant [Lv. 1875] [Boss]"
				elseif v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
					SelectBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
				elseif v.Name == "Longma [Lv. 2000] [Boss]" then
					SelectBoss = "Longma [Lv. 2000] [Boss]"
				elseif v.Name == "Stone [Lv. 1550] [Boss]" then
					SelectBoss = "Stone [Lv. 1550] [Boss]"
				elseif v.Name == "Island Empress [Lv. 1675] [Boss]" then
					SelectBoss = "Island Empress [Lv. 1675] [Boss]"
				end
			end   
		end
		KillBossuse = false
		if SelectBoss == "Don Swan [Lv. 1000] [Boss]" or SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or SelectBoss == "Saber Expert [Lv. 200] [Boss]" or SelectBoss == "Mob Leader [Lv. 120] [Boss]" or SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if FramAllBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						CheckQuestBoss()
						totarget(CFrameBoss)
						wait(1)
						repeat
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeaponBoss)
								if HideHitBlox then
									v.HumanoidRootPart.Transparency = 0.75
								else
									v.HumanoidRootPart.Transparency = 1
								end
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							end)
						until not FramAllBoss or not v.Parent or v.Humanoid.Health <= 0
						KillBossuse = true
					end
				end
			else
				CheckQuestBoss()
				totarget(CFrameBoss)
			end
		else
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if FramAllBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						CheckQuestBoss()
						totarget(CFrameBoss)
						wait(1)
						repeat
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeaponBoss)
								if HideHitBlox then
									v.HumanoidRootPart.Transparency = 0.75
								else
									v.HumanoidRootPart.Transparency = 1
								end
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							end)
						until not FramAllBoss or not v.Parent or v.Humanoid.Health <= 0
						KillBossuse = true
					end
				end
			else
				CheckQuestBoss()
				totarget(CFrameBoss)
			end
		end
		KillBossuse = true
	end

	function AutoFramAllBoss2()
		for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
			if KillBossuse then
				if v.Name == "Diamond [Lv. 750] [Boss]" then
					SelectBoss = "Diamond [Lv. 750] [Boss]"
				elseif v.Name == "Jeremy [Lv. 850] [Boss]" then
					SelectBoss = "Jeremy [Lv. 850] [Boss]"
				elseif v.Name == "Fajita [Lv. 925] [Boss]" then
					SelectBoss = "Fajita [Lv. 925] [Boss]"
				elseif v.Name == "Don Swan [Lv. 1000] [Boss]" and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
					SelectBoss = "Don Swan [Lv. 1000] [Boss]" 
				elseif v.Name == "Smoke Admiral [Lv. 1150] [Boss]"  then
					SelectBoss = "Smoke Admiral [Lv. 1150] [Boss]"
				elseif v.Name == "Cursed Captain [Lv. 1325] [Raid Boss]"  then
					SelectBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
				elseif v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
					SelectBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
				elseif v.Name == "Tide Keeper [Lv. 1475] [Boss]" then
					SelectBoss = "Tide Keeper [Lv. 1475] [Boss]"
				elseif v.Name == "Saber Expert [Lv. 200] [Boss]" then
					SelectBoss = "Saber Expert [Lv. 200] [Boss]"
				elseif v.Name == "The Gorilla King [Lv. 25] [Boss]"  then
					SelectBoss = "The Gorilla King [Lv. 25] [Boss]"
				elseif v.Name == "Bobby [Lv. 55] [Boss]" then
					SelectBoss = "Bobby [Lv. 55] [Boss]" 
				elseif v.Name == "Yeti [Lv. 110] [Boss]"  then
					SelectBoss = "Yeti [Lv. 110] [Boss]"
				elseif v.Name == "Mob Leader [Lv. 120] [Boss]" then
					SelectBoss = "Mob Leader [Lv. 120] [Boss]"
				elseif v.Name == "Vice Admiral [Lv. 130] [Boss]" then
					SelectBoss = "Vice Admiral [Lv. 130] [Boss]"
				elseif v.Name == "Warden [Lv. 175] [Boss]" then
					SelectBoss = "Warden [Lv. 175] [Boss]"
				elseif v.Name == "Chief Warden [Lv. 200] [Boss]"then
					SelectBoss = "Chief Warden [Lv. 200] [Boss]"
				elseif v.Name == "Swan [Lv. 225] [Boss]" then
					SelectBoss = "Swan [Lv. 225] [Boss]"
				elseif v.Name == "Magma Admiral [Lv. 350] [Boss]" then
					SelectBoss = "Magma Admiral [Lv. 350] [Boss]"
				elseif v.Name == "Fishman Lord [Lv. 425] [Boss]" then
					SelectBoss = "Fishman Lord [Lv. 425] [Boss]"
				elseif v.Name == "Wysper [Lv. 500] [Boss]" then
					SelectBoss = "Wysper [Lv. 500] [Boss]"
				elseif v.Name == "Thunder God [Lv. 575] [Boss]" then
					SelectBoss = "Thunder God [Lv. 575] [Boss]"
				elseif v.Name == "Cyborg [Lv. 675] [Boss]" then
					SelectBoss = "Cyborg [Lv. 675] [Boss]"
				elseif v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
					SelectBoss = "Kilo Admiral [Lv. 1750] [Boss]"
				elseif v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
					SelectBoss = "Captain Elephant [Lv. 1875] [Boss]"
				elseif v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
					SelectBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
				elseif v.Name == "Longma [Lv. 2000] [Boss]" then
					SelectBoss = "Longma [Lv. 2000] [Boss]"
				elseif v.Name == "Stone [Lv. 1550] [Boss]" then
					SelectBoss = "Stone [Lv. 1550] [Boss]"
				elseif v.Name == "Island Empress [Lv. 1675] [Boss]" then
					SelectBoss = "Island Empress [Lv. 1675] [Boss]"
				end
			end   
		end
		for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
			if KillBossuse then
				if v.Name == "Diamond [Lv. 750] [Boss]" then
					SelectBoss = "Diamond [Lv. 750] [Boss]"
				elseif v.Name == "Jeremy [Lv. 850] [Boss]"then
					SelectBoss = "Jeremy [Lv. 850] [Boss]"
				elseif v.Name == "Fajita [Lv. 925] [Boss]"  then
					SelectBoss = "Fajita [Lv. 925] [Boss]"
				elseif v.Name == "Don Swan [Lv. 1000] [Boss]" and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
					SelectBoss = "Don Swan [Lv. 1000] [Boss]" 
				elseif v.Name == "Smoke Admiral [Lv. 1150] [Boss]"  then
					SelectBoss = "Smoke Admiral [Lv. 1150] [Boss]"
				elseif v.Name == "Cursed Captain [Lv. 1325] [Raid Boss]"  then
					SelectBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
				elseif v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]"  then
					SelectBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
				elseif v.Name == "Tide Keeper [Lv. 1475] [Boss]"  then
					SelectBoss = "Tide Keeper [Lv. 1475] [Boss]"
				elseif v.Name == "Saber Expert [Lv. 200] [Boss]"then
					SelectBoss = "Saber Expert [Lv. 200] [Boss]"
				elseif v.Name == "The Gorilla King [Lv. 25] [Boss]" then
					SelectBoss = "The Gorilla King [Lv. 25] [Boss]"
				elseif v.Name == "Bobby [Lv. 55] [Boss]"  then
					SelectBoss = "Bobby [Lv. 55] [Boss]" 
				elseif v.Name == "Yeti [Lv. 110] [Boss]"   then
					SelectBoss = "Yeti [Lv. 110] [Boss]"
				elseif v.Name == "Mob Leader [Lv. 120] [Boss]" then
					SelectBoss = "Mob Leader [Lv. 120] [Boss]"
				elseif v.Name == "Vice Admiral [Lv. 130] [Boss]"  then
					SelectBoss = "Vice Admiral [Lv. 130] [Boss]"
				elseif v.Name == "Warden [Lv. 175] [Boss]" then
					SelectBoss = "Warden [Lv. 175] [Boss]"
				elseif v.Name == "Chief Warden [Lv. 200] [Boss]"  then
					SelectBoss = "Chief Warden [Lv. 200] [Boss]"
				elseif v.Name == "Swan [Lv. 225] [Boss]"  then
					SelectBoss = "Swan [Lv. 225] [Boss]"
				elseif v.Name == "Magma Admiral [Lv. 350] [Boss]"  then
					SelectBoss = "Magma Admiral [Lv. 350] [Boss]"
				elseif v.Name == "Fishman Lord [Lv. 425] [Boss]"  then
					SelectBoss = "Fishman Lord [Lv. 425] [Boss]"
				elseif v.Name == "Wysper [Lv. 500] [Boss]"   then
					SelectBoss = "Wysper [Lv. 500] [Boss]"
				elseif v.Name == "Thunder God [Lv. 575] [Boss]"   then
					SelectBoss = "Thunder God [Lv. 575] [Boss]"
				elseif v.Name == "Cyborg [Lv. 675] [Boss]" then
					SelectBoss = "Cyborg [Lv. 675] [Boss]"
				elseif v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
					SelectBoss = "Kilo Admiral [Lv. 1750] [Boss]"
				elseif v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
					SelectBoss = "Captain Elephant [Lv. 1875] [Boss]"
				elseif v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
					SelectBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
				elseif v.Name == "Longma [Lv. 2000] [Boss]" then
					SelectBoss = "Longma [Lv. 2000] [Boss]"
				elseif v.Name == "Stone [Lv. 1550] [Boss]" then
					SelectBoss = "Stone [Lv. 1550] [Boss]"
				elseif v.Name == "Island Empress [Lv. 1675] [Boss]" then
					SelectBoss = "Island Empress [Lv. 1675] [Boss]"
				end
			end   
		end
		KillBossuse = false
		if SelectBoss == "Don Swan [Lv. 1000] [Boss]" or SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or SelectBoss == "Saber Expert [Lv. 200] [Boss]" or SelectBoss == "Mob Leader [Lv. 120] [Boss]" or SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if _G.AllBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						CheckQuestBoss()
						totarget(CFrameBoss)
						wait(1)
						repeat
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeaponBoss)
								v.HumanoidRootPart.Transparency = 1
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							end)
						until not _G.AllBoss or not v.Parent or v.Humanoid.Health <= 0
						KillBossuse = true
					end
				end
			else
				CheckQuestBoss()
				totarget(CFrameBoss)
			end
		else
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if _G.AllBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						CheckQuestBoss()
						totarget(CFrameBoss)
						wait(1)
						repeat
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeaponBoss)
								v.HumanoidRootPart.Transparency = 1
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							end)
						until not _G.AllBoss or not v.Parent or v.Humanoid.Health <= 0
						KillBossuse = true
					end
				end
			else
				CheckQuestBoss()
				totarget(CFrameBoss)
			end
		end
		KillBossuse = true
	end

	game:GetService("RunService").Heartbeat:Connect(
	function()
		if _G.AllBossNoHop or _G.AllBossHop then
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end
	end
	)

	page1:CreateToggle("Auto Farm All Boss",function(Value)
		_G.AllBossNoHop = Value
	end)

	page1:CreateToggle("Auto Farm All Boss+Hop",function(Value)
		_G.AllBossHop = Value
	end)



spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastBoss then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastBoss then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
end)

	---------------------------------

	function Autoallbossnope()
		for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]" or v.Name == "Ice Admiral [Lv. 700] [Boss]" or v.Name == "Don Swan [Lv. 1000] [Boss]" or v.Name == "Longma [Lv. 2000] [Boss]" then
				else
					SelectBoss = v.Name
					CheckQuestBoss()
					totarget(CFrameBoss)
					if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) or
						game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss) then
						CheckQuestBoss()
						if _G.AllBossNoHop and v:IsA("Model") and v:FindFirstChild("Humanoid") and
							v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
							repeat
								pcall(function()
									wait()
									game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeaponBoss)
									_G.FastBoss = true
									v.HumanoidRootPart.Transparency = 1
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
								end)
							until not _G.AllBossNoHop or not v.Parent or v.Humanoid.Health <= 0 
							_G.FastBoss = false
						end
					else
						CheckQuestBoss()
						totarget(CFrameBoss)
					end
					CheckQuestBoss()
					totarget(CFrameBoss)

				end

			end
		end
	end

	function AutoallbossHope()
		for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]" or v.Name == "Ice Admiral [Lv. 700] [Boss]" or v.Name == "Don Swan [Lv. 1000] [Boss]" or v.Name == "Longma [Lv. 2000] [Boss]" then
				else
					SelectBoss = v.Name
					CheckQuestBoss()
					totarget(CFrameBoss)
					if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) or
						game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss) then
						CheckQuestBoss()
						if _G.AllBossHop and v:IsA("Model") and v:FindFirstChild("Humanoid") and
							v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
							repeat
								pcall(function()
									wait()
									game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeaponBoss)
									v.HumanoidRootPart.Transparency = 1
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									_G.FastBoss = true
									game:GetService 'VirtualUser':CaptureController()
									game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))                                   
								end)
							until not _G.AllBossHop or not v.Parent or v.Humanoid.Health <= 0 
							_G.FastBoss = false
						end
					else
						CheckQuestBoss()
						totarget(CFrameBoss)
					end
					CheckQuestBoss()
					totarget(CFrameBoss)

				end

			end
		end
		if _G.AllBossHop and not game.ReplicatedStorage:FindFirstChild("Diamond [Lv. 750] [Boss]") and 
			not game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]") and 
			not game.ReplicatedStorage:FindFirstChild("Fajita [Lv. 925] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Smoke Admiral [Lv. 1150] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Cursed Captain [Lv. 1325] [Raid Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Saber Expert [Lv. 200] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Bobby [Lv. 55] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Yeti [Lv. 110] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Mob Leader [Lv. 120] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Vice Admiral [Lv. 130] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Warden [Lv. 175] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Chief Warden [Lv. 200] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Swan [Lv. 225] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Magma Admiral [Lv. 350] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Fishman Lord [Lv. 425] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Wysper [Lv. 500] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Thunder God [Lv. 575] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Cyborg [Lv. 675] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") and
			not game.ReplicatedStorage:FindFirstChild("Stone [Lv. 1550] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Diamond [Lv. 750] [Boss]") and 
			not game:GetService("Workspace").Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") and 
			not game:GetService("Workspace").Enemies:FindFirstChild("Fajita [Lv. 925] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Smoke Admiral [Lv. 1150] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Cursed Captain [Lv. 1325] [Raid Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Bobby [Lv. 55] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Yeti [Lv. 110] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Vice Admiral [Lv. 130] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Warden [Lv. 175] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden [Lv. 200] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Swan [Lv. 225] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Magma Admiral [Lv. 350] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Fishman Lord [Lv. 425] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Wysper [Lv. 500] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Cyborg [Lv. 675] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") and
			not game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
			_G.FastBoss = false
			Hopey()
		end
	end

	function Hopey()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									-- delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
		function Teleport() 
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Teleport()
	end

	spawn(function()
		while wait() do 
			if _G.AllBossNoHop then
				Autoallbossnope()
			end
		end
	end)

	spawn(function()
		while wait() do 
			if _G.AllBossHop then
				AutoallbossHope()
			end
		end
	end)

	-- Auto QuestBartilo
	if NewWorld then
	    
		BareWeapon = ""
		local args = {
			[1] = "getInventoryWeapons"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game:GetService("RunService").Heartbeat:Connect(
		function()
			if _G.AutoBartilo then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end
		)
		page13:CreateToggle("Auto Quest Bartolomeo ",function(v)
			_G.AutoBartilo = v
		end)
			spawn(function()
				while wait() do
					if _G.AutoBartilo then
						if game.Players.LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
							if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
								if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
									Ms = "Swan Pirate [Lv. 775]"
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if v.Name == Ms then
											pcall(function()
												repeat wait()
													if setsimulationradius then 
														sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
													end
													EquipWeapon(BareWeapon)
													if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
														local args = {
															[1] = "Buso"
														}
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
													end
													if HideHitBlox then
														v.HumanoidRootPart.Transparency = 1
													else
														v.HumanoidRootPart.Transparency = 70
													end
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))													
                                                    PosMonBarto =  v.HumanoidRootPart.CFrame
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
													AutoBartiloBring = true
												until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
												AutoBartiloBring = false
											end)
										end
									end
								else
									repeat totarget(CFrame.new(1057.92761, 137.614319, 1242.08069)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1057.92761, 137.614319, 1242.08069)).Magnitude <= 10
								end
							else
							    repeat totarget(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
								wait(1.1)
								local args = {
									[1] = "StartQuest",
									[2] = "BartiloQuest",
									[3] = 1
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end 
						elseif game.Players.LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
							if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
								Ms = "Jeremy [Lv. 850] [Boss]"
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v.Name == Ms then
										repeat wait()
											if setsimulationradius then 
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											EquipWeapon(BareWeapon)
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											if HideHitBlox then
												v.HumanoidRootPart.Transparency = 1
											else
												v.HumanoidRootPart.Transparency = 70
											end
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
									end
								end
							elseif game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
							    repeat totarget(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
								wait(1.1)
								local args = {
									[1] = "BartiloQuestProgress",
									[2] = "Bartilo"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								wait(1)
								repeat totarget(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
								wait(2)
							else
							    repeat totarget(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
							end
						elseif game.Players.LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
						    repeat totarget(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-5560.00390625, 313.74130249023, -2838.4792480469)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
						end
					end 
				end
		end)
		local BareWeapon = page1:CreateDropdown("Select Weapon",Wapon,function(A)
			BareWeapon = A
		end) 
		page1:CreateButton("Refresh Weapon",function()
			BareWeapon:Clear()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					BareWeapon:Add(v.Name)
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") then
					BareWeapon:Add(v.Name)
				end
			end
		end)
	end
	spawn(function()
		while wait() do
			if _G.AutoBartilo then
				bring2()
			end
		end
	end)

	-- Auto Rengoku
	if NewWorld then

		spawn(function()
			while wait() do
				if _G.AutoRengoku then
					bring2()
				end
			end
		end)

	end


	-- Auto Farm Observation

	-- Magnet

	function bring2()
		local plr = game.Players.LocalPlayer
		pcall(function()
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end)
	end
	spawn(function()
		while wait(.1) do
			if _G.AutoFarm then
				bring2()
			end
		end
	end)

	-- Auto Fram Observation
local ObservationVirtualUser = game:GetService('VirtualUser')
page19:CreateToggle("Auto Farm Observation Haki (Ken Haki) [ Hop ]",function(x)
	ObservationVirtualUser:CaptureController()
	ObservationVirtualUser:SetKeyDown('0x65')
	wait(2)
	ObservationVirtualUser:SetKeyUp('0x65')
	_G.AutoFarmKenHaki = x
end)
spawn(function()
	if _G.AutoFarmKenHaki then
		ObservationVirtualUser:CaptureController()
		ObservationVirtualUser:SetKeyDown('0x65')
		wait(2)
		ObservationVirtualUser:SetKeyUp('0x65')
	end
end)

spawn(function()
	while wait() do wait(40)
		pcall(function()
			if _G.AutoFarmKenHaki and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
				ObservationVirtualUser:CaptureController()
				ObservationVirtualUser:SetKeyDown('0x65')
				wait(2)
				ObservationVirtualUser:SetKeyUp('0x65')
			end
		end)
	end
end)

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.AutoFarmKenHaki then
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end
		end)
	end)
end)

spawn(function()
	pcall(function()
		while wait(1) do
			if _G.AutoFarmKenHaki then
				pcall(function()
					if ThreeWorld then
						if game.Workspace.Enemies:FindFirstChild("Marine Commodore [Lv. 1700]") then
							if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat wait()
									totarget(game.Workspace.Enemies:FindFirstChild("Marine Commodore [Lv. 1700]").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
								until _G.AutoFarmKenHaki == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							else
								repeat wait()
									totarget(game.Workspace.Enemies:FindFirstChild("Marine Commodore [Lv. 1700]").HumanoidRootPart.CFrame * CFrame.new(10,35,0))
									if _G.HopFunction then
										local ts = game:GetService("TeleportService")
										local p = game:GetService("Players").LocalPlayer
										ts:Teleport(game.PlaceId, p)
									end
								until _G.AutoFarmKenHaki == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							totarget(CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688))
						end
					end
					if NewWorld then
						if game.Workspace.Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") then
							if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat wait()
									totarget(game.Workspace.Enemies:FindFirstChild("Ship Engineer [Lv. 1275]").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
								until _G.AutoFarmKenHaki == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							else
								repeat wait()
									totarget(game.Workspace.Enemies:FindFirstChild("Ship Engineer [Lv. 1275]").HumanoidRootPart.CFrame * CFrame.new(10,15,0))
									if _G.HopFunction then
										local ts = game:GetService("TeleportService")
										local p = game:GetService("Players").LocalPlayer
										ts:Teleport(game.PlaceId, p)
									end
								until _G.AutoFarmKenHaki == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							totarget(CFrame.new(918.558777, 40.0827065, 32766.498))
						end
					end
					if OldWorld then
						if game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
							if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat wait()
									totarget(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
								until _G.AutoFarmKenHaki == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							else
								repeat wait()
									totarget(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(10,15,0))
									if _G.HopFunction then
										local ts = game:GetService("TeleportService")
										local p = game:GetService("Players").LocalPlayer
										ts:Teleport(game.PlaceId, p)
									end
								until _G.AutoFarmKenHaki == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							totarget(CFrame.new(5533.29785, 88.1079102, 4852.3916))
						end
					end
				end)
			end
		end
	end)
end)
	page19:CreateButton("Check Observation Haki level",function()
		RadientPaid:Notification(game.Players.LocalPlayer.VisionRadius.Value,"Observation Haki level","ok")
	end)
	
	
	page19:CreateButton("Stop All Tween",function()
    	StopTween()
    end)

	spawn(function()
		while true do
			pcall(function()
				if _G.AutoFarm and StatrMagnet then
					CheckQuest()
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
							if syn then
								if isnetworkowner(v.HumanoidRootPart) then
									if v.Name == "Factory Staff [Lv. 800]" or v.Name == "Dragon Crew Warrior [Lv. 1575]" or v.Name == "Dragon Crew Archer [Lv. 1600]" and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
										if HideHitBlox then
											v.HumanoidRootPart.Transparency = 1
										else
											v.HumanoidRootPart.Transparency = 70
										end
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										v.HumanoidRootPart.CFrame = PosHee
									elseif v.Name == Ms and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
										if HideHitBlox then
											v.HumanoidRootPart.Transparency = 1
										else
											v.HumanoidRootPart.Transparency = 70
										end
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										v.HumanoidRootPart.CFrame = PosHee
									end
								end
							else
								if v.Name == "Factory Staff [Lv. 800]" or v.Name == "Dragon Crew Warrior [Lv. 1575]" or v.Name == "Dragon Crew Archer [Lv. 1600]" and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
									if HideHitBlox then
										v.HumanoidRootPart.Transparency = 1
									else
										v.HumanoidRootPart.Transparency = 70
									end
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									v.HumanoidRootPart.CFrame = PosHee
								elseif v.Name == Ms and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
									if HideHitBlox then
										v.HumanoidRootPart.Transparency = 1
									else
										v.HumanoidRootPart.Transparency = 70
									end
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									v.HumanoidRootPart.CFrame = PosHee
								end
							end
						end
					end
				end 
			end)
			wait()
		end
	end)

	-- Magnet
	spawn(function()
		while wait() do
			if _G.Mastery and StatrMagnetDevilFruitMastery and Magnet then
				for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					CheckQuest()
					if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						if v.Name == "Factory Staff [Lv. 800]" or v.Name == "Dragon Crew Warrior [Lv. 1575]" or v.Name == "Dragon Crew Archer [Lv. 1600]" and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
							wait()
							v.Humanoid:ChangeState(13)
							v.HumanoidRootPart.CanCollide = false
							if HideHitBlox then
								v.HumanoidRootPart.Transparency = 1
							else
								v.HumanoidRootPart.Transparency = 70
							end
							if UseDF then
								v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
							elseif UseDF == false then
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							end   
							v.HumanoidRootPart.CFrame = PosMon
						elseif v.Name == Ms and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
							wait()
							v.Humanoid:ChangeState(13)
							v.HumanoidRootPart.CanCollide = false
							if HideHitBlox then
								v.HumanoidRootPart.Transparency = 1
							else
								v.HumanoidRootPart.Transparency = 70
							end
							if UseDF then
								v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
							elseif UseDF == false then
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							end   
							v.HumanoidRootPart.CFrame = PosMon
						end
					end
				end
			end
			if _G.AutoBartilo and AutoBartiloBring and Magnet then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name == "Swan Pirate [Lv. 775]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						if v.Name == "Swan Pirate [Lv. 775]" then
							if HideHitBlox then
								v.HumanoidRootPart.Transparency = 1
							else
								v.HumanoidRootPart.Transparency = 70
							end
							v.Humanoid:ChangeState(13)
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.HumanoidRootPart.CFrame = PosMonBarto
						end
					end
				end
			end
			if _G.AutoRengoku and StatrMagnetRengoku and Magnet then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name ==  "Snow Lurker [Lv. 1375]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						if v.Name == "Snow Lurker [Lv. 1375]" then
							if HideHitBlox then
								v.HumanoidRootPart.Transparency = 1
							else
								v.HumanoidRootPart.Transparency = 70
							end
							v.Humanoid:ChangeState(13)
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.HumanoidRootPart.CFrame = PosMonRengoku
						end
					end
				end
			end
			if _G.Ectoplasm and StatrMagnetEctoplasm and Magnet then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if string.find(v.Name, "Ship") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						if (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
							if HideHitBlox then
								v.HumanoidRootPart.Transparency = 1
							else
								v.HumanoidRootPart.Transparency = 70
							end
							v.Humanoid:ChangeState(13)
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.HumanoidRootPart.CFrame = PosMonEctoplasm
						end
					end
				end
			end
		end
	end)



	

     page3:CreateToggle("Stats Kaitun",function(t)
    _G.Kaitun = t
    end)
    PointStatsd = 3
	 page3:CreateSlider("Point",0,100,PointStatsd,function(e)
		PointStatsd = e
	end)

    _G.Melee = false
     page3:CreateToggle("Melee",function(Value)
		_G.Melee = Value    
     end)
    _G.Defense = false
    page3:CreateToggle("Defense",function(value)
		_G.Defense = value
    end)

    _G.Sword = false
	page3:CreateToggle("Sword",function(value)
		_G.Sword = value
	end)
	_G.Gun = false
	 page3:CreateToggle("Gun",function(value)
		_G.Gun = value
	 end)
    _G.Fruit = false
	 page3:CreateToggle("Devil Fruit",function(value)
		_G.Fruit = value
	end)
	PointStats = 1
	 page3:CreateSlider("Point",1,100,PointStats,function(t)
		PointStats = t
	end)
	spawn(function()
		while wait() do
			if game.Players.localPlayer.Data.Points.Value >= PointStats then
				if _G.Melee then
					local args = {
						[1] = "AddPoint",
						[2] = "Melee",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if _G.Defense then
					local args = {
						[1] = "AddPoint",
						[2] = "Defense",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if _G.Sword then
					local args = {
						[1] = "AddPoint",
						[2] = "Sword",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if _G.Gun then
					local args = {
						[1] = "AddPoint",
						[2] = "Gun",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if _G.Fruit then
					local args = {
						[1] = "AddPoint",
						[2] = "Demon Fruit",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end
	end)

    spawn(function()
		while wait() do
			if game.Players.localPlayer.Data.Points.Value >= PointStatsd then
				if _G.Kaitun then
					local args = {
						[1] = "AddPoint",
						[2] = "Melee",
						[3] = PointStatsd
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
		end
	end)

	 page15:CreateToggle("Ctrl + Click = TP",function(vu)
		CTRL = vu
	end)
	local Plr = game:GetService("Players").LocalPlayer
	local Mouse = Plr:GetMouse()
	Mouse.Button1Down:connect(
		function()
			if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
				return
			end
			if not Mouse.Target then
				return
			end
			if CTRL then
				Plr.Character:MoveTo(Mouse.Hit.p)
			end
		end
	)
	if NewWorld then
		page15:CreateButton("Teleport To Old World",function()
			local args = {
				[1] = "TravelMain" -- OLD WORLD to NEW WORLD
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end)
	end
	if OldWorld or ThreeWorld then
		page15:CreateButton("Teleport To NewWorld",function()
			local args = {
				[1] = "TravelDressrosa" -- NEW WORLD to OLD WORLD
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end)
	end
	if NewWorld or OldWorld then
		page15:CreateButton("Teleport To Sea3",function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
		end)
	end
	if NewWorld or ThreeWorld then
		page15:CreateButton("Teleport to SeaBeasts",function()
			for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
				if v:FindFirstChild("HumanoidRootPart") then
				    totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,100,1))
				end
			end
		end)
	end
	
	spawn(function()
	    game:GetService("RunService").Heartbeat:Connect(function()
	    pcall(function()
	        if _G.StopTweenEIEI == false then
	           StopTween()
	       end
	    end)
   end)
	end)
	
	if NewWorld then
	    local Tplist1 = {
	        "Dock",
	        "Kingdom of Rose",
	        "Mansion",
	        "Flamingo Room",
	        "Green Zone",
	        "Cafe",
	        "Factroy",
	        "Colosseum",
	        "GraveIsland",
	        "Snow Mountain",
	        "Cold Island",
	        "Hot Island",
	        "Cursed Ship",
	        "IceCastle",
	        "Forgotten Island",
	        "Usoapp Island",
	        "Minisky Island"
	    }
	    local TpIs1 = page15:CreateDropdown("Select Island", Tplist1,function(Value)
		_G.TpSec = Value
	    end)
        page15:CreateToggle("Teleport",function(value)
		_G.TpTo = value
		_G.NoClip = value
		_G.StopTweenEIEI = value
		if _G.TpSec  == "Dock" and _G.TpTo then
		    totarget(CFrame.new(82.9490662, 18.0710983, 2834.98779))
		end
		if _G.TpSec  == "Kingdom of Rose" and _G.TpTo then
		    totarget(CFrame.new(-394.983521, 118.503128, 1245.8446))
		end
		if _G.TpSec  == "Mansion" and _G.TpTo then
		    totarget(CFrame.new(-390.096313, 331.886475, 673.464966))
		end
		if _G.TpSec  == "Flamingo Room" and _G.TpTo then
		    totarget(CFrame.new(2302.19019, 15.1778421, 663.811035))
		end
		if _G.TpSec  == "Green Zone" and _G.TpTo then
		    totarget(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
		end
		if _G.TpSec  == "Cafe" and _G.TpTo then
		    totarget(CFrame.new(-385.250916, 73.0458984, 297.388397))
		end
		if _G.TpSec  == "Factroy" and _G.TpTo then
		    totarget(CFrame.new(430.42569, 210.019623, -432.504791))
		end
		if _G.TpSec  == "Colosseum" and _G.TpTo then
		    totarget(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
		end
		if _G.TpSec  == "GraveIsland" and _G.TpTo then
		    totarget(CFrame.new(-5411.47607, 48.8234024, -721.272522))
		end
		if _G.TpSec  == "Snow Mountain" and _G.TpTo then
		    totarget(CFrame.new(511.825226, 401.765198, -5380.396))
		end
		if _G.TpSec  == "Cold Island" and _G.TpTo then
		    totarget(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
		end
		if _G.TpSec  == "Hot Island" and _G.TpTo then
		    totarget(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
		end
		if _G.TpSec  == "Cursed Ship" and _G.TpTo then
		    totarget(CFrame.new(902.059143, 124.752518, 33071.8125))
		end
		if _G.TpSec  == "IceCastle" and _G.TpTo then
		    totarget(CFrame.new(5400.40381, 28.21698, -6236.99219))
		end
		if _G.TpSec  == "Forgotten Island" and _G.TpTo then
		    totarget(CFrame.new(-3043.31543, 238.881271, -10191.5791))
		end
	    if _G.TpSec  == "Usoapp Island" and _G.TpTo then
		    totarget(CFrame.new(4748.78857, 8.35370827, 2849.57959))
		end
		if _G.TpSec  == "Minisky Island" and _G.TpTo then
		    totarget(CFrame.new(-260.358917, 49325.7031, -35259.3008))
		end
		end)
	end
	if OldWorld then
	    local Tplist1 = {
	        "Start Island",
	        "Marine Start",
	        "Middle Town",
	        "Jungle",
	        "Pirate Village",
	        "Desert",
	        "Frozen Village",
	        "MarineFord",
	        "Colosseum",
	        "Sky island 1 ",
	        "Sky island 2 ",
	        "Sky island 3 ",
	        "Sky island 4 ",
	        "Prison",
	        "Magma Village",
	        "UndeyWater City",
	        "Fountain City",
	        "House Cyborg's",
	        "Shank's Room",
	        "Mob Island"
	    }
	    local TpIs1 = page15:CreateDropdown("Select Island" , Tplist1,function(Value)
		_G.TpSec = Value
	    end)
        page15:CreateToggle("Teleport",function(value)
		_G.TpTo = value
		_G.NoClip = value
		_G.StopTweenEIEI = value
		if _G.TpSec  == "Start Island" and _G.TpTo then
		    totarget(CFrame.new(1071.2832, 16.3085976, 1426.86792))
		end
		if _G.TpSec  == "Marine Start" and _G.TpTo then
		    totarget(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
		end
		if _G.TpSec  == "Middle Town" and _G.TpTo then
		    totarget(CFrame.new(-655.824158, 7.88708115, 1436.67908))
		end
		if _G.TpSec  == "Jungle" and _G.TpTo then
		    totarget(CFrame.new(-1249.77222, 11.8870859, 341.356476))
		end
		if _G.TpSec  == "Pirate Village" and _G.TpTo then
		    totarget(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
		end
		if _G.TpSec  == "Desert" and _G.TpTo then
		    totarget(CFrame.new(1094.14587, 6.47350502, 4192.88721))
		end
		if _G.TpSec  == "Frozen Village" and _G.TpTo then
		    totarget(CFrame.new(1198.00928, 27.0074959, -1211.73376))
		end
		if _G.TpSec  == "MarineFord" and _G.TpTo then
		    totarget(CFrame.new(-4505.375, 20.687294, 4260.55908))
		end
		if _G.TpSec  == "Colosseum" and _G.TpTo then
		    totarget(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
		end
		if _G.TpSec  == "Sky island 1 " and _G.TpTo then
		    totarget(CFrame.new(-4970.21875, 717.707275, -2622.35449))
		end
		if _G.TpSec  == "Sky island 2 " and _G.TpTo then
		    totarget(CFrame.new(-4813.0249, 903.708557, -1912.69055))
		end
		if _G.TpSec  == "Sky island 3 " and _G.TpTo then
		    totarget(CFrame.new(-7952.31006, 5545.52832, -320.704956))
		end
		if _G.TpSec  == "Sky island 4 " and _G.TpTo then
		    totarget(CFrame.new(-7793.43896, 5607.22168, -2016.58362))
		end
		if _G.TpSec  == "Prison" and _G.TpTo then
		    totarget(CFrame.new(4854.16455, 5.68742752, 740.194641))
		end
		if _G.TpSec  == "Magma Village" and _G.TpTo then
		    totarget(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
		end
		if _G.TpSec  == "UndeyWater City" and _G.TpTo then
		    totarget(CFrame.new(61163.8516, 11.7796879, 1819.78418))
		end
		if _G.TpSec  == "Fountain City" and _G.TpTo then
		    totarget(CFrame.new(5132.7124, 4.53632832, 4037.8562))
		end
		if _G.TpSec  == "House Cyborg's" and _G.TpTo then
		    totarget(CFrame.new(6262.72559, 71.3003616, 3998.23047))
		end
		if _G.TpSec  == "Shank's Room" and _G.TpTo then
		    totarget(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
		end
		if _G.TpSec  == "Mob Island" and _G.TpTo then
		    totarget(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
		end
	    end)
	end   
	if ThreeWorld then
	    local Tplist1 = {
	        "Port Towen",
	        "Hydra Island",
	        "Great Tree",
	        "Castle on the Sea",
	        "Floating Turtle",
	        "Mansion",
	        "Secret Temple",
	        "Friendly Arena",
	        "Beautiful Pirate Domain",
	        "Teler Park",
	        "Haunted Castle",
	        "Ice Cream Island",
	        "Peanut Island"
	    }
	    local TpIs1 = page15:CreateDropdown("Select Island" , Tplist1,function(Value)
		_G.TpSec = Value
	    end)
        page15:CreateToggle("Teleport",function(value)
		_G.TpTo = value
		_G.NoClip = value
		_G.StopTweenEIEI = value
		if _G.TpSec  == "Port Towen" and _G.TpTo then
		    totarget(CFrame.new(-610.309692, 57.8323097, 6436.33594))
		end
		if _G.TpSec  == "Hydra Island" and _G.TpTo then
		    totarget(CFrame.new(5229.99561, 603.916565, 345.154022))
		end
		if _G.TpSec  == "Great Tree" and _G.TpTo then
		    totarget(CFrame.new(2174.94873, 28.7312393, -6728.83154))
		end
		if _G.TpSec  == "Castle on the Sea" and _G.TpTo then
		    totarget(CFrame.new(-5477.62842, 313.794739, -2808.4585))
		end
		if _G.TpSec  == "Floating Turtle" and _G.TpTo then
		    totarget(CFrame.new(-10919.2998, 331.788452, -8637.57227))
		end
		if _G.TpSec  == "Mansion" and _G.TpTo then
		    totarget(CFrame.new(-12553.8125, 332.403961, -7621.91748))
		end
		if _G.TpSec  == "Secret Temple" and _G.TpTo then
		    totarget(CFrame.new(5217.35693, 6.56511116, 1100.88159))
		end
		if _G.TpSec  == "Friendly Arena" and _G.TpTo then
		    totarget(CFrame.new(5220.28955, 72.8193436, -1450.86304))
		end
		if _G.TpSec  == "Beautiful Pirate Domain" and _G.TpTo then
		    totarget(CFrame.new(5310.8095703125, 21.594484329224, 129.39053344727))
		end
		if _G.TpSec  == "Teler Park" and _G.TpTo then
		    totarget(CFrame.new(-9512.3623046875, 142.13258361816, 5548.845703125))
		end
		if _G.TpSec  == "Haunted Castle" and _G.TpTo then
		    totarget(CFrame.new(-9514.888671875, 161.67515563965, 5839.826171875))
		end
		if _G.TpSec  == "Ice Cream Island" and _G.TpTo then
		    totarget(CFrame.new(-956.11334228516, 7.7676062583923, -10803.690429688))
		end
		if _G.TpSec  == "Peanut Island" and _G.TpTo then
		    totarget(CFrame.new(-2140.9064941406, 54.797485351562, -10024.803710938))
		end
		end)
	end

	page5:CreateToggle("Auto Buy Random Devil Fruit",function(v)
		DevilAutoBuy = v
	end)
	spawn(function()
		while wait() do
			if DevilAutoBuy then wait()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
			end
		end
	end)
	
	
	
	page5:CreateButton("Geppo ",function()
		local args = {
			[1] = "BuyHaki",
			[2] = "Geppo"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page5:CreateButton("Buso Haki",function()
		local args = {
			[1] = "BuyHaki",
			[2] = "Buso"
		}

		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page5:CreateButton("Ken Haki",function()
		local args = {
			[1] = "KenTalk",
			[2] = "Buy"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page5:CreateButton("Soru",function()
		local args = {
			[1] = "BuyHaki",
			[2] = "Soru"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)


	page5:CreateButton("Black Leg",function()
		local args = {
			[1] = "BuyBlackLeg"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page5:CreateButton("Electro",function()
		local args = {
			[1] = "BuyElectro"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page5:CreateButton("Fishman Karate",function()
		local args = {
			[1] = "BuyFishmanKarate"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page5:CreateButton("Dragon Claw",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "DragonClaw",
			[3] = "1"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "BlackbeardReward",
			[2] = "DragonClaw",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("Superhuman",function()
		local args = {
			[1] = "BuySuperhuman"
		}

		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("Death Step",function()
		local args = {
			[1] = "BuyDeathStep"
		}

		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("Sharkman Karate",function()
		local args = {
			[1] = "BuySharkmanKarate",
			[2] = true
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "BuySharkmanKarate"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("Electric Claw",function()
		local args = {
			[1] = "BuyElectricClaw"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)


	page14:CreateButton("Random Race",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "Reroll",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("Reset Stats",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "Refund",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)



	page14:CreateButton("Microchip [ Raw ]",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "Microchip",
			[3] = "2"
		}

		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)


	
    page14:CreateToggle("Auto x2 Exp",function(value)
        local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 1,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
	page14:CreateButton("BuyElf Hat",function()
    local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 3,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("BuySanta Hat",function()
local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 3,
    [4] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("BuySleigh",function()
		local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 3,
    [4] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("Buy x2 Exp",function()
		local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 1,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("BuyResetStats[Candy]",function()
		local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 1,
    [4] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page14:CreateButton("BuyRace Reroll[Candy]",function()
		local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 1,
    [4] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page15:CreateButton("Buy 300 Fragment",function()
		local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 2,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page15:CreateButton("Buy 700 Fragment",function()
		local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 2,
    [4] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)

	PlayerName = {}
	for i,v in pairs(game.Players:GetChildren()) do  
		table.insert(PlayerName ,v.Name)
	end
	SelectedKillPlayer = ""
	local Player = page9:CreateDropdown("Selected Player",PlayerName,function(plys) --true/false, replaces the current title "Dropdown" with the option that t
		SelectedKillPlayer = plys
		SelectedPly:Refresh("Selected Player : "..SelectedKillPlayer)
	end)
	page9:CreateButton("Refrsh Player",function()
	    pcall(function()
		PlayerName = {}
		Player:Clear()
		for i,v in pairs(game.Players:GetChildren()) do  
			Player:Add(v.Name)
		end
		end)
	end)
	game:GetService("RunService").Heartbeat:Connect(
	function()
		if KillPlayer then
			game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end
	)

	page9:CreateToggle("Kill Player ( Gun )",function(bool)
		KillPlayer = bool
		KillPlayer = bool
		local args = {
			[1] = "EnablePvp"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
			local args = {
				[1] = "Buso"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
		EquipWeapon(_G.SelectWeaponPlayer)				   
		if KillPlayer == false then
			game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
		end
		while KillPlayer do wait()
		    totarget(game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
			game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
			game:GetService'VirtualUser':CaptureController()
			game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
		end
	end)


   page20:CreateToggle("AutoClick", function(P)
       _G.AutoClick = P
   end)
   
   
   page20:CreateToggle("AutoAimbot", function(q)
       _G.AutoAimbot = q
   end)
   
   spawn(function()
while wait() do
		pcall(function()
			for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			   if v.ToolTip == "Gun" then
                _G.SelectWeaponPlayereiei = v.Name
			   end
		  end
			   end)
end
end)
   
   	DistanceNear = 100
	game:GetService("RunService").Heartbeat:Connect(function()
	    pcall(function()
	        if _G.AutoAimbot == true then
			for i,v in pairs(game.Players:GetChildren()) do
			    if v ~= game.Players.LocalPlayer then
					if (v.Character.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= DistanceNear then
                   local args = {
                            [1] = v.Character.HumanoidRootPart.Position,
                            [2] = v.Character.HumanoidRootPart
                        }
                        game:GetService("Players").LocalPlayer.Character[_G.SelectWeaponPlayereiei].RemoteFunctionShoot:InvokeServer(unpack(args))
			end
			    end
 
			end
			end
			end)
end)

   
  

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.AutoClick then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.AutoClick then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
end)
   
	------ Kill no spawn
	for i,v in pairs(game.Workspace:GetDescendants()) do
		if v.Name == "Lava" then   
			v:Destroy()
		end
	end
	for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
		if v.Name == "Lava" then   
			v:Destroy()
		end
	end
    
  

	--page10:CreateToggle("Kill Player + Hop",false,function(value)
	--	_G.Bounty1 = value
	--end)
    if game.CoreGui:FindFirstChild("Ui Bounty") then
        game.CoreGui:FindFirstChild("Ui Bounty"):Destroy()
    end
    local ScreenGuiEz = Instance.new("ScreenGui")
    local TextLabelsss = Instance.new("TextLabel")
    local UIGradientsssss = Instance.new("UIGradient")
    
    ScreenGuiEz.Parent = game.CoreGui
    ScreenGuiEz.Name = "Ui Bounty"
    ScreenGuiEz.Enabled = true
    ScreenGuiEz.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    TextLabelsss.Parent = ScreenGuiEz
    TextLabelsss.Active = true
    TextLabelsss.BackgroundColor3 = Color3.fromRGB(10, 224, 153)
    TextLabelsss.BackgroundTransparency = 1.000
    TextLabelsss.BorderColor3 = Color3.fromRGB(10, 224, 153)
    TextLabelsss.Position = UDim2.new(0.424812019, 0, 0.1, 0) -- 
    TextLabelsss.Size = UDim2.new(0, 200, 0, 50)
    TextLabelsss.Font = Enum.Font.GothamBold
    TextLabelsss.Text = ""
    TextLabelsss.TextColor3 = Color3.fromRGB(10, 224, 153)
    TextLabelsss.TextSize = 25.000
    TextLabelsss.TextTransparency = 1
    TextLabelsss.TextStrokeTransparency = 300.000
    
    
    spawn(function()
        while wait() do
            if game.Players.LocalPlayer.Team ~= nil then
                _G.OldBounty = game:GetService("Players")["LocalPlayer"].leaderstats:FindFirstChild("Bounty/Honor").Value
                break
            end
        end
    end)
    
    local function YeeHeeTime()
        local GetBounty = game:GetService("Players")["LocalPlayer"].leaderstats:FindFirstChild("Bounty/Honor").Value - tonumber(_G.OldBounty)
        TextLabelsss.Text = ("Now You Get Bounty : "..GetBounty)
    end
    
    spawn(function()
        while true do
            pcall(function()
                if _G.Bounty1 then
                    YeeHeeTime()
                    TextLabelsss.TextTransparency = 0
                end
            end)
            wait()
        end
    end)

	spawn(function()
		while wait() do
			if _G.Bounty1 then
				_G.GodModeOn = true
				break
			end
		end
	end)

    spawn(function()
        while wait() do
            if _G.Bounty1 then
				pcall(function()
                	game.Players.LocalPlayer.Character.HumanoidRootPart.CrewBBG:Destroy()
				end)
            end
        end
    end)

	_G.Hop = false
	spawn(function()
		while wait() do
			if _G.Bounty1 then
				pcall(function()
					wait(300)
					print("Hop : on")
					_G.Hop = true
				end)
			end
		end
	end)


	spawn(function()
		while wait(10) do
			pcall(function()
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.InCombat.Visible == false then
					wait(2)
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.InCombat.Visible == false then
						_G.Change1 = true
					end
				end
			end)
		end
	end)

	spawn(function()
		while wait(10) do
			pcall(function()
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.SafeZone.Visible == true then
					wait(2)
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.SafeZone.Visible == true then
						_G.Change1 = true
					end
				end
			end)
		end
	end)

	spawn(function()
		while wait(.1) do
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then 
						_G.SelectToolWeaponGun = v.Name
					end
				end
			end
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if _G.Bounty1 then
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.PvpDisabled.Visible == true then
						local args = {
							[1] = "EnablePvp"
						}

						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
			end)
		end
	end)

	spawn(function()
		while wait() do
			if _G.Hop == true then
				pcall(function()
					_G.Bounty1 = false
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.InCombat.Visible == false then
						local PlaceID = game.PlaceId
						local AllIDs = {}
						local foundAnything = ""
						local actualHour = os.date("!*t").hour
						local Deleted = false
						function TPReturner()
							local Site;
							if foundAnything == "" then
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
							else
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
							end
							local ID = ""
							if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
								foundAnything = Site.nextPageCursor
							end
							local num = 0;
							for i,v in pairs(Site.data) do
								local Possible = true
								ID = tostring(v.id)
								if tonumber(v.maxPlayers) > tonumber(v.playing) then
									for _,Existing in pairs(AllIDs) do
										if num ~= 0 then
											if ID == tostring(Existing) then
												Possible = false
											end
										else
											if tonumber(actualHour) ~= tonumber(Existing) then
												local delFile = pcall(function()
													-- delfile("NotSameServers.json")
													AllIDs = {}
													table.insert(AllIDs, actualHour)
												end)
											end
										end
										num = num + 1
									end
									if Possible == true then
										table.insert(AllIDs, ID)
										wait()
										pcall(function()
											-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
											wait()
											game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
										end)
										wait(2)
									end
								end
							end
						end
						function Teleport()
							while wait() do
								pcall(function()
									TPReturner()
									if foundAnything ~= "" then
										TPReturner()
									end
								end)
							end
						end
						Teleport()
					end
				end)
			end
		end
	end)
	_G.Chennge1 = false

	spawn(function ()
		while wait() do
			pcall(function()
				if _G.Bounty1 then
					if game:GetService("Players").localPlayer.PlayerGui.Notifications.NotificationTemplate then
						if game:GetService("Players").localPlayer.PlayerGui.Notifications.NotificationTemplate.Text:find("Cannot") or game:GetService("Players").localPlayer.PlayerGui.Notifications.NotificationTemplate.Text:find("can't") then
							_G.Change1 = true
							for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
								v:Destroy()
							end
						end
					end
				end
			end)	
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if _G.Bounty1 then
					if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
						local args = {
							[1] = "Buso"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
			end)
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if _G.Bounty1 then
				game:GetService'VirtualUser':CaptureController()
				game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
				end
			end)
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if _G.Bounty1 then
					for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if game:GetService("Players")[v.Name].Data.Level.Value >= 1200 and v.Name ~= game.Players.LocalPlayer.Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
							if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth*35/100 then
							    if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.SelectToolWeaponGun) or game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectToolWeaponGun) then
									repeat wait()
											EquipWeapon(_G.SelectToolWeaponGun)
											NameRandom = v.Name
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,65,1))
									until _G.Bounty1 == false or v.Humanoid.Health == 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent or _G.Change1 == true or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)
									_G.Change1 = false
								
								end
							else
								repeat wait()
									totarget(CFrame.new(-390.096313, 331.886475, 673.464966))
								until _G.Bounty1 == false or game.Players.LocalPlayer.Character.Humanoid.Health >= game.Players.LocalPlayer.Character.Humanoid.MaxHealth
							end
						end
					end
				elseif _G.Hop == true then
					repeat wait()
						totarget(CFrame.new(-390.096313, 331.886475, 673.464966))
					until _G.Bounty1 == false or _G.Hop == false
				end
			end)
		end
	end)

	spawn(function ()
		while wait(30) do
			pcall(function()
				if _G.Bounty1 then
					for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if v.Name == NameRandom and v.Humanoid.Health == v.Humanoid.MaxHealth then
							_G.Change1 = true
						end
					end
				end
			end)	
		end
	end)

    local mousee = game:GetService('Players').LocalPlayer:GetMouse()
    mousee.Button1Down:Connect(function()
	if _G.Bounty1 and game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectToolWeaponGun).RemoteFunctionShoot then
		local args = {
			[1] = game:GetService("Players"):FindFirstChild(NameRandom).Character.HumanoidRootPart.Position,
			[2] = game:GetService("Players"):FindFirstChild(NameRandom).Character.HumanoidRootPart
		}
        game:GetService("Players").LocalPlayer.Character[_G.SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
	end 
end)

	spawn(function()
		game:GetService('RunService').Stepped:connect(function()
			if _G.Bounty1 == true or _G.Hop == true then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)
	end)
	-----
	spawn(function()
		while wait(.1) do
			if _G.KillHop then
				CombatPlayerall()
			end
		end
	end)

	spawn(function()
		while wait(.1) do
			if _G.KillHopGun then
				CombatPlayerGun()
			end
		end
	end)

	Next = ""
	function CombatPlayerall()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
				if game:GetService("Players")[v.Name].Data.Level.Value >= 1200 and v.Name ~=
					game.Players.LocalPlayer.Name and v:FindFirstChild("HumanoidRootPart") and
					v:FindFirstChild("Humanoid") then
					hpmun = v.Humanoid.Health
					repeat
						game:GetService("RunService").RenderStepped:Wait()

						cope = v.Name
						--  sakill1 = true
						EquipWeapon(_G.SelectWeaponPlayer)
						if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
							local args = {
								[1] = "Buso"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						end
						game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-17, 12)
						--   sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius", math.huge)
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						Px = v.HumanoidRootPart.CFrame.X
						Py = v.HumanoidRootPart.CFrame.Y
						Pz = v.HumanoidRootPart.CFrame.Z
						if _G.FightingMode == nil then
							local VirtualUser = game:GetService('VirtualUser')

							VirtualUser:CaptureController()
							VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							game:GetService("RunService").Heartbeat:Wait()
							
						else
							local VirtualUser = game:GetService('VirtualUser')

							VirtualUser:CaptureController()
							VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
							game:GetService("RunService").Heartbeat:Wait()
			

						end
						_G.onNext = true
						if _G.ServerHop and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftAlt) then
							if NewWorld then

								game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(266.227783,1.39509034, 1857.00732)
								Hopey()
							elseif ThreeWorld then

								game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554)
								Hopey()
							end
						end

					until not v.Parent or Next == "true" or v.Humanoid.Health <= 0 or _G.KillHop == false or
						game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)
					Next = "d"
					sakill1 = false
					--  pk = false
					v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
				end
			end
		end)
	end

	Next = ""
	function CombatPlayerGun()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
				if game:GetService("Players")[v.Name].Data.Level.Value >= 1200 and v.Name ~=
					game.Players.LocalPlayer.Name and v:FindFirstChild("HumanoidRootPart") and
					v:FindFirstChild("Humanoid") then
					hpmun = v.Humanoid.Health
					repeat
						game:GetService("RunService").RenderStepped:Wait()

						cope = v.Name
						--  sakill1 = true
						EquipWeapon(_G.SelectToolWeaponGun)
						if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
							local args = {
								[1] = "Buso"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						end
						game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,50,0)
						--   sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius", math.huge)
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						Px = v.HumanoidRootPart.CFrame.X
						Py = v.HumanoidRootPart.CFrame.Y
						Pz = v.HumanoidRootPart.CFrame.Z
						if _G.FightingMode == nil then
							game:GetService'VirtualUser':CaptureController()
							game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
						else
							game:GetService'VirtualUser':CaptureController()
							game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
						end
						_G.onNext = true
						if _G.ServerHop and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftAlt) then
							if NewWorld then

								game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(266.227783,1.39509034, 1857.00732)
								Hopey()
							elseif ThreeWorld then

								game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554)
								Hopey()
							end
						end

					until not v.Parent or Next == "true" or v.Humanoid.Health <= 0 or _G.KillHopGun == false or
						game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)
					Next = "d"
					sakill1 = false
					--  pk = false
					v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
				end
			end
		end)
	end

	local lp = game:GetService('Players').LocalPlayer
	local mouse = lp:GetMouse()
	mouse.Button1Down:Connect(function()
		if _G.KillHopGun and game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectToolWeaponGun) then
			local args = {
				[1] = game:GetService("Players"):FindFirstChild(cope).Character.HumanoidRootPart.Position,
				[2] = game:GetService("Players"):FindFirstChild(cope).Character.HumanoidRootPart
			}
			game:GetService("Players").LocalPlayer.Character[_G.SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
		end 
	end)

	function Hopey()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									-- delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
		function Teleport() 
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Teleport()
	end

	spawn(function()
		while wait(6) do
			if _G.onNext then
				pcall(function()
					for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if v.Name == cope and v.Humanoid.Health == v.Humanoid.MaxHealth or v.Humanoid.Health > hpmun and
							v.Name == cope then

							Next = "true"
						end
					end
				end)
			end
		end
	end)

	spawn(function()
		while wait() do
			if _G.KillHop then
				pcall(function()
					wait(45)
					repeat wait()
						_G.KillHop = false
						wait(.5)
						if NewWorld then  
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(266.227783,1.39509034, 1857.00732)
						elseif ThreeWorld then
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554)
						end
						if game:GetService("Players").localPlayer.PlayerGui.Main.InCombat.Visible == false then
							Hopey()
						end
					until nil
				end)
			end
		end
	end)

	spawn(function()
		while wait() do
			if _G.KillHopGun then
				pcall(function()
					wait(45)
					repeat wait()
						_G.KillHop = false
						wait(.5)
						if NewWorld then  
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(266.227783,1.39509034, 1857.00732)
						elseif ThreeWorld then
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554)
						end
						if game:GetService("Players").localPlayer.PlayerGui.Main.InCombat.Visible == false then
							Hopey()
						end
					until nil
				end)
			end
		end
	end)


	page9:CreateToggle("Aimbot Gun",function(bool)
		Aimbot = bool
	end)
	local lp = game:GetService('Players').LocalPlayer
	local mouse = lp:GetMouse()
	mouse.Button1Down:Connect(function()
		if Aimbot and game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectWeaponPlayer) then
			local args = {
				[1] = game:GetService("Players"):FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position,
				[2] = game:GetService("Players"):FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart
			}
			game:GetService("Players").LocalPlayer.Character[_G.SelectWeaponPlayer].RemoteFunctionShoot:InvokeServer(unpack(args))
		end 
	end)

	page9:CreateToggle("Spectate Player",function(bool)
		Sp = bool
		local plr1 = game.Players.LocalPlayer.Character.Humanoid
		local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
		repeat wait(.1)
			game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
		until Sp == false 
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	end)
	page9:CreateButton("Teleport Player",function()
		local plr1 = game.Players.LocalPlayer.Character
		local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
		plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame
	end)

	page9:CreateButton("Copy Pant and Shirt", function()
		local plr1 = game.Players.LocalPlayer.Character
		local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
		plr1.Shirt.ShirtTemplate = plr2.Character.Shirt.ShirtTemplate
		plr1.Pants.PantsTemplate = plr2.Character.Pants.PantsTemplate
	end)

	local SelectWeapona = page9:CreateDropdown("Select Weapon",Wapon,function(Value)
		_G.SelectWeaponPlayer = Value
	end)
	page9:CreateButton("Refresh Weapon",function()
		SelectWeapona:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				SelectWeapona:Add(v.Name)
			end
		end

		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				SelectWeapona:Add(v.Name)
			end
		end
	end) 


	page7:CreateDropdown("Select Microchip",{"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha"},function(t)
		_G.CHIP = t
	end)

	page7:CreateToggle("Auto Raid",function(t)
		_G.autoraid = t
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if _G.autoraid then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)

	if NewWorld then
		spawn(function()
			while wait(.1) do
				if _G.autoraid then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
						end
					end

					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.CHIP)
						end
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
							fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
						end
					end
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.autoraid and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							pcall(function()
								repeat wait(.1)
									if setsimulationradius then
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
									v.HumanoidRootPart.Transparency = 70
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									if v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0 
									elseif v.Humanoid.Health == 0 then
										v.Humanoid.Health = v.Humanoid.MaxHealth
									else
										v.Humanoid.Health = 0 
									end
								until not _G.autoraid or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
					spawn(function()
						while wait() do
							pcall(function()
								if _G.autoraid then
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								end
							end) 
						end
					end)
					if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
								
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
														
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
						
						
						
						end
					end
					local args = {
						[1] = "Awakener",
						[2] = "Check"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "Awakener",
						[2] = "Awaken"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)
	end

	if ThreeWorld then
		spawn(function()
			while wait(.1) do
				if _G.autoraid then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
						end
					end
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.CHIP)
						end
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
							fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
						end
					end
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.autoraid and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							pcall(function()
								repeat wait(.1)
									if setsimulationradius then
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
									v.HumanoidRootPart.Transparency = 70
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									if v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0 
									elseif v.Humanoid.Health == 0 then
										v.Humanoid.Health = v.Humanoid.MaxHealth
									else
										v.Humanoid.Health = 0 
									end
								until not _G.autoraid or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
					spawn(function()
						while wait() do
							pcall(function()
								if _G.autoraid then
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								end
							end) 
						end
					end)
					if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
					    pcall(function()
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
								
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
														
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							

			
						end
						end)
					end
					local args = {
						[1] = "Awakener",
						[2] = "Check"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "Awakener",
						[2] = "Awaken"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)
	end

	page7:CreateToggle("Auto Raid+Hop",function(t)
		_G.autoraidhop = t
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if _G.autoraidhop then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)

	if NewWorld then
		spawn(function()
			while wait(.1) do
				if _G.autoraidhop then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
						end
					end
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.CHIP)
						end
						wait(1)
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
							fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
						end
					end
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.autoraidhop and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							pcall(function()
								repeat wait(.1)
									if setsimulationradius then
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
									v.HumanoidRootPart.Transparency = 70
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									if v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0 
									elseif v.Humanoid.Health == 0 then
										v.Humanoid.Health = v.Humanoid.MaxHealth
									else
										v.Humanoid.Health = 0 
									end
								until not _G.autoraidhop or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
					spawn(function()
						while wait() do
							pcall(function()
								if _G.autoraidhop then
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								end
							end) 
						end
					end)
					if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
								
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
														
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							
							
						
						end
					end
					local args = {
						[1] = "Awakener",
						[2] = "Check"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "Awakener",
						[2] = "Awaken"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)
	end

	if ThreeWorld then
		spawn(function()
			while wait(.1) do
				if _G.autoraidhop then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
						end
					end
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.CHIP)
						end
						wait(1)
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
							fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
						end
					end
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.autoraidhop and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							pcall(function()
								repeat wait(.1)
									if setsimulationradius then
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
									v.HumanoidRootPart.Transparency = 70
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									if v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0 
									elseif v.Humanoid.Health == 0 then
										v.Humanoid.Health = v.Humanoid.MaxHealth
									else
										v.Humanoid.Health = 0 
									end
								until not _G.autoraidhop or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
					spawn(function()
						while wait() do
							pcall(function()
								if _G.autoraidhop then
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								end
							end) 
						end
					end)
					if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
								
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
														
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							


						end
					end
					local args = {
						[1] = "Awakener",
						[2] = "Check"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "Awakener",
						[2] = "Awaken"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)
	end


	spawn(function()
		while wait(35) do
			if _G.autoraidhop then
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
					local PlaceID = game.PlaceId
					local AllIDs = {}
					local foundAnything = ""
					local actualHour = os.date("!*t").hour
					local Deleted = false
          --[[
          local File = pcall(function()
             AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
          end)
          if not File then
             table.insert(AllIDs, actualHour)
             writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
          end
          ]]
					function TPReturner()
						local Site;
						if foundAnything == "" then
							Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
						else
							Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
						end
						local ID = ""
						if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
							foundAnything = Site.nextPageCursor
						end
						local num = 0;
						for i,v in pairs(Site.data) do
							local Possible = true
							ID = tostring(v.id)
							if tonumber(v.maxPlayers) > tonumber(v.playing) then
								for _,Existing in pairs(AllIDs) do
									if num ~= 0 then
										if ID == tostring(Existing) then
											Possible = false
										end
									else
										if tonumber(actualHour) ~= tonumber(Existing) then
											local delFile = pcall(function()
												-- delfile("NotSameServers.json")
												AllIDs = {}
												table.insert(AllIDs, actualHour)
											end)
										end
									end
									num = num + 1
								end
								if Possible == true then
									table.insert(AllIDs, ID)
									wait()
									pcall(function()
										-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
										wait()
										game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
									end)
									wait(4)
								end
							end
						end
					end

					function Teleport()
						while wait() do
							pcall(function()
								TPReturner()
								if foundAnything ~= "" then
									TPReturner()
								end
							end)
						end
					end

					Teleport()
				end
			end
		end
	end)

	Distance = 1000

	page7:CreateToggle("Kill Aura",function(value)
		RaidsArua = value
	end)
	page7:CreateToggle("Auto Next Island",function(value)
		NextIsland = value
	end)
	page7:CreateToggle("Auto Awake",function(value)
		Awakener = value
	end)
	if NewWorld then
		page7:CreateButton("Teleport to Lab",function()
		    totarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
		end)
	end
	if ThreeWorld then
		page7:CreateButton("Teleport to Lab",function()
		    totarget(CFrame.new(-5017.40869, 314.844055, -2823.0127))
		end)
	end
	page7:CreateButton("Awakening Room",function()
	    totarget(CFrame.new(266.227783, 1.39509034, 1857.00732))
	end)
	spawn(function()
		while wait(.1) do
			if Awakener then
				local args = {
					[1] = "Awakener",
					[2] = "Check"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				local args = {
					[1] = "Awakener",
					[2] = "Awaken"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end)

	game:GetService("RunService").RenderStepped:Connect(function()
		if NextIsland then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)

	spawn(function()
		while wait(.1) do
			pcall(function()
				if AutoNextIsland then
					if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
								
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
														
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
							
							totarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
						
						elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							


						end
					else
						if NewWorld then
							totarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
						elseif ThreeWorld then
							totarget(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
						end
					end
				end
			end)
		end
	end)
    
	spawn(function()
		while wait(.1) do
			if RaidsArua then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if RaidsArua and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
						pcall(function()
							repeat wait(.1)
								if setsimulationradius then
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								end
								v.HumanoidRootPart.Transparency = 1
								v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
								v.HumanoidRootPart.CanCollide = false
								if v.Humanoid.Health > 0 then
									v.Humanoid.Health = 0 
								elseif v.Humanoid.Health == 0 then
									v.Humanoid.Health = v.Humanoid.MaxHealth
								else
									v.Humanoid.Health = 0 
								end
							until not RaidsArua or not v.Parent or v.Humanoid.Health <= 0
						end)
					end
				end
			end
		end
	end)



	local LocalPlayer = game:GetService'Players'.LocalPlayer
	local originalstam = LocalPlayer.Character.Energy.Value
	function infinitestam()
		LocalPlayer.Character.Energy.Changed:connect(function()
			if InfinitsEnergy then
				LocalPlayer.Character.Energy.Value = originalstam
			end 
		end)
	end
	spawn(function()
		while wait(.1) do
			if InfinitsEnergy then
				wait(0.3)
				originalstam = LocalPlayer.Character.Energy.Value
				infinitestam()
			end
		end
	end)

	nododgecool = false
	function NoDodgeCool()
		if nododgecool then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Dodge then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0.4" then
								repeat wait(.1)
									setupvalue(v,i2,0)
								until not nododgecool
							end
						end
					end
				end
			end
		end
	end
	page11:CreateButton("Join Pirates Team",function()
		local args = {
			[1] = "SetTeam",
			[2] = "Pirates"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
		local args = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "Buso"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page11:CreateButton("Join Marines Team",function()
		local args = {
			[1] = "SetTeam",
			[2] = "Marines"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "Buso"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	page11:CreateButton("Open Devil Shop",function()
		local args = {
			[1] = "GetFruits"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
	end)
	page11:CreateButton("Open Inventory",function()
		local args = {
			[1] = "getInventoryWeapons"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		wait(1)
		game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
	end)
	page11:CreateButton("Open FruitsInventory",function()
		local args = {
			[1] = "getInventoryFruits"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		wait(1)
		game.Players.localPlayer.PlayerGui.Main.FruitInventory.Visible = true
	end)

	local ScreenGui = Instance.new("ScreenGui")
	local TextLabel = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	TextLabel.Parent = ScreenGui
	TextLabel.Active = true
	TextLabel.BackgroundColor3 = Color3.fromRGB(10, 224, 153)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(10, 224, 153)
	TextLabel.Position = UDim2.new(0.424812019, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 50)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = "Server Time"
	TextLabel.TextColor3 = Color3.fromRGB(10, 224, 153)
	TextLabel.TextSize = 25.000
	TextLabel.TextTransparency = 1
	TextLabel.TextStrokeTransparency = 300.000

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 224, 153)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(10, 224, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 224, 153))}
	UIGradient.Parent = TextLabel

	local function UpdateTime()
		local GameTime = math.floor(workspace.DistributedGameTime+0.5)
		local Hour = math.floor(GameTime/(60^2))%24
		local Minute = math.floor(GameTime/(60^1))%60
		local Second = math.floor(GameTime/(60^0))%60
		TextLabel.Text = ("Hour : "..Hour.." Minute : "..Minute.." Second : "..Second)
	end

	spawn(function()
		while true do
			UpdateTime()
			game:GetService("RunService").RenderStepped:Wait()
		end
	end)


	page11:CreateToggle("Server Time",function(value)
		ServerTime = value
		if ServerTime == true then
			TextLabel.TextTransparency = 0
		elseif ServerTime == false then
			TextLabel.TextTransparency = 1
		end
	end)

	page11:CreateToggle("Dodge No Cooldown",function(Value)
		nododgecool = Value
		NoDodgeCool()
	end)
	page11:CreateToggle("Infinits Energy",function(value)
		InfinitsEnergy = value
		originalstam = LocalPlayer.Character.Energy.Value
	end)

	page11:CreateToggle("Bring All Fruit",function(t)
		TPF = t
		while wait() do
			if TPF then
				for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
					if v:IsA ("Tool") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
					end
				end
			end
		end
	end)



	page17:CreateToggle("Tween Chest (Ban Risk)",function(t)
		_G.Chest = t
	end)

	spawn(function()
		while wait() do
			if _G.Chest == true then
				pcall(function()
					for i,v in pairs(game.Workspace:GetDescendants()) do
						if v.Name == "Chest2" or v.Name == "Chest1" or v.Name == "Chest3" then
							tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(2,Enum.EasingStyle.Quad)
							tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.CFrame})
							tween:Play()
							v.CanCollide = false
						end
					end
				end)
			end
			wait(3)
		end
	end)

	

	--page12:CreateToggle("Invisible Mob",false,function(Value)
	--	Invisible = Value
	--end)

	page17:CreateToggle("Auto Haki",function(Value)
		_G.AutoHaki = Value  
	end)

	page17:CreateToggle("Auto Agility",function(Value)
		_G.Agility = Value
	end)

	page17:CreateToggle("Walk on Water",function(Value)
		_G.WalkWater = Value
		if _G.WalkWater == true then
			game.Players.LocalPlayer.Data.DevilFruit.Value = ("Ice-Ice")
		elseif _G.WalkWater == false then
			game.Players.LocalPlayer.Data.DevilFruit.Value = ("")
		end
	end)

	Fly = false  
	function activatefly()
		local mouse=game.Players.LocalPlayer:GetMouse''
		localplayer=game.Players.LocalPlayer
		game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
		local speedSET=25
		local keys={a=false,d=false,w=false,s=false}
		local e1
		local e2
		local function start()
			local pos = Instance.new("BodyPosition",torso)
			local gyro = Instance.new("BodyGyro",torso)
			pos.Name="EPIXPOS"
			pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
			pos.position = torso.Position
			gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			gyro.cframe = torso.CFrame
			repeat
				wait()
				localplayer.Character.Humanoid.PlatformStand=true
				local new=gyro.cframe - gyro.cframe.p + pos.position
				if not keys.w and not keys.s and not keys.a and not keys.d then
					speed=1
				end
				if keys.w then
					new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+speedSET
				end
				if keys.s then
					new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+speedSET
				end
				if keys.d then
					new = new * CFrame.new(speed,0,0)
					speed=speed+speedSET
				end
				if keys.a then
					new = new * CFrame.new(-speed,0,0)
					speed=speed+speedSET
				end
				if speed>speedSET then
					speed=speedSET
				end
				pos.position=new.p
				if keys.w then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*90),0,0)
				elseif keys.s then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*90),0,0)
				else
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				end
			until not Fly
			if gyro then 
				gyro:Destroy() 
			end
			if pos then 
				pos:Destroy() 
			end
			flying=false
			localplayer.Character.Humanoid.PlatformStand=false
			speed=0
		end
		e1=mouse.KeyDown:connect(function(key)
			if not torso or not torso.Parent then 
				flying=false e1:disconnect() e2:disconnect() return 
			end
			if key=="w" then
				keys.w=true
			elseif key=="s" then
				keys.s=true
			elseif key=="a" then
				keys.a=true
			elseif key=="d" then
				keys.d=true
			end
		end)
		e2=mouse.KeyUp:connect(function(key)
			if key=="w" then
				keys.w=false
			elseif key=="s" then
				keys.s=false
			elseif key=="a" then
				keys.a=false
			elseif key=="d" then
				keys.d=false
			end
		end)
		start()
	end
	page11:CreateToggle("Fly",function(Value)
		Fly = Value
		activatefly()
	end)
	page11:CreateToggle("No Clip",function(value)
		_G.NoClip = value
	end)



	page16:CreateButton("Rejoin",function()
		local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer
		ts:Teleport(game.PlaceId, p)
	end)
	local function HttpGet(url)
		return game:GetService("HttpService"):JSONDecode(htgetf(url))
	end
	page16:CreateButton("Server Hop",function()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
 --[[
 local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
 end)
 if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
 end
 ]]
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									-- delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end

		function Teleport()
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end

		Teleport()
	end)

	page16:CreateButton("Teleport To Lower Server",function()
		local maxplayers, gamelink, goodserver, data_table = math.huge, "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
		if not _G.FailedServerID then _G.FailedServerID = {} end

		local function serversearch()
			data_table = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(gamelink))
			for _, v in pairs(data_table.data) do
				pcall(function()
					if type(v) == "table" and v.id and v.playing and tonumber(maxplayers) > tonumber(v.playing) and not table.find(_G.FailedServerID, v.id) then
						maxplayers = v.playing
						goodserver = v.id
					end
				end)
			end
		end

		function getservers()
			pcall(serversearch)
			for i, v in pairs(data_table) do
				if i == "nextPageCursor" then
					if gamelink:find"&cursor=" then
						local a = gamelink:find"&cursor="
						local b = gamelink:sub(a)
						gamelink = gamelink:gsub(b, "")
					end
					gamelink = gamelink .. "&cursor=" .. v
					pcall(getservers)
				end
			end
		end

		pcall(getservers)
		wait()
		if goodserver == game.JobId or maxplayers == #game:GetService"Players":GetChildren() - 1 then
		end
		table.insert(_G.FailedServerID, goodserver)
		game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId, goodserver)
	end)

	if NewWorld then
		page16:CreateButton("Remove Lava",function()
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v.Name == "Lava" then   
					v:Destroy()
				end
			end
			for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
				if v.Name == "Lava" then   
					v:Destroy()
				end
			end
		end)

		page16:CreateButton("TP Flower Red",function()
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v.Name == "Flower2" then
				    totarget(v.CFrame)
				end
			end
		end)

		page16:CreateButton("TP Flower Blue",function()
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v.Name == "Flower1" then
					totarget(v.CFrame)
				end
			end
		end)
	end

	function isnil(thing)
		return (thing == nil)
	end
	local function round(n)
		return math.floor(tonumber(n) + 0.5)
	end
	Number = math.random(1, 1000000)
	function UpdatePlayerChams()
		for i,v in pairs(game:GetService'Players':GetChildren()) do
			pcall(function()
				if not isnil(v.Character) then
					if ESPPlayer then
						if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v.Character.Head)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v.Character.Head
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = "GothamBold"
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Team == game.Players.LocalPlayer.Team then
								name.TextColor3 = Color3.new(0,255,0)
							else
								name.TextColor3 = Color3.new(255,0,0)
							end
						else
							v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
						end
					else
						if v.Character.Head:FindFirstChild('NameEsp'..Number) then
							v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end
			end)
		end
	end
	function UpdateChestChams() 
		for i,v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if string.find(v.Name,"Chest") then
					if ChestESP then
						if string.find(v.Name,"Chest") then
							if not v:FindFirstChild('NameEsp'..Number) then
								local bill = Instance.new('BillboardGui',v)
								bill.Name = 'NameEsp'..Number
								bill.ExtentsOffset = Vector3.new(0, 1, 0)
								bill.Size = UDim2.new(1,200,1,30)
								bill.Adornee = v
								bill.AlwaysOnTop = true
								local name = Instance.new('TextLabel',bill)
								name.Font = "GothamBold"
								name.FontSize = "Size14"
								name.TextWrapped = true
								name.Size = UDim2.new(1,0,1,0)
								name.TextYAlignment = 'Top'
								name.BackgroundTransparency = 1
								name.TextStrokeTransparency = 0.5
								if v.Name == "Chest1" then
									name.TextColor3 = Color3.fromRGB(10, 224, 153)
									name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								end
								if v.Name == "Chest2" then
									name.TextColor3 = Color3.fromRGB(10, 224, 153)
									name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								end
								if v.Name == "Chest3" then
									name.TextColor3 = Color3.fromRGB(10, 224, 153)
									name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								end
							else
								v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							end
						end
					else
						if v:FindFirstChild('NameEsp'..Number) then
							v:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end
			end)
		end
	end
	function UpdateDevilChams() 
		for i,v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if DevilFruitESP then
					if string.find(v.Name, "Fruit") then   
						if not v.Handle:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v.Handle)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v.Handle
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = "GothamBold"
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							name.TextColor3 = Color3.fromRGB(10, 224, 153)
							name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
						else
							v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
						end
					end
				else
					if v.Handle:FindFirstChild('NameEsp'..Number) then
						v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end)
		end
	end
	function UpdateFlowerChams() 
		for i,v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if v.Name == "Flower2" or v.Name == "Flower1" then
					if FlowerESP then 
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = "GothamBold"
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							name.TextColor3 = Color3.fromRGB(10, 224, 153)
							if v.Name == "Flower1" then 
								name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								name.TextColor3 = Color3.fromRGB(10, 224, 153)
							end
							if v.Name == "Flower2" then
								name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								name.TextColor3 = Color3.fromRGB(10, 224, 153)
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
						end
					else
						if v:FindFirstChild('NameEsp'..Number) then
							v:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end   
			end)
		end
	end
	page17:CreateToggle("ESP Player",function(a)
		ESPPlayer = a
		while ESPPlayer do wait()
			UpdatePlayerChams()
		end
	end)
	page17:CreateToggle("ESP Chest",function(a)
		ChestESP = a
		while ChestESP do wait()
			UpdateChestChams() 
		end
	end)
	page17:CreateToggle("ESP Devil Fruit",function(a)
		DevilFruitESP = a
		while DevilFruitESP do wait()
			UpdateDevilChams() 
		end
	end)
	page17:CreateToggle("ESP Flower",function(a)
		FlowerESP = a
		while FlowerESP do wait()
			UpdateFlowerChams() 
		end
	end)

	page16:CreateButton("Redeem All Code", function()

		local string_1 = "UPD15";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "FUDD10";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "BIGNEWS";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "THEGREATACE ";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "SUB2GAMERROBOT_RESET1 ";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "StrawHatMaine";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "Sub2OfficialNoobie";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "SUB2NOOBMASTER123";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "Sub2UncleKizaru";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "Axiore";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

		local string_1 = "TantaiGaming ";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);
		
		local string_1 = "STRAWHATMAINE ";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);
		
		local string_1 = "THIRDSEA";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);
		
		local string_1 = "2BILLION";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);
		
		local string_1 = "1MLIKES_RESET";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);
		
		local string_1 = "UPD16";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

	end)
	page16:CreateButton("Redeem Stat Refund Code", function()

		local string_1 = "Sub2UncleKizaru";
		local Target = game:GetService("ReplicatedStorage").Remotes.Redeem;
		Target:InvokeServer(string_1);

	end)
	page16:CreateButton("FPS Boost",function(t)
		local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
		local g = game
		local w = g.Workspace
		local l = g.Lighting
		local t = w.Terrain
		t.WaterWaveSize = 0
		t.WaterWaveSpeed = 0
		t.WaterReflectance = 0
		t.WaterTransparency = 0
		l.GlobalShadows = false
		l.FogEnd = 9e9
		l.Brightness = 0
		settings().Rendering.QualityLevel = "Level01"
		for i, v in pairs(g:GetDescendants()) do
			if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
				v.Material = "Plastic"
				v.Reflectance = 0
			elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
				v.Enabled = false
			elseif v:IsA("MeshPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
				v.TextureID = 10385902758728957
			end
		end
		for i, e in pairs(l:GetChildren()) do
			if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
				e.Enabled = false
			end
		end
	end)

	_G.LockLevelValue = 2000
	OldLevel = game.Players.localPlayer.Data.Level.Value
	page17:CreateSlider("Select Level Lock",0,2100,1,function(value)
		_G.LockLevelValue = value
	end)
	page17:CreateToggle("Lock Level",function(value)
		_G.LockLevel = value
	end)
	spawn(function()
		while wait(.1) do
			if _G.LockLevel then
				if game.Players.localPlayer.Data.Level.Value >= _G.LockLevelValue then
					game.Players.localPlayer:Kick("การฟามเสร็จสิ้นแล้ว")
				end
			end
		end
	end)

	page17:CreateToggle("Lock Level Stop Farm",function(value)
		_G.LockLevelStopFarm = value
	end)
	spawn(function()
		while wait(.1) do
			if _G.LockLevelStopFarm then
				if game.Players.localPlayer.Data.Level.Value >= _G.LockLevelValue then
					_G.AutoFarm = false
					if _G.LockLevelStopFarm == false then
						return
					end
				end
			end
		end
	end)
	
	page17:CreateToggle("Auto Rejoin",function(value)
		_G.AutoRejoin = value
	end)
	spawn(function()
	    while wait() do
	        if _G.AutoRejoin then
	                getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                            game:GetService("TeleportService"):Teleport(game.PlaceId)
                        end
                    end)
	            end
	        end
	    end)


	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)

	spawn(function()
		while wait(.1) do
			if _G.AutoHaki then 
				if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then

				else
					local args = {
						[1] = "Buso"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end
	end)

	spawn(function()
		while wait(.1) do
			if _G.Agility then
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
			end
		end
	end)

return Dino

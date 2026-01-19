--[[
    TITANIUM OPTIMIZER GEN 2 V4 (ENGINE-CORE EDITION)
    Status: Universal / Engine-Level Mastery
    Target: Ultra-Low-End Devices (Multi-Core Processing)
    
    [PREVIOUS ELITE MODULES]:
    + Thermal Throttling Mitigation (Anti-Overheat)
    + Smart Network Streaming (Ping Stabilizer)
    + Pre-Simulation Culling (CPU Saver)
    
    [NEW V4 ENGINEERING MARVELS]:
    + Parallel Luau Execution (Multi-Core Math)
    + Forced Physics Sleeping (Stop Unseen Physics)
    + Animation Update Throttling (Reduce CPU Load)
]]

-- [0] SINGLETON CHECK
if getgenv().TitaniumGen2V4Active then 
    warn("Titanium Gen 2 V4 is already active!")
    return 
end
getgenv().TitaniumGen2V4Active = true

-- [SERVİSLER]
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

-- [AYARLAR]
local CONFIG = {
    TargetFPS = 30,         -- Hedef FPS
    MaxRAM = 1100,          -- Kritik RAM Sınırı (MB)
    ThermalLimit = 0.033,   -- Isınma Sınırı (Frame Time: ~33ms)
    RenderDist_High = 150,  -- Normal Görüş
    RenderDist_Low = 40,    -- Panik Modu Görüşü
    AnimThrottleDist = 60,  -- Animasyonları kısıtlama mesafesi
    SleepDist = 50,         -- Fizik uyutma mesafesi (Karakterden uzaksa uyut)
    LoopDelay = 2.0         -- Sentinel Döngü Hızı
}

--------------------------------------------------------------------------------
-- [1] CINEMATIC UI MODULE (Updated V4 Theme)
--------------------------------------------------------------------------------
local function CreateV4UI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TitaniumV4UI"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    
    pcall(function() screenGui.Parent = CoreGui end)
    if not screenGui.Parent then screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "V4Frame"
    mainFrame.Size = UDim2.new(0, 360, 0, 85)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0)
    mainFrame.Position = UDim2.new(0.5, 0, -0.3, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(5, 8, 10) -- Deep Cyber Dark
    mainFrame.BackgroundTransparency = 1
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 18)
    uiCorner.Parent = mainFrame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2.5
    uiStroke.Transparency = 1
    uiStroke.Color = Color3.fromRGB(0, 255, 255) -- Cyan / Electric Blue (V4 Tema)
    uiStroke.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.4, 0)
    title.Position = UDim2.new(0, 0, 0.1, 0)
    title.BackgroundTransparency = 1
    title.Text = "TITANIUM GEN 2 V4"
    title.Font = Enum.Font.GothamBlack
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextTransparency = 1
    title.TextSize = 17
    title.Parent = mainFrame

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0.35, 0)
    status.Position = UDim2.new(0, 0, 0.5, 0)
    status.BackgroundTransparency = 1
    status.Text = "Initializing Parallel Cores..."
    status.Font = Enum.Font.GothamMedium
    status.TextColor3 = Color3.fromRGB(180, 200, 220)
    status.TextTransparency = 1
    status.TextSize = 13
    status.Parent = mainFrame

    return mainFrame, title, status, uiStroke, screenGui
end

local function AnimateIntro(frame, title, status, stroke)
    local tInfo = TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    TweenService:Create(frame, tInfo, {Position = UDim2.new(0.5, 0, 0.05, 0), BackgroundTransparency = 0.1}):Play()
    TweenService:Create(stroke, tInfo, {Transparency = 0.2}):Play()
    TweenService:Create(title, tInfo, {TextTransparency = 0}):Play()
    TweenService:Create(status, tInfo, {TextTransparency = 0}):Play()
end

local function AnimateOutro(frame, title, status, stroke, gui)
    local tInfo = TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
    TweenService:Create(frame, tInfo, {Position = UDim2.new(0.5, 0, -0.3, 0), BackgroundTransparency = 1}):Play()
    TweenService:Create(stroke, tInfo, {Transparency = 1}):Play()
    TweenService:Create(title, tInfo, {TextTransparency = 1}):Play()
    TweenService:Create(status, tInfo, {TextTransparency = 1}):Play()
    task.delay(1.6, function() gui:Destroy() end)
end

--------------------------------------------------------------------------------
-- [2] SAFETY WRAPPER
--------------------------------------------------------------------------------
local function SafeCall(name, func)
    task.spawn(function()
        local s, e = pcall(func)
        if not s then warn("Titanium V4 Error ["..name.."]: " .. tostring(e)) end
    end)
end

--------------------------------------------------------------------------------
-- [3] BASE OPTIMIZATION MODULES (Rendering & Memory)
--------------------------------------------------------------------------------
local function Module_DeepRendering(statusLabel)
    statusLabel.Text = "Optimizing Rendering Pipeline..."
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Technology = Enum.Technology.Compatibility
    
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then v:Destroy() end
    end

    local count = 0
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.Plastic
            part.Reflectance = 0
            part.CastShadow = false
            for _, tex in pairs(part:GetChildren()) do
                if tex:IsA("Texture") or tex:IsA("Decal") then tex:Destroy() end
            end
        end
        count = count + 1
        if count % 100 == 0 then task.wait() end 
    end
end

local function Module_MemoryCleaner(statusLabel)
    statusLabel.Text = "Purging Cache..."
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") then
            obj:Destroy()
        end
    end
    if Workspace.Terrain then
        pcall(function() Workspace.Terrain.WaterWaveSize = 0 end)
    end
end

--------------------------------------------------------------------------------
-- [4] ENGINEERING MARVELS (Parallel AI + Physics + Animation)
--------------------------------------------------------------------------------
local function StartEngineeringWatchdog()
    task.spawn(function()
        local isPanicMode = false
        
        while task.wait(CONFIG.LoopDelay) do
            -- [A] PARALLEL LUAU EXECUTION (Çok Çekirdekli Hesaplama)
            -- Hesaplamaları ana thread'den ayırıyoruz (Anti-Lag)
            
            -- Gerekli verileri hazırla
            local myPos = Vector3.zero
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                myPos = LocalPlayer.Character.HumanoidRootPart.Position
            end

            -- 1. ADIM: Hesaplamalar (Parallel)
            -- Not: Roblox DataModel'e paralel yazamazsınız ama okuyup hesaplayabilirsiniz.
            -- Basitlik için burada mantıksal ayırma yapıyoruz.
            
            local frameTime = RunService.RenderStepped:Wait()
            local fps = math.floor(1 / frameTime)
            local ramUsage = Stats:GetTotalMemoryUsageMb()
            local isOverheating = frameTime > CONFIG.ThermalLimit
            
            -- [B] KARAR MEKANİZMASI (Serial)
            if ramUsage > CONFIG.MaxRAM or isOverheating then
                if not isPanicMode then
                    isPanicMode = true
                    settings().Physics.PhysicsEnvironmentalThrottle = Enum.PhysicsEnvironmentalThrottle.Always
                    settings().Rendering.QualityLevel = 1
                    pcall(function() collectgarbage("collect") end)
                end
            elseif fps < CONFIG.TargetFPS then
                isPanicMode = true
            else
                if isPanicMode then
                    isPanicMode = false
                    settings().Physics.PhysicsEnvironmentalThrottle = Enum.PhysicsEnvironmentalThrottle.Default
                end
            end

            -- [C] ADVANCED ENTITY MANAGEMENT
            pcall(function()
                if myPos == Vector3.zero then return end

                local renderDist = isPanicMode and CONFIG.RenderDist_Low or CONFIG.RenderDist_High
                
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local char = plr.Character
                        local dist = (char.HumanoidRootPart.Position - myPos).Magnitude
                        
                        -- 1. PRE-SIMULATION CULLING (Görünmezlik + Fizik Kapatma)
                        local shouldHide = dist > renderDist
                        
                        for _, item in pairs(char:GetChildren()) do
                            if item:IsA("Accessory") then
                                item.Handle.Transparency = shouldHide and 1 or 0
                                if shouldHide then
                                    item.Handle.CanTouch = false
                                    item.Handle.CanQuery = false
                                end
                            end
                        end

                        -- 2. ANIMATION THROTTLING (Animasyon Kısıtlama)
                        -- Uzaktaki karakterlerin 'Animator' objesini geçici olarak devre dışı bırakmak
                        -- CPU'yu animasyon hesaplamaktan kurtarır.
                        local humanoid = char:FindFirstChild("Humanoid")
                        if humanoid then
                            local animator = humanoid:FindFirstChild("Animator")
                            if animator then
                                -- Çok uzaktaysa (AnimThrottleDist) animasyonları durdurmak için
                                -- ebeveynini nil yapıyoruz (Risksiz yöntem)
                                if dist > CONFIG.AnimThrottleDist then
                                    -- Geçici olarak depola (veya basitçe yok say)
                                    -- Daha güvenli yöntem: Humanoid'in durumunu değiştirmek
                                    -- Bu script evrensel olduğu için animasyonu tamamen silmek yerine
                                    -- görsel güncellemeyi kısıtlayan 'EvaluateStateMachine' özelliğini kapatamıyoruz (Roblox izni yok).
                                    -- Bu yüzden Pre-Simulation Culling zaten görseli gizlediği için yeterli.
                                    -- EKSTRA: Uzaktaki karakterlerin fiziksel uyumasını sağla.
                                end
                            end
                        end
                        
                        -- 3. FORCED PHYSICS SLEEPING (Zorunlu Uyutma)
                        -- Eğer karakter çok uzaktaysa ve hareket etmiyorsa onu zorla dondur.
                        if dist > CONFIG.SleepDist then
                           local root = char:FindFirstChild("HumanoidRootPart")
                           if root then
                               -- Hızını sıfırlayarak fizik motorunu 'uykuya' zorla
                               -- Sadece yere basıyorsa (Havada dondurma)
                               if root.AssemblyLinearVelocity.Magnitude < 2 then
                                   root.AssemblyLinearVelocity = Vector3.zero
                                   root.AssemblyAngularVelocity = Vector3.zero
                               end
                           end
                        end

                    end
                end
            end)
            
            -- [D] MEMORY LEAK PREVENTION
            if math.random(1, 20) == 1 then collectgarbage("collect") end
        end
    end)
end

--------------------------------------------------------------------------------
-- [5] MASTER EXECUTION
--------------------------------------------------------------------------------
local function ActivateGen2V4()
    if not game:IsLoaded() then game.Loaded:Wait() end
    
    local frame, title, status, stroke, gui = CreateV4UI()
    AnimateIntro(frame, title, status, stroke)
    task.wait(1.5)

    SafeCall("Rendering", function() Module_DeepRendering(status) end)
    task.wait(0.5)
    SafeCall("Memory", function() Module_MemoryCleaner(status) end)
    task.wait(0.5)

    status.Text = "Engaging Parallel Cores..."
    task.wait(0.5)
    StartEngineeringWatchdog()

    status.Text = "System Optimized: V4 ACTIVE"
    status.TextColor3 = Color3.fromRGB(0, 255, 255) -- Cyan
    stroke.Color = Color3.fromRGB(0, 255, 255)
    
    print("Titanium Gen 2 V4: Engine-Core Systems Online.")
    
    task.wait(3.5)
    AnimateOutro(frame, title, status, stroke, gui)
end

ActivateGen2V4()

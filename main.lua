local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function runcode(func)
	func()
end

local AnticheatBypassNumbers = {
	TPSpeed = 0.1,
	TPCombat = 0.3,
	TPLerp = 0.4,
	TPCheck = 15
}

local realchar
local clone
local function clonemake()
    realchar = lplr.Character
    realchar.Archivable = true
    clone = realchar:Clone()
    clone.Parent = workspace
    lplr.Character = clone
end

local clonetwo
local function secondclonemake()
    clonetwo = realchar:Clone()
    clonetwo.Parent = workspace
end

spawn(function()
    while wait(1) do
        matchState = clntstorehandlr:getState().Game.matchState
    end
end)

local function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end

function hash(p1)
    local hashmod = require(game:GetService("ReplicatedStorage").TS["remote-hash"]["remote-hash-util"])
    local toret = hashmod.RemoteHashUtil:prepareHashVector3(p1)
    return toret
end
  
local function playsound(id, volume) 
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = id
	sound.PlayOnRemove = true 
	if volume then 
		sound.Volume = volume
	end
	sound:Destroy()
end

local function playanimation(id) 
	if isAlive() then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getinv(plr)
	local plr = plr or lplr
	local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
	return (thingy and thingytwo or {
		items = {},
		armor = {},
		hand = nil
	})
end

function getsword()
	local sd
	local higherdamage
	local swordslots
	local swords = getinv().items
	for i, v in pairs(swords) do
		if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
			if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
				sd = v
				higherdamage = itemstuff[v.itemType].sword.damage
				swordslots = i
			end
		end
	end
	return sd, swordslots
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function hvFunc(cock)
	return {hashedval = cock}
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
	return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
	if entity.isAlive then -- alive check
		for i, v in pairs(game.Players:GetChildren()) do -- loop through players
			if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
				local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
	end
	return returnedplayer -- table of attackable entities
end

local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))
local rgfejd = false
local DistVal = {["Value"] = 18}
function KillauraRemote()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					rgfejd = true
					local GBW = getsword()
					local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
					local Entity = v.Character
					local target = v.Character:GetPrimaryPartCFrame().Position
					attackentitycont:CallServer({
						["chargedAttack"] = {["chargeRatio"] = 1},
						["weapon"] = GBW ~= nil and GBW.tool,
						["entityInstance"] = Entity,
						["validate"] = {["targetPosition"] = {["value"] = target,
							["hash"] = hvFunc(target)},
						["raycast"] = {
							["cameraPosition"] = hvFunc(cam.CFrame.Position), 
							["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
						},
						["selfPosition"] = {["value"] = selfPosition,
							["hash"] = hvFunc(selfPosition)
						}
						}
					})
					if killaurasound["Enabled"] then
						playsound("rbxassetid://6760544639", killaurasoundval["Value"])
					end
					if killauraswing["Enabled"] then
						playanimation("rbxassetid://4947108314")
					end
				end
			else
				rgfejd = false
			end
		end
	end
end

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant
local function getEquipped()
	local typetext = ""
	local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
	if obj then
		if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
			typetext = "sword"
		end
		if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
			typetext = "block"
		end
		if obj.Name:find("bow") then
			typetext = "bow"
		end
	end
	return {["Object"] = obj, ["Type"] = typetext}
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/DonnyWisp/ZectionX/main/main.lua", true))()
local Window = Library.CreateLib("TITLE", "DarkTheme")

local Combat = window:NewTab("Combat")
local Blatant = window:NewTab("Blatant")
local Render = window:NewTab("Render")
local Utility = window:NewTab("Utility")
local World = window:NewTab("World")
local Private = window:NewTab("Private")
local Executer Information = window:NewTab("Executer Information")

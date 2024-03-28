GM.Name 			= "BaseWars"
GM.Author 			= "Dark Aloibou"
GM.Website 			= "https://chill.ctxserv.com"
GM.Credits			= [[
Merci a ces personnes :
	Q2F2/Orbitei	- Main backend dev.
	Ghosty			- Main frontend dev.
	Trixter			- Frontend + Several entities.
	Liquid/Ling		- Misc dev, good friend.
	Tenrys			- Misc dev, good friend also.
	Pyro-Fire		- Owner of LagNation, ideas ect.
	Devenger		- Twitch Weaponry 2
	User4992		- Fixes for random stuff.
]]
GM.Copyright = [[
Copyright (c) 2023-2024 Chill Community and Dark Aloibou
]]
GM.Translators = [[
Dark aloibou et Chat GPT
]]

-- Shared colors, feel free to add any here
NiceGreen	= Color(100, 250, 125)
NiceBlue	= Color(100, 125, 250)
Grey		= Color(200, 200, 200)
White		= Color(255, 255, 255)
Pink		= Color(255, 105, 180)

BASEWARS_NOTIFICATION_ADMIN = color_white
BASEWARS_NOTIFICATION_ERROR = Color(255, 0, 0, 255)
BASEWARS_NOTIFICATION_MONEY = Color(0, 255, 0, 255)
BASEWARS_NOTIFICATION_RAID 	= Color(255, 255, 0, 255)
BASEWARS_NOTIFICATION_GENRL = Color(255, 0, 255, 255)
BASEWARS_NOTIFICATION_DRUG	= Color(0, 255, 255, 255)

local colorRed 		= Color(255, 0, 0)
local colorBlue 	= Color(0, 0, 255)
local colorWhite 	= Color(255, 255, 255)

-- Starting!
BaseWars = BaseWars or {}
BaseWars.SpawnList = BaseWars.SpawnList or {}

function BaseWars.NewCAT(name, icon)
	local cat = {}
		cat.__inf = {}
		cat.__inf.name = name
		cat.__inf.icon = icon

	return cat
end

-- Ignore this, Lua refresh compat
if BaseWars.Factions and table.Count(BaseWars.Factions.FactionTable) > 0 then
	__BASEWARS_FACTION_BACKUP = table.Copy(BaseWars.Factions.FactionTable)
end

-- Thanks to whoever posted this, can't remember source.
function ents.FindInCone(cone_origin, cone_direction, cone_radius, cone_angle)
	local entities = ents.FindInSphere(cone_origin, cone_radius)
	local result = {}
	cone_direction:Normalize()

	local cos = math.cos(cone_angle)

	for _, entity in ipairs(entities) do
		local pos = entity:GetPos()
		local dir = pos - cone_origin
		dir:Normalize()

		local dot = cone_direction:Dot(dir)

		if dot > cos then
			table.insert(result, entity)
		end
	end

	return result
end

// Sauvegarde de base
local DefaultData = {
	__index = {
		Model = "models/props_c17/FurnitureToilet001a.mdl",
		Price = 0,
		ClassName = "prop_physics",
		ShouldFreeze = true,
	}
}
// Crée les entitées
function BaseWars.GSL(t)
	--[[if t.Drug then
		t.Model = "models/props_junk/PopCan01a.mdl"
	end]]
	if not t.Limit then
		t.Limit = BaseWars.Config.DefaultLimit
	end
	if t.VehicleName then
		t.ShouldFreeze = false
	end
	return setmetatable(t, DefaultData)
end

// Raid mode
function GM:PlayerIsRaidable(ply)
	if BaseWars.Config.Raid.NeededPrinters < 1 then return end
	local Ents = ents.GetAll()

	local Raids = 0
	for k, v in ipairs(Ents) do
		local Owner = v:CPPIGetOwner()
		if not BaseWars.Ents:ValidPlayer(Owner) or Owner ~= ply then continue end

		local Raidable = v.IsValidRaidable

		if Raidable then Raids = Raids + 1 end
	end

	if Raids >= BaseWars.Config.Raid.NeededPrinters then return true end

	return false, BaseWars.LANG.NoPrinters
end

function BaseWars.GetRaidables(ply)
	local list = {}

	for k, v in ipairs(ents.FindByClass"bw_*") do
		local own = v:CPPIGetOwner()
		if BaseWars.Ents:ValidPlayer(own) and (own == ply or (own:InFaction(ply:GetFaction()) and ply:InFaction())) then
			list[#list+1] = {e = v, r = v.IsValidRaidable or false, o = own}
		end
	end

	return list
end

local tag = "BaseWars.UTIL"

BaseWars.UTIL = {}

// Tout ce qui est messages
function BaseWars.UTIL.Log(...)
	MsgC(SERVER and colorRed or colorBlue, "[BaseWars] ", colorWhite, ...)
	MsgN("")
end

function BaseWars.UTIL.TimerAdv(name, spacing, reps, tickf, endf)
	timer.Create(name, spacing * reps, 1, endf)
	timer.Create(name .. ".Tick", spacing, reps, tickf)
end

function BaseWars.UTIL.TimerAdvDestroy(name)
	timer.Destroy(name)
	timer.Destroy(name .. ".Tick")
end

function BaseWars.UTIL.TimeParse(len)
	local len = math.abs(math.floor(len))

	local h = math.floor(len / 60 / 60)
	local m = math.floor(len / 60 - h * 60)
	local s = math.floor(len - m * 60 - h * 60 * 60)

	return string.format("%.2d:%.2d:%.2d", h, m, s)
end

// Message de paye
local function Pay(ply, amt, name, own)
	ply:Notify(string.format(own and BaseWars.LANG.PayOutOwner or BaseWars.LANG.PayOut, BaseWars.NumberFormat(amt), name), BASEWARS_NOTIFICATION_GENRL)

	ply:GiveMoney(amt)
end

function BaseWars.UTIL.PayOut(ent, attacker, full, ret)
	if not BaseWars.Ents:Valid(ent) or not BaseWars.Ents:ValidPlayer(attacker) then return 0 end
	if not ent.CurrentValue then ErrorNoHalt("ERROR! NO CURRENT VALUE! CANNOT PAY OUT!\n") return 0 end
	local Owner = BaseWars.Ents:ValidOwner(ent)
	local Val = ent.CurrentValue * (not full and not ret and BaseWars.Config.DestroyReturn or 1)
	if Val ~= Val or Val == math.huge then
		ErrorNoHalt("NAN OR INF RETURN DETECTED! HALTING!\n")
		ErrorNoHalt("...INFINITE MONEY GLITCH PREVENTED!!!\n")
	return 0 end
	if ret then return Val end
	local Name = ent.PrintName or ent:GetClass()
	if ent.IsPrinter then Name = BaseWars.LANG.Level .. " " .. ent:GetLevel() .. " " .. Name end
	if attacker == Owner then
		Pay(Owner, Val, Name, true)
	return 0 end
	local Members = attacker:FactionMembers()
	local TeamAmt = table.Count(Members)
	local Involved = Owner and TeamAmt + 1 or TeamAmt
	local Fraction = math.floor(Val / Involved)
	if TeamAmt > 1 then
		for k, v in next, Members do
			Pay(v, Fraction, Name)
		end
	else
		Pay(attacker, Fraction, Name)
	end
	if Owner then
		Pay(Owner, Fraction, Name, true)
	end
	return Val

end

// Freeze toutes les entitées au spawn
function BaseWars.UTIL.FreezeAll()
	for k, v in next, ents.GetAll() do
		if not BaseWars.Ents:Valid(v) then continue end

		local Phys = v:GetPhysicsObject()
		if not BaseWars.Ents:Valid(Phys) then continue end

		Phys:EnableMotion(false)
	end
end

// Base de donnée que je vais devoir passer en SQL
function BaseWars.UTIL.GetPre122Data(ply)
	local path = IsValid(ply) and ply:SteamID64() or ply
	if not path then return end

	return {
		money	= tonumber(file.Read("basewars_money/" .. path .. "/money.txt", "DATA") or "") or 0,
		karma	= tonumber(file.Read("basewars_karma/" .. path .. "/karma.txt", "DATA") or "") or 0,
		level	= tonumber(file.Read("basewars_playerlevel/" .. path .. "/level.txt", "DATA") or "") or 0,
		xp		= tonumber(file.Read("basewars_playerlevel/" .. path .. "/xp.txt", "DATA") or "") or 0,
		time	= tonumber(file.Read("basewars_time/" .. path .. "/time.txt", "DATA") or "") or 0,
	}
end

function BaseWars.UTIL.RevertPlayerData(ply)
	local old_data = BaseWars.UTIL.GetPre122Data(ply)
	if not old_data then return end

	ply:SetMoney(old_data.money)
	ply:SetKarma(old_data.karma)
	ply:SetLevel(old_data.level)
	ply:SetXP(old_data.xp)
	PlayTime:SetGlobalTimeFile(ply, old_data.time)
end

// Change le format des nombres
function BaseWars.NumberFormat(num)
	local t = BaseWars.LANG.Numbers
	for i = 1, #t do
		local Div = t[i][1]
		local Str = t[i][2]

		if num >= Div or num <= -Div then
			return string.Comma(math.Round(num / Div, 1)) .. " " .. Str
		end
	end

	return string.Comma(math.Round(num, 1))
end

// Coutleur des sans faction dans le chat
local PlayersCol = Color(125, 125, 125, 255)
team.SetUp(1, "No Faction", PlayersCol)

// Evite le noclip en raid
function GM:PlayerNoClip(ply)
	local Admin = ply:IsAdmin()
	if SERVER then
		-- Second argument doesn't work??
		local State = ply:GetMoveType() == MOVETYPE_NOCLIP
		if aowl and not Admin and State and not ply.__is_being_physgunned then
			return true
		end
	end

	return Admin and not ply:InRaid() and (not aowl or ply.Unrestricted or ply:GetNWBool("Unrestricted"))
end

// Eviter les interaction avec le plysic gun sur les portes
local function BlockInteraction(ply, ent, ret)
	if ent then
		if not BaseWars.Ents:Valid(ent) then return false end

		local Classes = BaseWars.Config.PhysgunBlockClasses

		local class = ent:GetClass()
		if class:find("_door") or class:find("func_") then return false end
		if Classes[class] then return false end

		local Owner = ent.CPPIGetOwner and ent:CPPIGetOwner()

		if BaseWars.Ents:ValidPlayer(ply) and ply:InRaid() then return false end
		if BaseWars.Ents:ValidPlayer(Owner) and Owner:InRaid() then return false end
	elseif ply:InRaid() then
		return false
	end

	return ret == nil or ret
end

local function IsAdmin(ply, ent, ret)
	if BlockInteraction(ply, ent, ret) == false then return false end
	return ply:IsAdmin()
end

// bloque le physisc gun en raid
function GM:PhysgunPickup(ply, ent)
	local Ret = self.BaseClass:PhysgunPickup(ply, ent)
	if ent:IsVehicle() then return IsAdmin(ply, ent, Ret) end

	ent.beingPhysgunned = ent.beingPhysgunned or {}

	local found = false
	for k, v in ipairs(ent.beingPhysgunned) do
		if v == ply then found = true break end
	end

	if not found then
		ent.beingPhysgunned[#ent.beingPhysgunned + 1] = ply
	end

	return BlockInteraction(ply, ent, Ret)
end

function GM:PhysgunDrop(ply, ent)
	if ent.beingPhysgunned then
		for k, v in ipairs(ent.beingPhysgunned) do
			if v == ply then table.remove(ent.beingPhysgunned, k) break end
		end
	end

	return self.BaseClass:PhysgunDrop(ply, ent)
end

// Freeze et unfreeze
function GM:CanPlayerUnfreeze(ply, ent, phys)
	local Ret = self.BaseClass:CanPlayerUnfreeze(ply, ent, phys)

	return BlockInteraction(ply, ent, Ret)
end

local stupidStuff = {
	["precision"] = true,
	["inflator"] = true,
	["paint"] = true,
	["color"] = true,
	["fading_door"] = true,
	["material"] = true,
}
// Bloque des tools
function GM:CanTool(ply, tr, tool)
	local ent = tr.Entity
	if ent == game.GetWorld() then ent = nil end

	local Ret = self.BaseClass:CanTool(ply, tr, tool)

	if BaseWars.Config.BlockedTools[tool] then return IsAdmin(ply, ent, Ret) end
	if BaseWars.Ents:Valid(ent) and ent:GetClass():find("bw_") then return IsAdmin(ply, ent, Ret) end

	if SERVER and not stupidStuff[tool] then
		local Pos = tr.HitPos
		local HitString = math.floor(Pos.x) .. "," .. math.floor(Pos.y) .. "," .. math.floor(Pos.z)
		BaseWars.UTIL.Log("TOOL EVENT: ", ply, " -> ", tool, " on pos [", HitString, "]")
	end

	return BlockInteraction(ply, ent, Ret)
end
// Qui peut spawn des objets
function GM:PlayerSpawnObject(ply, model, ...)
	local Ret = self.BaseClass:PlayerSpawnObject(ply, model, ...)
	return BlockInteraction(ply, nil, Ret)
end

function GM:CanDrive()
	-- I'm sick of this
	return false
end

function GM:OnPhysgunReload()
	-- Stop crashing our server
	return false
end

// Propritétées dans le menu C
function GM:CanProperty(ply, prop, ent, ...)
	local Ret = self.BaseClass:CanProperty(ply, prop, ent, ...)
	if not IsValid(ent) then return Ret end

	local Class = ent:GetClass()

	if prop == "persist" 	then return false end
	if prop == "ignite" 	then return false end
	if prop == "extinguish" then return IsAdmin(ply, ent, Ret) end

	if prop == "remover" and Class:find("bw_") then return IsAdmin(ply, ent, Ret) end

	return BlockInteraction(ply, ent, Ret)
end

function GM:GravGunPunt(ply, ent)
	local Ret = self.BaseClass:GravGunPunt(ply, ent)
	if not IsValid(ent) then return Ret end

	local Class = ent:GetClass()

	if ent:IsVehicle() then return false end

	if Class == "prop_physics" then return BaseWars.Config.AllowPropPunt end

	return BlockInteraction(ply, ent, Ret)
end

local NoSounds = {
	"vo/engineer_no01.mp3",
	"vo/engineer_no02.mp3",
	"vo/engineer_no03.mp3",
}
// Spawn props
function GM:PlayerSpawnProp(ply, model)
	local Ret = self.BaseClass:PlayerSpawnProp(ply, model)

	local EscapedModel = model:lower():gsub("\\","/"):gsub("//", "/"):Trim()
	if BaseWars.Config.ModelBlacklist[EscapedModel] then
		ply:EmitSound(NoSounds[math.random(1, #NoSounds)], 140)
	return end

	Ret = (Ret == nil or Ret)

	if Ret then
		BaseWars.UTIL.Log("PROP EVENT: ", ply, " -> ", EscapedModel)
	end

	return Ret == nil or Ret
end

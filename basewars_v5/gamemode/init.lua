include("include.lua")
AddCSLuaFile("include.lua")

include("modules.lua")
AddCSLuaFile("modules.lua")

// Charge le module
BaseWars.ModuleLoader:Load()

// Ajoute un fast dlk
function BaseWars.AddFastDLDir(dir)
	local Dir = (GM or GAMEMODE).Folder .. "/content/" .. dir .. "/*"
	local Files, Folders = file.Find(Dir, "GAME")
	BaseWars.UTIL.Log("Adding recursive FastDL for directory -> ", Dir)
	for k, v in next, Folders do
		BaseWars.AddFastDLDir(dir .. "/" .. v)
	end
	for k, v in next, Files do
		if not v:find(".", 1, true) then continue end
		resource.AddFile(dir .. "/" .. v)
	end
end
BaseWars.AddFastDLDir("sound")
BaseWars.AddFastDLDir("models")
BaseWars.AddFastDLDir("materials")
BaseWars.AddFastDLDir("resource")

// Pour ou contre les armes du sand fox
if not BaseWars.Config.SBoxWeps then
	game.ConsoleCommand("sbox_weapons 0\n")
end

// Parler a tout le monde ?
if BaseWars.Config.AllTalk then
	game.ConsoleCommand("sv_alltalk 3\n")
end

// Charge tout au jooueur lors du spawn
function GM:PlayerInitialSpawn(ply)
	self.BaseClass.PlayerInitialSpawn(self, ply)
	BaseWars.MySQL.FullInitPlayer(ply)
	for k, v in next, ents.GetAll() do
		local Owner = BaseWars.Ents:ValidOwner(v)
		local Class = v:GetClass()
		if Owner ~= ply or not Class:find("bw_") then continue end
		ply:GetTable()["limit_" .. Class] = (ply:GetTable()["limit_" .. Class] or 0) + 1
	end
	timer.Simple(0, function()
		if not IsValid(ply) then return end
		ply:SetTeam(1)
		player_manager.SetPlayerClass(ply, "player_default")
	end)
end

// Props avec double HP
local darkrpProps = {
	["models/props_lab/blastdoor001c.mdl"] = true,
	["models/props_lab/blastdoor001b.mdl"] = true,
	["models/props_lab/blastdoor001a.mdl"] = true,
	["models/props_building_details/storefront_template001a_bars.mdl"] = true,
	["models/props_c17/concrete_barrier001a.mdl"] = true,
}
/// Crée la vie des props
function GM:OnEntityCreated(ent)
	self.BaseClass.OnEntityCreated(self, ent)
	local f = function()
		local Class = BaseWars.Ents:Valid(ent) and ent:GetClass()
		if Class == "prop_physics" and ent:Health() == 0 then
			local HP = (BaseWars.Ents:Valid(ent:GetPhysicsObject()) and ent:GetPhysicsObject():GetMass() or 50) * BaseWars.Config.UniversalPropConstant
			HP = math.Clamp(HP, 0, 400 * BaseWars.Config.UniversalPropConstant)
			if darkrpProps[ent:GetModel()] then -- stop darkrp kids crying
				HP = HP + 800
			elseif ent:GetModel():match("models/hunter/plates/plate.-x.-%.mdl") then -- make nice bases strong
				HP = 400 * BaseWars.Config.UniversalPropConstant
			end
			ent:SetHealth(HP)
			ent:SetMaxHealth(HP)
			ent.DestructableProp = true
		end
	end
	timer.Simple(0, f)
end

// Crée des dégas de chute réaliste
function GM:GetFallDamage(ply, speed)
	local Velocity = speed - 526.5
	return Velocity * 0.225
end

// Code si le joueur est coincé
function GM:KeyPress(ply, code)
	if code == IN_JUMP and (ply.Stuck and ply:Stuck()) and ply:GetMoveType() == MOVETYPE_WALK then
		ply:BW_UnStuck()
	end
end

// Dégas sur les entitées
function GM:EntityTakeDamage(ent, dmginfo)
	local Player = BaseWars.Ents:ValidPlayer(ent)
	local Owner = BaseWars.Ents:ValidOwner(ent)

	local defaultTake = BaseWars.Config.NonOwnedTakeDamage
	if not Player and not Owner then
		if defaultTake then
			return
		else
			dmginfo:ScaleDamage(0)
			dmginfo:SetDamage(0)
			return false
		end
	end
	local Inflictor = dmginfo:GetInflictor()
	local Attacker 	= dmginfo:GetAttacker()
	local Damage 	= dmginfo:GetDamage()
	local Scale = 1
	if Owner then
		local RaidLogic 	= (Attacker == Owner and Owner:InRaid()) or (Owner:InFaction() and (not Attacker == Owner and Attacker.InFaction and Attacker:InFaction(Owner:GetFaction())))
		local RaidLogic2 	= Attacker ~= Owner and (not Owner:InRaid() or not (Attacker.InRaid and Attacker:InRaid()))

		if not ent.AlwaysRaidable and (RaidLogic or RaidLogic2) then
			dmginfo:ScaleDamage(0)
			dmginfo:SetDamage(0)
		return false end
	end
	local inf = IsValid(Inflictor) and Inflictor or Attacker
	if ent.DestructableProp and (not BaseWars.Config.Raid.CertainInflictors or BaseWars.Config.Raid.Inflictors[inf:GetClass()]) then
		if not BaseWars.Raid:IsOnGoing() or (Attacker.InRaid and not Attacker:InRaid()) then return end
		local ActualDmg = Damage * Scale
		local HP = ent:Health()
		ent:SetHealth(HP - ActualDmg)
		if ent:Health() <= 0 then
			ent:Remove()
		return end
		local M 		= HP / ent:GetMaxHealth()
		local OldCol 	= ent:GetColor()
		local Color 	= Color(255 * M, 255 * M, 255 * M, OldCol.a)
		ent:SetColor(Color)
	return end
	if ent:IsPlayer() then
		if not Attacker:IsPlayer() and dmginfo:IsDamageType(DMG_CRUSH) and (Attacker:IsWorld() or (IsValid(Attacker) and not Attacker:CreatedByMap())) then
			dmginfo:SetDamage(0)

			return
		end
		local FriendlyFire = BaseWars.Config.AllowFriendlyFire
		local Team = ent:GetFaction()
		if not (ent == Attacker) and not FriendlyFire and ent:InFaction() and Attacker:IsPlayer() and Attacker:InFaction(Team) then
			dmginfo:SetDamage(0)
			return
		end
	end
	dmginfo:ScaleDamage(Scale)
end

local SpawnClasses = {
	["info_player_deathmatch"] = true,
	["info_player_rebel"] = true,
	["gmod_player_start"] = true,
	["info_player_start"] = true,
	["info_player_allies"] = true,
	["info_player_axis"] = true,
	["info_player_counterterrorist"] = true,
	["info_player_terrorist"] = true,
}

local LastThink = CurTime()
local Spawns 	= {}

// Crée les entitées
local function ScanEntities()
	Spawns = {}
	for k, v in next, ents.GetAll() do
		if not v or not IsValid(v) or k < 1 then continue end
		local Class = v:GetClass()
		if SpawnClasses[Class] then
			Spawns[#Spawns+1] =  v
		end
	end
end

// Spawn protection
function GM:PlayerShouldTakeDamage(ply, atk)
	if aowl and ply.Unrestricted then
		return false
	end

	if ply == atk then
		return true
	end

	local rad = BaseWars.Config.SpawnRadius or 256
	if rad > 0 then
		for k, v in next, ents.FindInSphere(ply:GetPos(), rad) do
			local Class = v:GetClass()

			if SpawnClasses[Class] then
				if BaseWars.Ents:ValidPlayer(atk) then
					atk:Notify(BaseWars.LANG.SpawnKill, BASEWARS_NOTIFICATION_ERROR)
				end

				return false
			end
		end

		for k, v in next, ents.FindInSphere(atk:GetPos(), rad) do
			local Class = v:GetClass()

			if SpawnClasses[Class] then
				if BaseWars.Ents:ValidPlayer(atk) then
					atk:Notify(BaseWars.LANG.SpawnCamp, BASEWARS_NOTIFICATION_ERROR)
				end

				return false
			end
		end
	end

	return true
end

// Si le joueur se déco
//function GM:PlayerDisconnected(ply)
//	BaseWars.UTIL.ClearRollbackFile(ply)
//end

local maxs = Vector(4164, -4247, 431)
local mins = Vector(585, -7418, -246)
local _ang = Angle(0, 180, 0)
local _pos = Vector(508, -6305, -135)

// Débloque les portes
function GM:InitPostEntity()
	ScanEntities()
	//MakePortalFunc() // Si le systhème de portal est actif
	for k, v in next, ents.FindByClass("*door*") do
		v:Fire("unlock")
	end
	BaseWars.MySQL.Connect()
end

function GM:PlayerSpawn(ply)
	self.BaseClass.PlayerSpawn(self, ply)
	self:SetPlayerSpeed(ply, BaseWars.Config.DefaultWalk, BaseWars.Config.DefaultRun)
	local Spawn = ply.SpawnPoint
	if BaseWars.Ents:Valid(Spawn) and (not Spawn.IsPowered or Spawn:IsPowered()) then
		local Pos = Spawn:GetPos() + BaseWars.Config.Ents.SpawnPoint.Offset
		ply:SetPos(Pos)
	end
	for k, v in next, BaseWars.Config.SpawnWeps do
		ply:Give(v)
	end
	if ply:HasWeapon("hands") then
		ply:SelectWeapon("hands")
	elseif ply:HasWeapon("none") then
		ply:SelectWeapon("none")
	end
	player_manager.SetPlayerClass(ply, "player_default")
	ply:SetNW2Bool("BW_Defuser", false)
end

ScanEntities()

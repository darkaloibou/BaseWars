include("include.lua")
AddCSLuaFile("include.lua")
include("modules.lua")
AddCSLuaFile("modules.lua")

// Charge le module
BaseWars.ModuleLoader:Load()

// Permet de FastDL les contents
function BaseWars.AddFastDLDir(dir)

	local Dir = (GM or GAMEMODE).Folder .. "/content/" .. dir .. "/*"
	local Files, Folders = file.Find(Dir, "GAME")

	BaseWars.UTIL.Log("Adding recursive FastDL for directory -> ", Dir)

	for k, v in next, Folders do

		BaseWars.AddFastDLDir(dir .. "/" .. v)

	end

	for k, v in next, Files do

		if not v:find(".", 1, true) then continue end
	
		if NoDL then
			resource.AddFile(dir .. "/" .. v)
		else
			resource.AddFile(dir .. "/" .. v)
		end

	end

end
BaseWars.AddFastDLDir("sound")
BaseWars.AddFastDLDir("models")
BaseWars.AddFastDLDir("materials")
BaseWars.AddFastDLDir("resource")

// Je sais pas a quoi cela sert ?
local AuthTbl = {}

function GM:NetworkIDValidated(name, steamid)
	AuthTbl[steamid] = name
end

// Code qui pue - Pemet de vérifier le refund si il a crash
--[[function GM:PlayerInitialSpawn(ply)
	self.BaseClass:PlayerInitialSpawn(ply)
	BaseWars.UTIL.RefundFromCrash(ply)
	local f = function()
		if not AuthTbl[ply:SteamID()] then
			ply:ChatPrint(BaseWars.LANG.FailedToAuth)
			ply.UnAuthed = true
		else
			AuthTbl[ply:SteamID()] = nil
		end
	end
	timer.Simple(0, f)
	for k, v in next, ents.GetAll() do
		local Owner = BaseWars.Ents:ValidOwner(v)
		local Class = v:GetClass()
		if Owner ~= ply or not Class:find("bw_") then continue end
		ply:GetTable()["limit_" .. Class] = (ply:GetTable()["limit_" .. Class] or 0) + 1
	end
	timer.Simple( 0, function() ply:SetTeam(1) end )
end
]]--

// Le mec a vraiment créer un code pour juste une map ??? Je supprime que la partie map
--[[local function MakePortalFunc()

	local Map = game.GetMap()
	if Map == "gm_excess_island" then
		local PortalBox = ents.GetMapCreatedEntity(2086)
		local On 		= false
		function BaseWars.ToggleMapPortal()
			if On then
				On = false
				PortalBox:Fire("InValue", "13")
			else
				On = true
				PortalBox:Fire("InValue", "12")
			end
		end
	else
		function BaseWars.ToggleMapPortal() end
	end
end
]]--
local function MakePortalFunc()
	function BaseWars.ToggleMapPortal() end
end
MakePortalFunc()

// Fait attention quand le serveur se fermer a bien tout supprimer 
function GM:ShutDown()
	BaseWars.UTIL.SafeShutDown()
	self.BaseClass:ShutDown()
end

// Permet de créer les props
function GM:OnEntityCreated(ent)
	local f = function()
		self.BaseClass:OnEntityCreated(ent)
		local Class = BaseWars.Ents:Valid(ent) and ent:GetClass()
		if Class == "prop_physics" and ent:Health() == 0 then
			local HP = (BaseWars.Ents:Valid(ent:GetPhysicsObject()) and ent:GetPhysicsObject():GetMass() or 50) * BaseWars.Config.UniversalPropConstant
			HP = math.Clamp(HP, 0, 400)
			ent:SetHealth(HP)
			ent.MaxHealth = HP
			ent.DestructableProp = true
		end
	end
	timer.Simple(0, f)
end

// Permet de faire une bombe
function GM:SetupPlayerVisibility(ply)
	self.BaseClass:SetupPlayerVisibility(ply)
	for _, v in next, ents.FindByClass("bw_bomb_*") do
		if v.IsExplosive and v:GetNWBool("IsArmed") then
			AddOriginToPVS(v:GetPos())
		end
	end
end

// Fait partie du systhème de refund
--[[function GM:PreCleanupMap()
	BaseWars.UTIL.RefundAll()
end]]--

// Créer un npc pour ???
--[[function GM:PostCleanupMap()
	BaseWars.NPCs:CreateNPCs()
end]]--

// Dégas de chute réaliste
function GM:GetFallDamage(ply, speed)
	local Velocity = speed - 526.5
	return Velocity * 0.225
end

// Permet de faire le systhème de drogues
--[[function GM:SetupMove(ply, move)
	local State = self.BaseClass:SetupMove(ply, move)
	if not ply:Alive() then
		return State
	end
	if BaseWars.Drugs and ply:IsOnGround() then
		ply.DoubleJump_OnGround = true
	end
	return State
end

local Jump = Sound("npc/zombie/claw_miss1.wav")
function GM:KeyPress(ply, code)

	self.BaseClass:KeyPress(ply, code)

	if BaseWars.Drugs and code == IN_JUMP and ply.DoubleJump_OnGround and not ply:IsOnGround() and ply:HasDrug("DoubleJump") and ply:GetMoveType() == MOVETYPE_WALK then

		ply:SetVelocity(ply:GetForward() * 100 + BaseWars.Config.Drugs.DoubleJump.JumpHeight)
		ply.DoubleJump_OnGround = false

		ply:EmitSound(Jump)

	end

	if code == IN_JUMP and (ply.Stuck and ply:Stuck()) and ply:GetMoveType() == MOVETYPE_WALK then

		ply:UnStuck()

	end

end]]--

// Dégas des entitées
function GM:EntityTakeDamage(ent, dmginfo)
	local Player = BaseWars.Ents:ValidPlayer(ent)
	local Owner = BaseWars.Ents:ValidOwner(ent)

	if not Player and not Owner then
		dmginfo:ScaleDamage(0)
		dmginfo:SetDamage(0)
	return false end
	self.BaseClass:EntityTakeDamage(ent, dmginfo)

	local Inflictor = dmginfo:GetInflictor()
	local Attacker 	= dmginfo:GetAttacker()
	local Damage 	= dmginfo:GetDamage()
	local Scale = 1
	// Sous drogues
	--[[if Attacker:IsPlayer() and Attacker:HasDrug("Rage") and Attacker ~= ent and not Inflictor.IsRaidDevice then
		Scale = Scale * BaseWars.Config.Drugs.Rage.Mult
	end]]--
	if Owner then // Propriétée du joueur
		local RaidLogic 	= (Attacker == Owner and Owner:InRaid()) or (Owner:InFaction() and (not Attacker == Owner and Attacker.InFaction and Attacker:InFaction(Owner:GetFaction())))
		local RaidLogic2 	= Attacker ~= Owner and (not Owner:InRaid() or not (Attacker.InRaid and Attacker:InRaid()))
		if not ent.AllwaysRaidable and (RaidLogic or RaidLogic2) then
			dmginfo:ScaleDamage(0)
			dmginfo:SetDamage(0)
		return false end
	end

	if ent.DestructableProp then // Si le props peut etre détruit
		if not BaseWars.Raid:IsOnGoing() then return end
		local ActualDmg = Damage * Scale
		local HP = ent:Health()
		ent:SetHealth(HP - ActualDmg)
		if ent:Health() <= 0 then
			ent:Remove()
		return end
		local M 		= HP / ent.MaxHealth
		local OldCol 	= ent:GetColor()
		local Color 	= Color(255 * M, 255 * M, 255 * M, OldCol.a)
		ent:SetColor(Color)
	return end

	if ent:IsPlayer() then // Si c'est pas son propre pros
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

		--[[if ent:HasDrug("PainKiller") and Attacker:IsPlayer() and Attacker ~= ent then

			Scale = Scale * BaseWars.Config.Drugs.PainKiller.Mult

		end]]--

		// Protège de tout dommage si il a un bouclier ?
		local TakeDamage = Damage * Scale
		if TakeDamage >= ent:Health() and ent:HasDrug("Shield") and not ent.ShieldOn then
			ent.ShieldOn = true
			ent:RemoveDrug("Shield")
			local TID = ent:SteamID64() .. ".ShieldGod"
			local f = function()
				if not IsValid(ent) then return end
				ent.ShieldOn = nil
			end
			timer.Create(TID, 0.5, 1, f)
			if Attacker:IsPlayer() and Attacker ~= ent then
				Attacker:Notify(BaseWars.LANG.ShieldSave, BASEWARS_NOTIFICATION_DRUG)
			end
			dmginfo:SetDamage(math.min(ent:Health() * 0.9, ent:Health() - 1))
			dmginfo:ScaleDamage(1)
			return
		elseif ent.ShieldOn then
			dmginfo:ScaleDamage(0)
		return end
	end
	dmginfo:ScaleDamage(Scale)
end

// Pourquoi ?
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


// Créer les entitées dans le spawn menu
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

--[[function GM:PostPlayerDeath(ply)
	local Weapons = ply:GetWeapons()

	for k, wep in next, Weapons do
		if not BaseWars.Ents:Valid(wep) then return end

		local Model = wep:GetModel()
		local Class = wep:GetClass()

		if BaseWars.Config.WeaponDropBlacklist[Class] then continue end

		local SpawnPos = ply:GetPos() + BaseWars.Config.SpawnOffset
		local SpawnAng = Angle(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))

		local desp = BaseWars.Config.WeaponDespawn or 0
		local Ent = ents.Create("bw_weapon")
			Ent.WeaponClass = Class
			if desp > 0 then
				Ent.DespawnWhen = CurTime() + desp
			end
			Ent.Model = Model
			Ent:SetPos(SpawnPos)
			Ent:SetAngles(SpawnAng)
		Ent:Spawn()
		Ent:Activate()
	end
end]]

// Nétoie quand un joueur déco
function GM:PlayerDisconnected(ply)
	BaseWars.UTIL.ClearRollbackFile(ply)
end

local maxs = Vector(4164, -4247, 431)
local mins = Vector(585, -7418, -246)
local _ang = Angle(0, 180, 0)
local _pos = Vector(508, -6305, -135)

// Ca doit faire des backup mais c'est montrueux
--[[function GM:Think()
	if LastThink < CurTime() - 5 then
		BaseWars.UTIL.WriteCrashRollback()

		for k, v in next, ents.GetAll() do
			if v:IsOnFire() then
				v:Extinguish()
			end
		end

		if BaseWars.Config.SpawnBuilding == 0 then return end

		for k, s in next, Spawns do
			if not s or not IsValid(s) then
				ScanEntities()

				return State
			end

			local Ents = ents.FindInSphere(s:GetPos(), 256)
			if #Ents < 2 then
				continue
			end

			for _, v in next, Ents do
				if v.BeingRemoved or v.NoFizz then
					continue
				end

				local Owner = v:CPPIGetOwner()
				if not Owner or not IsValid(Owner) or not Owner:IsPlayer() or (BaseWars.Config.SpawnBuilding == 1 and Owner:IsAdmin()) then
					continue
				end

				if v:GetClass() == "prop_physics" or v:GetClass() == "gmod_light" or v:GetClass() == "gmod_lamp" or v:GetClass() == "gmod_wheel" then
					v.BeingRemoved = true
					SafeRemoveEntity(v)

					Owner:Notify(BaseWars.LANG.DontBuildSpawn, BASEWARS_NOTIFICATION_ERROR)
				end
			end
		end

		LastThink = CurTime()
	end
end]]--

// Dévérouille les portes ?
function GM:InitPostEntity()
	ScanEntities()
	MakePortalFunc()

	for k, v in next, ents.FindByClass("*door*") do
		v:Fire("unlock")
	end

	BaseWars.MySQL.Connect()
	BaseWars.UTIL.WriteCrashRollback(true)
end

// SpawnPoint
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

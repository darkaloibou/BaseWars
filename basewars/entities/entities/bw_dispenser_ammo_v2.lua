AddCSLuaFile()

ENT.Base 				= "bw_base_electronics"
ENT.Type 				= "anim"

ENT.PrintName 			= "Ammo Dispenser v2"
ENT.Author 				= "Q2F2"

ENT.Model 				= "models/tf2defaultmodels/artillerysentrystuff/woodbox.mdl"
ENT.Sound				= Sound("HL1/fvox/blip.wav")

function ENT:Init()

	self:SetModel(self.Model)
	self:SetHealth(1000)

	self:SetUseType(CONTINUOUS_USE)

	self:SetColor(Color(200, 200 ,200))

end

function ENT:CheckUsable()

	if self.Time and self.Time + BaseWars.Config.DispenserTime > CurTime() then return false end

end

function ENT:UseFunc(ply)

	if not BaseWars.Ents:ValidPlayer(ply) then return end

	self.Time = CurTime()

	local PlyGun = ply:GetActiveWeapon()
	if not BaseWars.Ents:Valid(PlyGun) then return end

	local Ammo = PlyGun:GetPrimaryAmmoType()
	if not Ammo then return end

	ply:GiveAmmo(75, Ammo)
	self:EmitSound(self.Sound, 100, 60)

end

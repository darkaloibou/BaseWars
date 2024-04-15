AddCSLuaFile()

ENT.Base = "bw_base_turret"
ENT.Type = "anim"
ENT.Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level1.mdl"

ENT.PrintName = "Canon Turret T1"
 
ENT.Drain = 150

ENT.PresetMaxHealth = 2000

ENT.Damage = 65
ENT.Radius = 1250
ENT.ShootingDelay = 1.4
ENT.Ammo = -1

ENT.Sounds = Sound("weapons/mortar/mortar_explode1.wav")

if SERVER then
 
ENT.Spread = 2

function ENT:GetBulletInfo(target, pos)

	local bullet = {}
		bullet.Num = 1
		bullet.Damage = self.Damage
		bullet.Force = 15
		bullet.TracerName = "ToolTracer"
		bullet.Spread = Vector(self.Spread, self.Spread, 0)
		bullet.Src = self.EyePosOffset
		bullet.Dir = pos - self.EyePosOffset
		
	return bullet
		
end

end

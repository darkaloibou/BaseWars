AddCSLuaFile()

ENT.Base = "bw_base_turret"
ENT.Type = "anim"
ENT.Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level3_building.mdl"

ENT.PrintName = "Canon Turret T3"

ENT.PowerRequired = -1
ENT.PowerMin = -1
ENT.PowerCapacity = 0
 
ENT.Drain = 150
 
ENT.Damage = 65
ENT.Radius = 1250
ENT.ShootingDelay = 1.4
ENT.Ammo = -1

ENT.IdleAnim = ""
ENT.FireAnim = ""

ENT.TurMuz = "gun_left_muzzle"
ENT.TurBack = "fork_base"

ENT.Sounds = Sound("weapons/mortar/mortar_explode3.wav")

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

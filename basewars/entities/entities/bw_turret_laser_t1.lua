AddCSLuaFile()

ENT.Base = "bw_base_turret"
ENT.Type = "anim"
 
ENT.PrintName = "Laser Turret T1"
ENT.Model = "models/tf2defaultmodels/skirmisherstuff/turret_level1.mdl"
 
ENT.PowerRequired = -1
ENT.PowerMin = -1
ENT.PowerCapacity = 0
 
ENT.Drain = 150

ENT.TurMuz = "barrel"
ENT.TurBack = "turret_swivel"

ENT.Damage = 80
ENT.Radius = 1250
ENT.ShootingDelay = 12
ENT.Ammo = -1

ENT.Sounds = Sound("npc/strider/fire.wav")

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

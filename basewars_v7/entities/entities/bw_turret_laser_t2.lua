AddCSLuaFile()

ENT.Base = "bw_base_turret"
ENT.Type = "anim"
 
ENT.PrintName = "Laser Turret T2"
ENT.Model = "models/tf2defaultmodels/skirmisherstuff/turret_level2.mdl"

ENT.PresetMaxHealth = 2500

ENT.Drain = 150
 
ENT.Damage = 80
ENT.Radius = 1250
ENT.ShootingDelay = 7
ENT.Ammo = -1

ENT.TurMuz = "barrel"
ENT.TurBack = "back"

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

function PrintBones( entity )
    for i = 0, entity:GetBoneCount() - 1 do
        print( i, entity:GetBoneName( i ) )
    end
end
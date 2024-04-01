AddCSLuaFile()
ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
 
ENT.PrintName = "HealthPad V3"
ENT.Model = "models/props_spytech/supplystation.mdl"
 
ENT.PowerRequired = -1
ENT.PowerCapacity = 1
 
ENT.Drain = 50
 
ENT.RegenRate = 8
ENT.Plys = {}

ENT.Sound = Sound("npc/vort/health_charge.wav")
ENT.Radius = 100

ENT.PresetMaxHealth = 5000

if CLIENT then

	function ENT:Think()
	
		if not self:GetNWBool("HealthPad") then return end
		
		local Emitter = ParticleEmitter(self:GetPos())
		if not Emitter then return end
		
		local ParticlePos = self:GetPos() + Vector(math.random(-25, 25), math.random(-25, 25), math.random(0, 80))
		local Particle = Emitter:Add("particle/smokesprites_000" .. tostring(math.random(1,1)), ParticlePos)
	   
		if Particle then
		
			Particle:SetColor(0, 255, 0)
			Particle:SetCollide(1)
			Particle:SetLifeTime(0)
			Particle:SetDieTime(5)
			Particle:SetStartSize(math.random(0.1, 1))
			Particle:SetEndSize(Particle:GetStartSize())
			
		end
	   
		Emitter:Finish()
		
	end

return end

local ForceAngle = Angle(0, 0, 0)
function ENT:Init()

	self:SetAngles(ForceAngle)
	self:SetTrigger(true)
   
	self.Maxs = Vector(self.Radius, self.Radius, 105)
	self.Mins = Vector(-self.Radius, -self.Radius, 0)
   
end

function ENT:SpawnFunction(ply, tr, class)
   
	local pos = ply:GetPos() + Vector(0,0,8)
	   
	local ent = ents.Create(class)
		ent:CPPISetOwner(ply)
		ent:SetPos(pos)
		ply:SetPos(pos + Vector(0,0,3))
	ent:Spawn()
	ent:Activate()
	   
	local phys = ent:GetPhysicsObject()
	
	if IsValid(phys) then
	
		phys:EnableMotion(false)
		
	end
   
	return ent
   
end

function ENT:ThinkFunc()
	
	local Ents = ents.FindInBox(self:GetPos() + self.Mins, self:GetPos() + self.Maxs)
	local Heal = false
   
	for k, ply in next, Ents do
		
		if not BaseWars.Ents:ValidPlayer(ply) then continue end
		if ply:Health() >= ply:GetMaxHealth() then continue end
		
		ply:SetHealth(math.min(ply:Health() + self.RegenRate, ply:GetMaxHealth()))
		
		self:DrainPower(self.Drain)
		self:EmitSound(self.Sound)
		
		Heal = true
		
	end
	
	self:SetNWBool("HealthPad", Heal)
	
end

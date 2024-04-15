AddCSLuaFile()

ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
 
ENT.PrintName = "Tesla Coil"
ENT.Model = "models/teslacoil_mini/teslacoil_mini.mdl"

ENT.Drain = 1500
 
ENT.Damage 	= 60
ENT.Radius 	= 300
ENT.Delay	= 5
 
ENT.Sound = Sound("npc/roller/mine/rmine_explode_shock1.wav")
ENT.Color = Color(100, 100, 255, 255)

ENT.PresetMaxHealth = 2500

ENT.AlwaysRaidable = false
 
if CLIENT then return end

function ENT:Init()

	self:SetModel(self.Model)
	
	self.Time = CurTime()
	
end
 
function ENT:ThinkFunc()
	if IsValid( self:CPPIGetOwner() ) && self:CPPIGetOwner():InRaid() then return end

	if self.Time + self.Delay > CurTime() then return end

	local Owner = BaseWars.Ents:ValidOwner(self)	
	if not Owner then return end
		
	self.Time = CurTime()
	
	local Plys = ents.FindInSphere(self:GetPos(), self.Radius)
	local Pos = self:GetPos()
	
	for k, v in next, Plys do
	
		if not BaseWars.Ents:ValidPlayer(v) or not v:Alive() then continue end
		if not Owner:IsEnemy(v) then continue end
				
		local d = DamageInfo()
			d:SetDamage(self.Damage)
			d:SetDamageType(DMG_SHOCK)
			d:SetAttacker(Owner)

		v:TakeDamageInfo(d)
		v:ScreenFade(SCREENFADE.IN, self.Color, 0.5, 0)
		
		local e = EffectData()
			e:SetStart(Pos)
			e:SetOrigin(Pos)
			e:SetScale(1) 
		
		util.Effect("cball_explode", e)	
		
		self:EmitSound(self.Sound, 100, 70)
	
	end

end

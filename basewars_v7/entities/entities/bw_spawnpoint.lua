ENT.Base = "bw_base_electronics"
ENT.Type = "anim"

ENT.PrintName = "SpawnPoint"
ENT.Model = "models/tf2defaultmodels/prefortress2teleporter/teleporter_light.mdl"

ENT.AutomaticFrameAdvance = true

ENT.AlwaysRaidable = false

ENT.PresetMaxHealth = 2000

if SERVER then
	
	AddCSLuaFile()

	local ForceAngle = Angle(0, 0, 0)
	function ENT:Init()
		self:SetAngles(ForceAngle)
		self:SetBodygroup( 1, 2 )
		self:SetSequence( self:LookupSequence( "running" ) )
		self:SetPlaybackRate( 1 )

		local timid = "anim" .. self:EntIndex()

		timer.Create( timid, self:SequenceDuration( self:LookupSequence( "running" ) ), 0, function()
			if !IsValid( self ) then timer.Remove( timid ) return end
			self:ResetSequence( self:LookupSequence( "running" ) )
		end )
	end
	
	function ENT:SpawnFunction(ply, tr, class)
		
		local pos = ply:GetPos()
		
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
	
	function ENT:CheckUsable()

		if BaseWars.Ents:ValidPlayer(self.OwningPly) then return false end
		
	end

	function ENT:UseFunc(activator, caller, usetype, value)
		
		if not BaseWars.Ents:ValidPlayer(self.OwningPly) then self.OwningPly = nil end
	
		local ply = activator:IsPlayer() and activator or caller:IsPlayer() and caller or nil

		if ply then
		
			self:EmitSound("buttons/blip1.wav")
			
			if BaseWars.Ents:Valid(ply.SpawnPoint) then
				
				ply.SpawnPoint.OwningPly = false
				ply.SpawnPoint:EmitSound("ambient/machines/thumper_shutdown1.wav")
				
			end
			
			self.OwningPly = ply
			ply.SpawnPoint = self
			
			ply:Notify(BaseWars.LANG.NewSpawnPoint, BASEWARS_NOTIFICATION_GENRL)
			
		return end
		
		self:EmitSound("buttons/button10.wav")
		
	end

	function ENT:OnRemove()

		if BaseWars.Ents:ValidOwner(self.OwningPly) then
		
			self.OwningPly.SpawnPoint = nil
			
		end
		
		if timer.Exists( "anim" .. self:EntIndex() ) then
			timer.Remove( "anim" .. self:EntIndex() )
		end
	end

	function ENT:Think()
		self:ThinkFuncBypass()
	
		if  self:BadlyDamaged() and math.random(0, 11) == 0 then
			self:Spark()
		end
	
		if self:WaterLevel() > 0 and not self:GetWaterProof() then
			if not self.FirstTime and self:Health() > 25 then
				self:SetHealth(25)
				self:Spark()
				self.FirstTime = true
			end
	
			if self.rtb == 2 then
				self.rtb = 0
				self:TakeDamage(1)
			else
				self.rtb = self.rtb + 1
			end
		else
			self.FirstTime = false
		end
	
		if self:BadlyDamaged() then
			if self:GetUsable() then self:SetUsable(false) end
			self:NextThink( CurTime() ) return true
		end
	
		local Res = self:CheckUsable()
		local State = Res ~= false
	
		if State ~= self:GetUsable() then
			self:SetUsable(State)
		end
	
		self:ThinkFunc()

		self:NextThink(CurTime())
		return true	
	end
end

AddCSLuaFile()

ENT.Base = "bw_base_electronics"
ENT.Type = "anim"

ENT.PrintName = "Soin"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/buildables/dispenser.mdl"
ENT.HealthGiven = 1
ENT.HealthInterval = 0.25

ENT.Drain = 35
ENT.AlwaysRaidable = true
ENT.HealingEnts = {}

ENT.Editable			= false
ENT.Spawnable			= true
ENT.AdminOnly			= false
ENT.RenderGroup 		= RENDERGROUP_TRANSLUCENT
ENT.AutomaticFrameAdvance = true 

if SERVER then
	util.AddNetworkString( "BeamCreated" )

	function ENT:Init()
		self:SetModel( self.Model )
 		self:SetHealth(150)
		self:EmitSound( "weapons/dispenser_heal.wav" )

		local phys = self:GetPhysicsObject()

		if phys:IsValid() then
			phys:Wake()			
			phys:SetMass( 5 )
		end
	end

	function ENT:OnRemove()
		self:StopSound( "weapons/dispenser_heal.wav" )
	end

	function ENT:ThinkFunc()
		for _, v in ipairs( player.GetAll() ) do
			if v:GetPos():DistToSqr( self:GetPos() ) < 25000 then
				if self.HealingEnts[ v:EntIndex() ] then
					if v:Health() >= v:GetMaxHealth() then
						self.HealingEnts[ v:EntIndex() ] = nil
	
						if v.beams[1] != nil && v.beams[1]:IsValid() && v.beams[2] != nil && v.beams[2]:IsValid() then
							v.beams[1]:Remove()
							v.beams[2]:Remove()
						end
					else
						v.nHealth = v.nHealth || 0
	
						if(v:Health() < 100 && v.nHealth < CurTime()) then
							v:SetHealth( math.min( v:Health() + self.HealthGiven, v:GetMaxHealth() ) )
							v.nHealth = CurTime() + self.HealthInterval
						end
					end
				else
					self.HealingEnts[ v:EntIndex() ] = true
					local a = ents.Create( "sent_mbeam" )
					a:SetPos( v:GetPos() + Vector( 0, 0, 35 ) )
					a:SetParent( v )
					a:Spawn()
	
					local b = ents.Create( "sent_mbeam" )
					b:SetPos( self:GetPos() + Vector( 0, 0, 35 ) )
					b:SetParent( self )
					b:Spawn()
	
					b.B = a
					v.beams = { a, b }

					timer.Simple( 0.1,function()
						net.Start( "BeamCreated" )
						net.WriteTable( { a, b } )
						net.Broadcast()
					end )
				end
			elseif self.HealingEnts[ v:EntIndex() ] then
				self.HealingEnts[ v:EntIndex() ] = nil
	
				if v.beams[1] != nil && v.beams[1]:IsValid() && v.beams[2] != nil && v.beams[2]:IsValid() then
					v.beams[1]:Remove()
					v.beams[2]:Remove()
				end
			end
		end
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end
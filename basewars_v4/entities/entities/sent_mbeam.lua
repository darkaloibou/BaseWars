
AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.PrintName		= "BEAM_CLASS"
ENT.Author			= "Gonzalolog"
ENT.Information		= "Partner"
ENT.Category		= "TF2 Builds"

ENT.OtherEntity = nil


game.AddParticles( "particles/MEDICGUN_BEAM.pcf" )
PrecacheParticleSystem( "medicgun_beam_red" )

function ENT:Initialize()
	if SERVER then
		self.Entity:SetModel( "models/buildables/dispenser_light.mdl" )  
		self.Entity:PhysicsInit( SOLID_VPHYSICS )
		self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
		self.Entity:SetSolid( SOLID_NONE )
		self.Entity:DrawShadow( false )
	else
		local beam = self
		timer.Simple( 0.15, function() if IsValid( beam ) && !beam:IsWorld() then beam:StartBeam() end end )
	end
end

function ENT:Draw()
end

function ENT:StartBeam()
	if self.B != nil && self.B:IsValid() then
		local CPoint0 = {
			["entity"] = self.B,
			["attachtype"] = PATTACH_ABSORIGIN_FOLLOW,
		}

    	local CPoint1 = {
			["entity"] = self,
			["attachtype"] = PATTACH_ABSORIGIN_FOLLOW,
		}

   		self:CreateParticleEffect( "medicgun_beam_red",{ CPoint0, CPoint1 } )
   end
end

net.Receive( "BeamCreated", function()
	local tbl = net.ReadTable()
	tbl[ 2 ].B = tbl[ 1 ]
end )
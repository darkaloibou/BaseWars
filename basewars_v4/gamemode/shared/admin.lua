bwa = {}

---------------------------------------------------------------
-- UTIL Funcs -------------------------------------------------
---------------------------------------------------------------

function bwa.Log(...)

end

function bwa.Msg(ply, ...)

end

function bwa.Error(ply, msg)
	if msg then
		ply:SendLua(string.format(
			"local s = '%s' notification.AddLegacy(s, NOTIFY_ERROR, 5) MsgN(s)",
			"bwa: " .. msg
		))
	end

	ply:EmitSound("buttons/button8.wav")
end

---------------------------------------------------------------
-- Commands ---------------------------------------------------
---------------------------------------------------------------
properties.Add("bwa_copymodel", {
	MenuLabel = "Copy Model",
	MenuIcon = "icon16/page_copy.png",
	Order =	-100,

	Filter = function(self, ent, ply)
		if not IsValid(ent) then return false end

		return true
	end,

	Action = function(self, ent)
		local Model = ent:GetModel()
		SetClipboardText(Model)
	end,
})

properties.Add("bwa_copymaterial", {
	MenuLabel = "Copy Material",
	MenuIcon = "icon16/page_copy.png",
	Order =	-99,

	Filter = function(self, ent, ply)
		if not IsValid(ent) or not (ent:GetMaterial() and #ent:GetMaterial() > 0)then return false end

		return true
	end,

	Action = function(self, ent)
		local Mat = ent:GetMaterial()
		SetClipboardText(Mat)
	end,
})
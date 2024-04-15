MODULE.Name     = "Money"
MODULE.Author   = "Q2F2, Ghosty et Tenrys"

local tag = "BaseWars.CFC"
local PLAYER = debug.getregistry().Player

local function isPlayer(ply)
    return IsValid(ply) and ply:IsPlayer()
end

function MODULE:GetCFC(ply)
    return tonumber(ply:GetNWString(tag)) or 0
end
PLAYER.GetCFC = Curry(MODULE.GetCFC)

if SERVER then
    function MODULE:InitCFC(ply)
        BaseWars.MySQL.InitPlayer(ply, "cfc", tostring(BaseWars.Config.StartCFC))
    end
    PLAYER.InitCFC = Curry(MODULE.InitCFC)

    for k, v in next, player.GetAll() do
        MODULE:InitCFC(v)
    end

    function MODULE:SaveCFC(ply, amount)
        BaseWars.MySQL.SaveVar(ply, "cfc", amount or self:GetCFC(ply))
    end
    PLAYER.SaveCFC = Curry(MODULE.SaveCFC)

    function MODULE:LoadCFC(ply)
        self:InitCFC(ply)

        BaseWars.MySQL.LoadVar(ply, "cfc", function(ply, var, val)
            if not IsValid(ply) then return end
            ply:SetNWString(tag, tostring(val))
        end)
    end
    PLAYER.LoadCFC = Curry(MODULE.LoadCFC)

    function MODULE:SetCFC(ply, amount)
        local amount = tonumber(amount)

        if not isnumber(amount) or amount < 0 then
            amount = 0
        end
        if amount ~= amount then
            amount = 0
        end

        amount = math.Round(amount)
        self:SaveCFC(ply, amount)

        ply:SetNWString(tag, tostring(amount))
    end
    PLAYER.SetCFC = Curry(MODULE.SetCFC)

    function MODULE:GiveCFC(ply, amount)
        self:SetCFC(ply, self:GetCFC(ply) + amount)
    end
    PLAYER.GiveCFC = Curry(MODULE.GiveCFC)

    function MODULE:TakeCFC(ply, amount)
        self:SetCFC(ply, self:GetCFC(ply) - amount)
    end
    PLAYER.TakeCFC = Curry(MODULE.TakeCFC)

    function MODULE:TransferCFC(ply1, amount, ply2)
        self:TakeCFC(ply1, amount)
        self:GiveCFC(ply2, amount)
    end
    PLAYER.TransferCFC = Curry(MODULE.TransferCFC)

    hook.Add("LoadData", tag .. ".Load", Curry(MODULE.LoadCFC))
    hook.Add("PlayerDisconnected", tag .. ".Save", Curry(MODULE.SaveCFC))
end

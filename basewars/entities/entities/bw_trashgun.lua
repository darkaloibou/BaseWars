ENT.Base = "bw_base_electronics"
ENT.Type = "anim"

ENT.PrintName = "Trash Gun"
ENT.Model = "models/props_junk/trashbin01a.mdl"

ENT.AlwaysRaidable = false

-- Si le code est exécuté du côté serveur
if SERVER then
    -- Inclure le fichier Lua côté client
    AddCSLuaFile()

    -- Variable pour suivre si l'action a déjà été déclenchée pour chaque joueur
    local actionTriggered = {}

    -- Fonction qui gère l'action lorsque la touche est pressée sur l'entité
    function ENT:Use(activator)
        -- Vérifie si l'activateur est valide et est un joueur
        if IsValid(activator) and activator:IsPlayer() then
            -- Vérifie si l'action n'a pas encore été déclenchée pour ce joueur
            if not actionTriggered[activator:UserID()] then
                -- Strip l'arme du joueur
                activator:StripWeapons()
                -- Enlève l'outil du joueur
                activator:StripWeapon("gmod_tool")
                -- Notifie le joueur
                activator:ChatPrint("Vous avez été dépouillé !")
                -- Ajoute les armes spécifiées
                activator:Give("weapon_physgun")
                activator:Give("weapon_physcannon")
                activator:Give("gmod_tool")
                activator:Give("hands")
                -- Sélectionne l'arme de base (les mains)
                activator:SelectWeapon("hands")

                -- Marque l'action comme déclenchée pour ce joueur
                actionTriggered[activator:UserID()] = true
                -- Démarre un timer pour réinitialiser l'action déclenchée après 5 secondes
                timer.Simple(5, function()
                    actionTriggered[activator:UserID()] = false
                end)
                -- Réinitialise la propriété "Armed" du joueur à faux
                activator:SetNW2Bool("Armed", false)
            end
        end
    end
end

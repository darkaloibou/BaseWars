
sam.command.set_category("basewars") -- any new command will be in that category unless the command uses :SetCategory function
 
-- Commande pour ajouter de l'argent à un joueur
sam.command.new("addmoney")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Ajoute de l'argent à un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("text", {
        optional = true,
        default = 50,
        hint = "nom",
        check = function(input, ply)
            if not is_good_input(input) then
                return false
            end
        end
    })
    :AddArg("number", {
        optional = true,
        default = 50,
        hint = "montant",
        min = 0,
        max = 10^12,
        round = true
    })
    :AddArg("length")
    :OnExecute(function(calling_ply, targets, name, amount, length)
        for i = 1, #targets do
            local target = targets[i]
            target:GiveMoney(amount)
        end
        sam.player.send_message(nil, "L'administrateur {A} a ciblé {T} avec un montant de {V}, nom {V_2} et durée {V_3}", {
            A = calling_ply, T = targets, V = amount, V_2 = name, V_3 = length
        })
    end)
:End()

-- Commande pour retirer de l'argent à un joueur
sam.command.new("takemoney")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Retire de l'argent à un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 50,
        hint = "montant",
        min = 0,
        max = 10^12,
        round = true
    })
    :OnExecute(function(calling_ply, targets, amount)
        for i = 1, #targets do
            local target = targets[i]
            target:TakeMoney(amount)
        end
        sam.player.send_message(nil, "L'administrateur {A} a retiré {V} à {T}.", {
            A = calling_ply, T = targets, V = amount
        })
    end)
:End()

-- Commande pour définir l'argent d'un joueur
sam.command.new("setmoney")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Définit l'argent d'un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 50,
        hint = "montant",
        min = 0,
        max = 10^12,
        round = true
    })
    :OnExecute(function(calling_ply, targets, amount)
        for i = 1, #targets do
            local target = targets[i]
            target:SetMoney(amount)
        end
        sam.player.send_message(nil, "L'administrateur {A} a défini l'argent de {T} à {V}.", {
            A = calling_ply, T = targets, V = amount
        })
    end)
:End()

-- Commande pour ajouter un niveau à un joueur
sam.command.new("addlevel")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Ajoute un niveau à un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 1,
        hint = "niveau",
        min = 0,
        max = BaseWars.Config.LevelSettings.MaxLevel,
        round = true
    })
    :OnExecute(function(calling_ply, targets, level)
        for i = 1, #targets do
            local target = targets[i]
            target:AddLevel(level)
        end
        sam.player.send_message(nil, "L'administrateur {A} a ajouté {V} niveaux à {T}.", {
            A = calling_ply, T = targets, V = level
        })
    end)
:End()

-- Commande pour définir le niveau d'un joueur
sam.command.new("setlevel")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Définit le niveau d'un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 1,
        hint = "niveau",
        min = 0,
        max = BaseWars.Config.LevelSettings.MaxLevel,
        round = true
    })
    :OnExecute(function(calling_ply, targets, level)
        for i = 1, #targets do
            local target = targets[i]
            target:SetLevel(level)
        end
        sam.player.send_message(nil, "L'administrateur {A} a défini le niveau de {T} à {V}.", {
            A = calling_ply, T = targets, V = level
        })
    end)
:End()

-- Commande pour ajouter de l'XP à un joueur
sam.command.new("addxp")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Ajoute de l'XP à un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 100,
        hint = "XP",
        min = 0,
        max = 1250250,
        round = true
    })
    :OnExecute(function(calling_ply, targets, xp)
        for i = 1, #targets do
            local target = targets[i]
            target:AddXP(xp)
        end
        sam.player.send_message(nil, "L'administrateur {A} a ajouté {V} XP à {T}.", {
            A = calling_ply, T = targets, V = xp
        })
    end)
:End()

-- Commande pour définir l'XP d'un joueur
sam.command.new("setxp")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Définit l'XP d'un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 0,
        hint = "XP",
        min = 0,
        max = 1250250,
        round = true
    })
    :OnExecute(function(calling_ply, targets, xp)
        for i = 1, #targets do
            local target = targets[i]
            target:SetXP(xp)
        end
        sam.player.send_message(nil, "L'administrateur {A} a défini l'XP de {T} à {V}.", {
            A = calling_ply, T = targets, V = xp
        })
    end)
:End()

-- Commande pour ajouter du karma à un joueur
sam.command.new("addkarma")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Ajoute du karma à un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 10,
        hint = "karma",
        min = -100,
        max = 100,
        round = true
    })
    :OnExecute(function(calling_ply, targets, karma)
        for i = 1, #targets do
            local target = targets[i]
            target:AddKarma(karma)
        end
        sam.player.send_message(nil, "L'administrateur {A} a ajouté {V} de karma à {T}.", {
            A = calling_ply, T = targets, V = karma
        })
    end)
:End()

-- Commande pour définir le karma d'un joueur
sam.command.new("setkarma")
    :SetPermission("hp", "admin")
    :DisallowConsole()
    :SetCategory("Admin")
    :Help("Définit le karma d'un joueur.")
    :GetRestArgs(true)
    :MenuHide(true)
    :DisableNotify(true)
    :AddArg("player", {
        optional = false,
        single_target = true,
        cant_target_self = true,
        allow_higher_target = true
    })
    :AddArg("number", {
        optional = true,
        default = 0,
        hint = "karma",
        min = -100,
        max = 100,
        round = true
    })
    :OnExecute(function(calling_ply, targets, karma)
        for i = 1, #targets do
            local target = targets[i]
            target:SetKarma(karma)
        end
        sam.player.send_message(nil, "L'administrateur {A} a défini le karma de {T} à {V}.", {
            A = calling_ply, T = targets, V = karma
        })
    end)
:End()

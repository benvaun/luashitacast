local profile = {}

local fastCastValue = 0.05 -- 0% from gear

local ta_rogue_armlets = true

local sets = {
    Idle = {
		Range = 'Staurobow',
		Head = 'Homam Zucchetto',
        Neck = 'Nanaa\'s Charm',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Brutal Earring',
		Body = 'Rapparee Harness',
        Hands = 'Assassin\'s Armlets',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Sprinter\'s Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Trotter Boots',
	},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {
		Feet = 'Trotter Boots',
	},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {
		Head = 'Optical Hat',
		Neck = 'Evasion Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Musical Earring',
		Body = 'Scorpion Harness +1',
		Hands = 'War Gloves +1',
		Back = 'Boxer\'s Mantle',
		Waist = 'Scouter\'s Rope',
		Legs = 'Raven Hose',
		Feet = 'Dance Shoes +1',
	},

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
		Head = 'Homam Zucchetto',
		Body = 'Rapparee Harness',
		Hands = 'Homam Manopolas', -- Dusk Gloves +1
		Waist = 'Sprinter\'s Belt', -- Sonic Belt
		Legs = 'Homam Cosciales',
		Feet = 'Homam Gambieras',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Homam Zucchetto',
		Neck = 'Love Torque',
		Ear1 = 'Stealth Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Rapparee Harness',
		Hands = 'Homam Manopolas', -- Dusk Gloves +1
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Sprinter\'s Belt', -- Sonic Belt
		Legs = 'Homam Cosciales',
		Feet = 'Homam Gambieras',
	},
    TP_HighAcc = {
		Head = 'Homam Zucchetto',
		Neck = 'Love Torque',
		Ear1 = 'Stealth Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Homam Corazza',
		Hands = 'Homam Manopolas', -- Dusk Gloves +1
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Sprinter\'s Belt', -- Sonic Belt
		Legs = 'Homam Cosciales',
		Feet = 'Homam Gambieras',
	},
    TP_NIN = {
		Ear1 = 'Stealth Earring',
	},
    TP_OCLUB = {
		Ear2 = 'Hollow Earring',
    },
    TP_Mjollnir_Haste = {},

    WS = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Love Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Brutal Earring',
		Body = 'Hecatomb Harness', -- Hecatomb Harness +1
		Hands = 'Hecatomb Mittens', -- Hecatomb Mittens +1
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers',
		Feet = 'Hct. Leggings', -- Hct. Leggings +1
	},
    WS_HighAcc = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Love Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness', -- Hecatomb Harness +1
		Hands = 'Hecatomb Mittens', -- Hecatomb Mittens +1
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers',
		Feet = 'Hct. Leggings', -- Hct. Leggings +1
	},
    WS_Evisceration = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Love Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness', -- Hecatomb Harness +1
		Hands = 'Hecatomb Mittens', -- Hecatomb Mittens +1
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers',
		Feet = 'Hct. Leggings', -- Hct. Leggings +1
	},
    WS_SharkBite = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Love Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness', -- Hecatomb Harness +1
		Hands = 'Hecatomb Mittens', -- Hecatomb Mittens +1
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers',
		Feet = 'Hct. Leggings', -- Hct. Leggings +1
	},
    WS_MercyStroke = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Soil Gorget',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness', -- Hecatomb Harness +1
		Hands = 'Hecatomb Mittens', -- Hecatomb Mittens +1
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers',
		Feet = 'Hct. Leggings', -- Hct. Leggings +1
	},

    SA = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Love Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Pixie Earring',
		Body = 'Dragon Harness', -- Dragon Harness +1
		Hands = 'Homam Manopolas',
		Ring1 = 'Thunder Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers', -- Dusk Trousers +1
		Feet = 'Homam Gambieras',
	},
    TA = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Love Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Merman\'s Earring',
		Body = 'Dragon Harness', -- Dragon Harness +1
		Hands = 'Homam Manopolas',
		Ring1 = 'Thunder Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers', -- Dusk Trousers +1
		Feet = 'Homam Gambieras',
	},
    SATA = {
		Head = 'Voyager Sallet', -- Hecatomb Cap +1
		Neck = 'Love Torque',
		Ear1 = 'Suppanomimi',
		Ear2 = 'Pixie Earring',
		Body = 'Dragon Harness', -- Dragon Harness +1
		Hands = 'Homam Manopolas',
		Ring1 = 'Thunder Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers', -- Dusk Trousers +1
		Feet = 'Homam Gambieras',
	},

    Flee = {
		Feet = 'Rogue\'s Poulaines',
	},
    Hide = {
		Body = 'Rogue\'s Vest'
	},
    Steal = {
        Head = 'Rogue\'s Bonnet',
		Neck = 'Rabbit Charm',
        Hands = 'Thief\'s Kote',
		Ring1 = 'Rogue\'s Ring',
        Legs = 'Assassin\'s Culottes',
        Feet = 'Rogue\'s Poulaines',
	},
    Mug = {
        Head = 'Assassin\'s Bonnet',
	},

    TH = {
        Neck = 'Nanaa\'s Charm',
        Hands = 'Assassin\'s Armlets',
	},

    Ranged = {
		Head = 'Optical Hat',
        Neck = 'Nanaa\'s Charm',
		Body = 'Dragon Harness', -- Dragon Harness +1
        Hands = 'Assassin\'s Armlets',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dusk Trousers', -- Dusk Trousers +1
		Feet = 'Homam Gambieras',},
    Ranged_INT = {
		Head = 'Rogue\'s Bonnet',
        Neck = 'Nanaa\'s Charm',
		Body = 'Magna Jerkin',
        Hands = 'Assassin\'s Armlets',
		Ring1 = 'Snow Ring',
		Ring2 = 'Snow Ring',
		Waist = 'Forest Rope',
		Legs = 'Dusk Trousers', -- Dusk Trousers +1
		Feet = 'Mgn. M Ledelsens',
	},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local saOverride = 0
local taOverride = 0
local taggedMobs = {}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')
actionpacket = gFunc.LoadFile('common\\actionpacket.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Hide') then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == 'Steal') then
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    elseif (action.Name == 'Sneak Attack') then
        saOverride = os.clock() + 2
    elseif (action.Name == 'Trick Attack') then
        taOverride = os.clock() + 2
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)

    local ammo = gData.GetEquipment().Ammo
    if (ammo ~= nil and ammo.Name == 'Bloody Bolt') then
        gFunc.EquipSet(sets.Ranged_INT)
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
    end

    local ta = gData.GetBuffCount('Trick Attack')
    if (ta > 0) or (os.clock() < taOverride) then
        if (ta_rogue_armlets) then
            gFunc.Equip('Hands', 'Rogue\'s Armlets +1')
        end
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'th', 'oclub'})
    gcdisplay.CreateCycle('TH', {[1] = 'auto', [2] = 'on', [3] = 'off'})
    gcdisplay.CreateToggle('OClub', false)
    gcmelee.Load()
    profile.SetMacroBook()
    profile.WatchTreasureHunter()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'th', 'oclub'})
    ashita.events.unregister('packet_in', 'watch_treasure_hunter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceCycle('TH')
        gcinclude.Message('TH', gcdisplay.GetCycle('TH'))
    elseif (args[1] == 'oclub') then
        gcdisplay.AdvanceToggle('OClub')
        gcinclude.Message('OClub', gcdisplay.GetToggle('OClub'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        gFunc.EquipSet('TP_NIN')
    end
    if (gcdisplay.GetToggle('OClub')) then
        gFunc.EquipSet('TP_OCLUB')
    end

    gcmelee.DoDefaultOverride()

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    if (player.Status == 'Engaged' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill ~= 'Ninjutsu' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.NeedTH = function()
    if (gcdisplay.GetCycle('TH') == 'auto') then
        local targetId
        local actionTarget = gData.GetActionTarget()

        if (actionTarget ~= nil) then
            targetId = actionTarget.Id
        else
            local targetIndex = gData.GetTargetIndex()
            if (targetIndex == 0) then
                return false
            end

            targetId = AshitaCore:GetMemoryManager():GetEntity():GetServerId(targetIndex)
        end

        if bit.band(targetId, 0xFF000000) ~= 0 then  --isMob
            return taggedMobs[targetId] == nil
        end

        return false
    end

    return gcdisplay.GetCycle('TH') == 'on'
end

profile.WatchTreasureHunter = function()
    ashita.events.register('packet_in', 'watch_treasure_hunter', function(e)
        local playerEntity = GetPlayerEntity();
        if (not playerEntity) then
            return
        end

        if (e.id == 0x28) then
            local type = T { 1, 2, 4, 6 };
            local packet = actionpacket:parse(e);
            if (packet.UserId == playerEntity.ServerId) then
                if (type:contains(packet.Type)) then
                    local reaction = T { 0, 8, 
                        9, -- melee/range attack missed, comment out for pedantic TH mode
                    }
                    for _, target in ipairs(packet.Targets) do
                        for i = 1, #target.Actions do
                            local action = target.Actions[1]
                            if bit.band(target.Id, 0xFF000000) ~= 0 then -- isMob, also triggers on NPC but it's benign
                                if reaction:contains(action.Reaction) and target.Id then
                                    taggedMobs[target.Id] = true;
                                end
                            end
                        end
                    end
                end
            end
        elseif (e.id == 0x29) then
            local deathMes = T { 6, 20, 97, 113, 406, 605, 646 };
            -- Mob died, clear from table
            local message = struct.unpack('i2', e.data, 0x18 + 1);
            if (deathMes:contains(message)) then
                local target = struct.unpack('i4', e.data, 0x08 + 1);
                taggedMobs[target] = nil;
            end
        elseif (e.id == 0x0A or e.id == 0x0B) then
            -- Changed zone, clear all TH
            taggedMobs = {};
        end
    end)
end

return profile

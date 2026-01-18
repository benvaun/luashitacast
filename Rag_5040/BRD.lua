local profile = {}

local fastCastValue = 0.02 -- Only include Fast Cast e.g. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.48 -- Only include Song Spellcasting Time e.g. Minstrel's Ring, Sha'ir Manteel

local ninSJMaxMP = 160 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 279 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = 259 -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = 298 -- The Max MP you have when /blm in your idle set

local minstrels_earring = false
local minstrels_earring_slot = 'Ear2'

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Range = 'Gjallarhorn',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 100 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Hexerei Cape',
        Waist = { Name = 'Forest Rope', Priority = 100 },
        Legs = { Name = 'Brd. Cannions +1', Priority = 100 },
        Feet = { Name = 'Wood M Ledelsens', Priority = 100 },
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Range = 'Gjallarhorn',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dalmatica',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Hexerei Cape',
        Waist = 'Forest Rope',
        Legs = 'Brd. Cannions +1',
        Feet = 'Wood M Ledelsens',
    },
    IdleMaxMP = {},
    Resting = {
        Main = 'Pluto\'s Staff',
        Ear1 = 'Relaxing Earring',
        Body = 'Errant Hpl.',
    },
    Town = {
        Main = 'Mandau',
		Sub = 'Ageist',
	},
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {
        Main = 'Neptune\'s Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Enfeebling Torque',
        Body = 'Dst. Harness +1',
        Ear1 = 'Ruby Earring',
        Ear2 = 'Ruby Earring',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Malflame Ring',
        Feet = 'Suzaku\'s Sune-ate',
    },
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast_Songs_HPDown = { -- This set will equip even before precast for songs in case you require HP Down equipment to trigger Minstrel's Ring
    },
    Precast = {
       Ear2 = 'Loquac. Earring',
    },
    Precast_Songs = {
        Main = 'Mandau',
		Sub = 'Genbu\'s Shield',
        Head = 'Genbu\'s Kabuto',
        Neck = 'Bloodbead Amulet',
        Ear1 = 'Cassie Earring',
        Ear2 = { Name = 'Loquac. Earring', Priority = 100 },
        Body = 'Sheikh Manteel',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = { Name = 'Forest Rope', Priority = 100 },
        Legs = { Name = 'Brd. Cannions +1', Priority = 100 },
        Feet = 'Root Sabots',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Body = 'Sheikh Manteel',
        Hands = 'Dusk Gloves',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
    },
    ConserveMP = {
    },

    Sing_Default = {
        Head = 'Brd. Roundlet +1',
        Neck = 'Wind Torque',
        Ear1 = 'Singing Earring',
        Ear2 = 'Musical Earring',
        Hands = 'Chl. Cuffs +1',
        Legs = 'Chl. Cannions +1',
        Back = 'Astute Cape',
    },
    Sing_Buff = {
        Main = 'Chanter\'s Staff',
        Body = 'Minstrel\'s Coat',
    },
    Sing_Debuff = {
        Body = 'Errant Hpl.',
        Ring1 = 'Heavens Ring',
        Ring2 = 'Heavens Ring',
        Waist = 'Gleeman\'s Belt',
        Feet = 'Sheikh Crackows',
    },
	
    Sing_Ballad_Large = {
        Range = 'Nursemaid\'s Harp',
        Ear2 = { Name = 'Loquac. Earring', Priority = 100 },
        Body = 'Sheikh Manteel',
		Hands = 'Sheikh Gages',
        Waist = { Name = 'Forest Rope', Priority = 100 },
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Rostrum Pumps', Priority = 100 },
    },
    Sing_Ballad_Small = {
        Range = 'Gjallarhorn',
        Ear2 = { Name = 'Loquac. Earring', Priority = 100 },
        Body = 'Sheikh Manteel',
		Hands = 'Sheikh Gages',
        Waist = { Name = 'Forest Rope', Priority = 100 },
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Rostrum Pumps', Priority = 100 },
    },
    Sing_Paeon = {
        Range = 'Gjallarhorn',
    },
    Sing_Mazurka = {
        Range = 'Gjallarhorn',
        Ear2 = { Name = 'Loquac. Earring', Priority = 100 },
        Body = 'Sheikh Manteel',
		Hands = 'Sheikh Gages',
        Waist = { Name = 'Forest Rope', Priority = 100 },
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Rostrum Pumps', Priority = 100 },
    },
    Sing_Minuet = {
        Range = 'Gjallarhorn',
    },
    Sing_March = {
        Range = 'Gjallarhorn',
    },
    Sing_Madrigal = {
        Range = 'Gjallarhorn',
    },
    Sing_Elegy = {
        Range = 'Gjallarhorn',
        Main = 'Terra\'s Staff',
    },
    Sing_Lullaby = {
        Range = 'Gjallarhorn',
        Main = 'Apollo\'s Staff',
    },
    Sing_HordeLullaby_Large = {
        Range = 'Nursemaid\'s Harp',
        Main = 'Apollo\'s Staff',
        Neck = 'String Torque',
    },
    Sing_HordeLullaby_Small = {
        Range = 'Gjallarhorn',
        Main = 'Apollo\'s Staff',
    },
    Sing_SleepRecast = {
		Hands = 'Sheikh Gages',
    },
	Sing_Finale = {
		Range = 'Shofar +1',
        Main = 'Apollo\'s Staff',
	},
    Sing_Requiem = {
        Range = 'Gjallarhorn',
        Main = 'Apollo\'s Staff',
    },
    Sing_Carol = {
        Range = 'Gjallarhorn',
    },
    Sing_Mambo = {
        Range = 'Gjallarhorn',
    },
    Sing_Prelude = {
        Range = 'Gjallarhorn',
    },
    Sing_Threnody = {
        Range = 'Gjallarhorn',
    },
    Sing_Hymnus = {
        Range = 'Gjallarhorn',
    },

    Cure = {
        Main = 'Apollo\'s Staff',
    },
    Cursna = {},

    Enhancing = {
    },
    Stoneskin = {
        Main = 'Chanter\'s Staff',
        Neck = 'Stone Gorget',
        Body = 'Errant Hpl.',
        Feet = 'Suzaku\'s Sune-ate',
    },
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Divine = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {
		Range = 'Angel Lyre',
        Head = 'Optical Hat',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Sheikh Manteel',
        Hands = 'Dusk Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
	},
    TP_HighAcc = {
		Range = 'Angel Lyre',
        Head = 'Optical Hat',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Scorpion Harness +1',
        Hands = 'Dusk Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
	},
    TP_NIN = {
		Range = 'Angel Lyre',
        Head = 'Optical Hat',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Sheikh Manteel',
        Hands = 'Dusk Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
	},
    TP_Mjollnir_Haste = {},
    WS = {
        Range = 'Oliphant',
        Head = 'Hecatomb Cap +1',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Brd. Jstcorps +1',
        Hands = 'Hct. Mittens +1',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Flame Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Chl. Cannions +1',
        Feet = 'Hct. Leggings',
	},
    WS_HighAcc = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    if (displayheadOnAbility) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead')
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    gcdisplay.CreateToggle('SmallBallad', true)
    gcdisplay.CreateToggle('SmallHorde', false)
    gcdisplay.CreateToggle('SleepRecast', true)
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'sballad','shorde','srecast'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'sballad') then
        gcdisplay.AdvanceToggle('SmallBallad')
        gcinclude.Message('SmallBallad', gcdisplay.GetToggle('SmallBallad'))
    elseif (args[1] == 'shorde') then
        gcdisplay.AdvanceToggle('SmallHorde')
        gcinclude.Message('SmallHorde', gcdisplay.GetToggle('SmallHorde'))
    elseif (args[1] == 'srecast') then
        gcdisplay.AdvanceToggle('SleepRecast')
        gcinclude.Message('SleepRecast', gcdisplay.GetToggle('SleepRecast'))
    else
        gcmage.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.ForceEquipSet('Precast_Songs_HPDown')
        gFunc.EquipSet(sets.Precast_Songs)
        local totalFastCast = 1 - (1 - fastCastValueSong) * (1 - fastCastValue)
        gcmage.DoPrecast(totalFastCast)
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Sing_Default)

        if string.match(action.Name, 'Threnody') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Threnody)
        elseif string.match(action.Name, 'Elegy') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Elegy)
        elseif string.match(action.Name, 'Foe Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Lullaby)
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif string.match(action.Name, 'Horde Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_HordeLullaby_Large)
            if (gcdisplay.GetToggle('SmallHorde')) then
                gFunc.EquipSet(sets.Sing_HordeLullaby_Small)
            end
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif (action.Name == 'Magic Finale') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Finale)
		elseif string.match(action.Name, 'Requiem') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Requiem)
        elseif string.match(action.Name, 'Carol') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Carol)
        elseif string.match(action.Name, 'Ballad') then
            gFunc.EquipSet(sets.Sing_Buff)
            if (gcdisplay.GetToggle('SmallBallad')) then
                gFunc.EquipSet(sets.Sing_Ballad_Small)
			else
				gFunc.EquipSet(sets.Sing_Ballad_Large)
            end
        elseif string.match(action.Name, 'Minuet') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Minuet)
        elseif string.match(action.Name, 'March') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_March)
        elseif string.match(action.Name, 'Madrigal') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Madrigal)
        elseif string.match(action.Name, 'Mambo') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mambo)
        elseif string.match(action.Name, 'Prelude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Prelude)
        elseif string.match(action.Name, 'Hymnus') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Hymnus)
        elseif (action.Name == 'Chocobo Mazurka') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mazurka)
        elseif string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Paeon)
        end
    end
end

return profile

if not BuilderLoader then
    BuilderLoader = {}
    
    BuilderLoader.link_to_pd2builder = "https://pd2builder.netlify.app/?"

    --PD2Builder compresses skills by using base65. This table is used to convert it to base10
    local char_string = {
        ["0"] = 0,  ["1"] = 1,  ["2"] = 2,  ["3"] = 3,  ["4"] = 4,  ["5"] = 5,  ["6"] = 6,  ["7"] = 7,  ["8"] = 8,  ["9"] = 9,
        ["a"] = 10, ["b"] = 11, ["c"] = 12, ["d"] = 13, ["e"] = 14, ["f"] = 15, ["g"] = 16, ["h"] = 17, ["i"] = 18, ["j"] = 19,
        ["k"] = 20, ["l"] = 21, ["m"] = 22, ["n"] = 23, ["o"] = 24, ["p"] = 25, ["q"] = 26, ["r"] = 27, ["s"] = 28, ["t"] = 29,
        ["u"] = 30, ["v"] = 31, ["w"] = 32, ["x"] = 33, ["y"] = 34, ["z"] = 35, ["A"] = 36, ["B"] = 37, ["C"] = 38, ["D"] = 39,
        ["E"] = 40, ["F"] = 41, ["G"] = 42, ["H"] = 43, ["I"] = 44, ["J"] = 45, ["K"] = 46, ["L"] = 47, ["M"] = 48, ["N"] = 49,
        ["O"] = 50, ["P"] = 51, ["Q"] = 52, ["R"] = 53, ["S"] = 54, ["T"] = 55, ["U"] = 56, ["V"] = 57, ["W"] = 58, ["X"] = 59,
        ["Y"] = 60, ["Z"] = 61, ["."] = 62, [","] = 63, ["@"] = 64,
        [0]  = "0", [1]  = "1", [2]  = "2", [3]  = "3", [4]  = "4", [5]  = "5", [6]  = "6", [7]  = "7", [8]  = "8", [9]  = "9",
        [10] = "a", [11] = "b", [12] = "c", [13] = "d", [14] = "e", [15] = "f", [16] = "g", [17] = "h", [18] = "i", [19] = "j",
        [20] = "k", [21] = "l", [22] = "m", [23] = "n", [24] = "o", [25] = "p", [26] = "q", [27] = "r", [28] = "s", [29] = "t",
        [30] = "u", [31] = "v", [32] = "w", [33] = "x", [34] = "y", [35] = "z", [36] = "A", [37] = "B", [38] = "C", [39] = "D",
        [40] = "E", [41] = "F", [42] = "G", [43] = "H", [44] = "I", [45] = "J", [46] = "K", [47] = "L", [48] = "M", [49] = "N",
        [50] = "O", [51] = "P", [52] = "Q", [53] = "R", [54] = "S", [55] = "T", [56] = "U", [57] = "V", [58] = "W", [59] = "X",
        [60] = "Y", [61] = "Z", [62] = ".", [63] = ",", [64] = "@"
    } 

    --Converts base10 to base65 and vice versa
    function BuilderLoader:get_byte(byte)
        return char_string[byte]
    end

    BuilderLoader.pages = {"mastermind", "enforcer", "technician", "ghost", "hoxton_pack"}

    --[0] - skill not purchased
    --[1] - basic 
    --[2] - aced
    BuilderLoader.colors = {Color(0.2, 0.2, 0.2), Color.white, Color(46 / 255, 140 / 255, 187 / 255)}

    BuilderLoader.skill_names = {
        {{"combat_medic"}, {"fast_learner","tea_time"}, {"medic_2x","tea_cookies"}, {"inspire"}}, --medic
        {{"triathlete"}, {"joker","cable_guy"}, {"control_freak","stockholm_syndrome"}, {"black_marketeer"}}, --controller
        {{"stable_shot"}, {"sharpshooter","rifleman"}, {"speedy_reload","spotter_teamwork"}, {"single_shot_ammo_return"}}, --sharpshooter

        {{"underdog"}, {"shotgun_impact","shotgun_cqb"}, {"close_by","far_away"}, {"overkill"}}, --shotgunner
        {{"oppressor"}, {"pack_mule","show_of_force"}, {"prison_wife","iron_man"}, {"juggernaut"}}, --tank
        {{"scavenging"}, {"portable_saw","ammo_reservoir"}, {"carbon_blade","ammo_2x"}, {"bandoliers"}}, --ammo specialist

        {{"defense_up"}, {"eco_sentry","sentry_targeting_package"}, {"jack_of_all_trades","engineering"}, {"tower_defense"}}, --engineer
        {{"hardware_expert"}, {"drill_expert","combat_engineering"}, {"kick_starter","more_fire_power"}, {"fire_trap"}}, --breacher
        {{"steady_grip"}, {"fire_control","heavy_impact"}, {"fast_fire","shock_and_awe"}, {"body_expertise"}}, --oppressor

        {{"jail_workout"}, {"chameleon","cleaner"}, {"ecm_booster","second_chances"}, {"ecm_2x"}}, --shinobi
        {{"sprinter"}, {"thick_skin","awareness"}, {"insulation","dire_need"}, {"jail_diet"}}, --artful dodger
        {{"scavenger"}, {"silence_expert","optic_illusions"}, {"hitman","backstab"}, {"unseen_strike"}}, --silent killer

        {{"equilibrium"}, {"akimbo","dance_instructor"}, {"expert_handling","gun_fighter"}, {"trigger_happy"}}, --gunslinger
        {{"nine_lives"}, {"up_you_go","running_from_death"}, {"feign_death","perseverance"}, {"messiah"}}, --revenant
        {{"martial_arts"}, {"steroids","bloodthirst"}, {"wolverine","drop_soap"}, {"frenzy"}} --brawler

    }

    BuilderLoader.tier_cost = {{1,3},{2,4},{3,6},{4,8}}

    BuilderLoader.grenades = {
        "dada_com", --Matryoshka Grenade
        "fir_com", --Incendiary Grenade
        "frag_com", --HEF grenade
        "wpn_prj_ace", --Ace of spades
        "concussion", --concussion
        "frag", --Frag
        "molotov", --Molotov
        "dynamite", --Dynamite
        "wpn_prj_four", --Shuriken
        "wpn_prj_jav", --Javelin
        "wpn_prj_target", --Throwing knife
        "wpn_prj_hur", --Throwing axe
        "damage_control", --Stoic flask
        "pocket_ecm_jammer", --Pocket ECM Jammer
        "smoke_screen_grenade", --Smoke bomb
        "tag_team", --Gas Dispenser
        "chico_injector", --Injector
        "wpn_gre_electric", --X1-ZAPer
        "copr_ability" --Leech ampule
    }

    BuilderLoader.deployables = {"ammo_bag", "armor_kit", "bodybags_bag", "doctor_bag", "ecm_jammer",
    "first_aid_kit", "sentry_gun", "sentry_gun_silent", "trip_mine"}

    --Data waiting to be set
    BuilderLoader.subtrees = {
        {{0}, {0,0}, {0,0}, {0}}, --medic
        {{0}, {0,0}, {0,0}, {0}}, --controller
        {{0}, {0,0}, {0,0}, {0}}, --sharpshooter
        {{0}, {0,0}, {0,0}, {0}}, --shotgunner
        {{0}, {0,0}, {0,0}, {0}}, --tank
        {{0}, {0,0}, {0,0}, {0}}, --ammo specialist
        {{0}, {0,0}, {0,0}, {0}}, --engineer
        {{0}, {0,0}, {0,0}, {0}}, --breacher
        {{0}, {0,0}, {0,0}, {0}}, --oppressor
        {{0}, {0,0}, {0,0}, {0}}, --shinobi
        {{0}, {0,0}, {0,0}, {0}}, --artful dodger
        {{0}, {0,0}, {0,0}, {0}}, --silent killer
        {{0}, {0,0}, {0,0}, {0}}, --gunslinger
        {{0}, {0,0}, {0,0}, {0}}, --revenant
        {{0}, {0,0}, {0,0}, {0}}, --brawler
    }
    BuilderLoader.deployable = nil
    BuilderLoader.grenade = nil
    BuilderLoader.armor = nil
    BuilderLoader.perkdeck = nil

    --bitwise and
    function BuilderLoader:_bit_and(a, b)
        local result = 0
        local bitval = 1
        while a > 0 and b > 0 do
            if a % 2 == 1 and b % 2 == 1 then -- test the rightmost bits
                result = result + bitval      -- set the current bit
            end
            bitval = bitval * 2 -- shift left
            a = math.floor(a/2) -- shift right
            b = math.floor(b/2)
        end
        return result
    end

    --################# Skills #################
    
    --Resets build currently loaded in PD2Builder loader
    function BuilderLoader:_reset_skills()
        for currentSubtree=1,#BuilderLoader.subtrees,1 do
            for currentTier=#BuilderLoader.subtrees[currentSubtree],1,-1 do
                for currentSkill=1,#BuilderLoader.subtrees[currentSubtree][currentTier],1 do
                    BuilderLoader.subtrees[currentSubtree][currentTier][currentSkill] = 0
                end
            end
        end
    end

    --Returns whether loaded build has any skills or not
    --Used for when build only has a deployable, perk deck or something like that
    function BuilderLoader:is_skills_empty()
        local counter = 0
        for currentSubtree=1,#self.subtrees,1 do
            for currentTier=#self.subtrees[currentSubtree],1,-1 do
                for currentSkill=1,#self.subtrees[currentSubtree][currentTier],1 do
                    counter = counter + self.subtrees[currentSubtree][currentTier][currentSkill]
                end
            end
        end
        return counter == 0
    end

    function BuilderLoader:_set_skills()
        --refunding every skill we currently own
        for currentSubtree=1,#self.subtrees,1 do
            for currentTier=#self.subtrees[currentSubtree],1,-1 do
                for currentSkill=1,#self.subtrees[currentSubtree][currentTier],1 do
                    local name = self.skill_names[currentSubtree][currentTier][currentSkill]
                    local tree = currentSubtree
                    local tier = currentTier
                    local skill_level = managers.skilltree:skill_step(self.skill_names[currentSubtree][currentTier][currentSkill])
                    while skill_level > 0 do
                        if managers.skilltree:refund_skill(tree, tier, name) then
                            local cost = BuilderLoader.tier_cost[currentTier][skill_level]
                            managers.skilltree:refund_points(cost)
                            managers.skilltree:_set_points_spent(tree, managers.skilltree:points_spent(tree) - cost)
                        end
                        skill_level = managers.skilltree:skill_step(self.skill_names[currentSubtree][currentTier][currentSkill])
                    end
                end
            end
        end

        --getting new skills
        for currentSubtree=1,#self.subtrees,1 do
            for currentTier=1,#self.subtrees[currentSubtree],1 do
                for currentSkill=1,#self.subtrees[currentSubtree][currentTier],1 do
                    local name = self.skill_names[currentSubtree][currentTier][currentSkill]
                    if self.subtrees[currentSubtree][currentTier][currentSkill] ~= 0 then --investing points
                        local tree = currentSubtree
                        local tier = currentTier
                        for i=1,self.subtrees[currentSubtree][currentTier][currentSkill],1 do
                            BuilderLoader:_unlock_skill(name, tree, tier)
                        end
                    end
                end
            end
        end
    end

    function BuilderLoader:_unlock_skill(skill_id, tree, tier)
        if managers.skilltree:has_enough_skill_points(skill_id) and managers.skilltree:unlock(skill_id) then
    		local skill_step = managers.skilltree:skill_step(skill_id)
    		local points = managers.skilltree:skill_cost(tier, skill_step)
    		local skill_points = managers.skilltree:spend_points(points)

    		managers.skilltree:_set_points_spent(tree, managers.skilltree:points_spent(tree) + points)
    	end
    end
    
    --Loads skills from raw string into skills list
    function BuilderLoader:_load_skills_from_text(text)
        BuilderLoader:_reset_skills()
        local skills = BuilderLoader:_get_raw(text, "s")
        if skills == nil then
            return
        else
            skills = BuilderLoader:_decompress_skills(skills)
        end
        for currentSubtree=1,#self.subtrees,1 do
            local subtreeBasicChar = BuilderLoader:get_byte(string.sub(skills, 1, 1))
            local subtreeAcedChar = BuilderLoader:get_byte(string.sub(skills, 2, 2))
            local mask = 1

            for currentTier=1,#self.subtrees[currentSubtree],1 do
                for currentSkill=1,#self.subtrees[currentSubtree][currentTier],1 do
                    local skillBasicBit = BuilderLoader:_bit_and(subtreeBasicChar, mask)
                    local skillAcedBit = BuilderLoader:_bit_and(subtreeAcedChar, mask)

                    if skillBasicBit ~= 0 then
                        self.subtrees[currentSubtree][currentTier][currentSkill] = 1
                    elseif skillAcedBit ~= 0 then
                        self.subtrees[currentSubtree][currentTier][currentSkill] = 2
                    end

                    mask = mask * 2
                end
            end

            skills = string.sub(skills, 3, #skills)
        end
    end

    --Loads skills into PD2Builder loader from player
    function BuilderLoader:_load_skills_from_from_player()
        --getting new skills
        --This is awful and needs to be rewritten
        for currentSubtree=1,#self.subtrees,1 do
            for currentTier=1,#self.subtrees[currentSubtree],1 do
                for currentSkill=1,#self.subtrees[currentSubtree][currentTier],1 do
                    local name = self.skill_names[currentSubtree][currentTier][currentSkill]
                    self.subtrees[currentSubtree][currentTier][currentSkill] = managers.skilltree:next_skill_step(name) - 1
                end
            end
        end
    end

    --Decompresses skills from PD2Builder compressed string
    function BuilderLoader:_decompress_skills(data)
        if data == nil then
            return nil
        end
        local decompressed = ""
        local i = 0
        while i <= #data do
            if string.sub(data, i + 1, i + 1) == "-" then
                decompressed = decompressed .. string.rep(string.sub(data, i, i), string.sub(data, i + 2, i + 2))
                i = i + 2
            else
                decompressed = decompressed .. string.sub(data, i, i)
            end
            i = i + 1
        end
        
        --Technically, zeroes at the end of the skills string are not necessary and website will load
        --your build without them.
        local length = #decompressed
        if length < 30 then
            for i = 1, 30 - length, 1 do
                decompressed = decompressed .. "0"
            end
        end
        return decompressed
    end

    --Compresses skills string
    function BuilderLoader:_compress_skills(data)
        if data == nil then
            return nil
        end
        local compressed = ""
        
        local currentSeries = ""
        local currentSeriesLength = 1
        for i = 1,#data,1 do
            if (string.sub(data, i, i) == currentSeries) then
                currentSeriesLength = currentSeriesLength + 1
            else
                if currentSeriesLength > 3 then
                    compressed = compressed .. currentSeries .. "-" .. tostring(currentSeriesLength)
                else
                    for j = 1, currentSeriesLength, 1 do
                        compressed = compressed .. currentSeries
                    end
                end
                currentSeries = string.sub(data, i, i)
                currentSeriesLength = 1
            end
            if currentSeriesLength == 9 or i == #data then
                if currentSeriesLength > 3 then
                    compressed = compressed .. currentSeries .. "-" .. tostring(currentSeriesLength)
                else
                    for j = 1, currentSeriesLength, 1 do
                        compressed = compressed .. currentSeries
                    end
                end
            end
        end

        return compressed
    end

    --Converts skills list into PD2Builder format
    function BuilderLoader:_convert_skills()
        local result = ""
        for currentSubtree=1,#self.subtrees,1 do
            local subtreeBasicChar = 0
            local subtreeAcedChar = 0

            --We have to go backwards since that's how website does it
            for currentTier=#self.subtrees[currentSubtree],1,-1 do
                for currentSkill=#self.subtrees[currentSubtree][currentTier],1,-1 do
                    local skill = self.subtrees[currentSubtree][currentTier][currentSkill]
                    if (skill == 1) then
                        subtreeBasicChar = subtreeBasicChar + 1
                    end
                    if (skill == 2) then
                        subtreeAcedChar = subtreeAcedChar + 1
                    end
                    --Shifting is skipped with the bottom skill
                    if (currentTier ~= 1) then
                        subtreeBasicChar = subtreeBasicChar * 2
                        subtreeAcedChar = subtreeAcedChar * 2
                    end
                end
            end
            result = result .. BuilderLoader:get_byte(subtreeBasicChar) .. BuilderLoader:get_byte(subtreeAcedChar)
        end
        return result
    end

    --################# END Skills #################

    function BuilderLoader:_set_perkdeck()
        if self.perkdeck then
            managers.skilltree:set_current_specialization(managers.skilltree:digest_value(self.perkdeck, false), 1)
        end
    end

    function BuilderLoader:_set_armor()
        if self.armor then
            managers.blackmarket:equip_armor("level_" .. self.armor)
        end
    end

    function BuilderLoader:_set_grenade()
        if self.grenade then
            managers.blackmarket:equip_grenade(self.grenades[self.grenade])
        end
    end

    function BuilderLoader:_set_deployable()
        if self.deployable then
            for i = 1,#self.deployable,1 do
                local data = {}
                data.name = self.deployables[self.deployable[i]]
                data.target_slot = i
                managers.blackmarket:equip_deployable(data)
            end
        end
    end

    --Get raw data from link
    function BuilderLoader:_get_raw(text, looking_For)
        local result = nil
        local start = false
        for i=1,#text,1 do
            --Looking for where skills start
            if start == false then
                if string.sub(text, i - 1, i) == looking_For .. "=" then
                    start = true
                    result = ""
                end
            elseif string.sub(text, i, i) ~= "&" then
                result = result .. string.sub(text, i, i)
            else
                break
            end
        end
        return result
    end

    function BuilderLoader:load_build(text)
        BuilderLoader:_load_skills_from_text(text)
        self.grenade = BuilderLoader:get_byte(BuilderLoader:_get_raw(text, "t"))
        self.perkdeck = BuilderLoader:get_byte(BuilderLoader:_get_raw(text, "p"))
        self.armor = BuilderLoader:get_byte(BuilderLoader:_get_raw(text, "a"))
        self.deployable = BuilderLoader:_get_raw(text, "d")

        if (self.grenade) then self.grenade = self.grenade + 1 end
        if (self.perkdeck) then self.perkdeck = self.perkdeck + 1 end
        if (self.armor) then self.armor = self.armor + 1 end
        if (self.deployable) then
            local newDeployable = {}
            for slot = 1,#self.deployable,1 do
                table.insert(newDeployable, BuilderLoader:get_byte(string.sub(self.deployable,slot,slot)) + 1)
            end
            self.deployable = newDeployable
        end
    end

    function BuilderLoader:upload_build()
        BuilderLoader:_load_skills_from_from_player()
        local skills = nil
        if not BuilderLoader:is_skills_empty() then
            skills = BuilderLoader:_compress_skills(BuilderLoader:_convert_skills())
        end

        local result = self.link_to_pd2builder

        --Skills
        if skills then
            result = result .. "s=" .. skills
        end
        --Perk deck
        result = result .. "&p=" .. BuilderLoader:get_byte(managers.skilltree:get_specialization_value("current_specialization") - 1)
        --Armor
        result = result .. "&a=" .. BuilderLoader:get_byte(BuilderLoader:get_byte(managers.blackmarket:equipped_armor():gsub("level_","")) - 1)
        --Throwable
        if (managers.blackmarket:equipped_grenade() ~= "none") then
            for i = 1,#BuilderLoader.grenades,1 do
                if BuilderLoader.grenades[i] == managers.blackmarket:equipped_grenade() then
                    result = result .. "&t=" .. BuilderLoader:get_byte(i - 1)
                end
            end
        end
        --Deployable
        for slot = 1,2,1 do
            if (managers.blackmarket:equipped_deployable(slot) ~= "none") then
                for i = 1,#BuilderLoader.deployables,1 do
                    if BuilderLoader.deployables[i] == managers.blackmarket:equipped_deployable(slot) then
                        if (slot == 1) then
                            result = result .. "&d="
                        end
                        result = result .. BuilderLoader:get_byte(i - 1)
                    end
                end
            end
        end
        return result
    end

    function BuilderLoader:set_build()
        BuilderLoader:_set_perkdeck()
        BuilderLoader:_set_armor()
        BuilderLoader:_set_grenade()
        BuilderLoader:_set_deployable()
        BuilderLoader:_set_skills()
    end

    function BuilderLoader:get_perkdeck_string()
        local perkdeck_name = tweak_data.skilltree.specializations[managers.skilltree:digest_value(BuilderLoader.perkdeck, false)]
        return managers.localization:text("menu_specialization") .. ": ##" .. managers.localization:text(perkdeck_name.name_id) .. "##"
    end

    function BuilderLoader:get_armor_string()
        return managers.localization:text("bm_menu_armors") .. ": ##" .. managers.localization:text(tweak_data.blackmarket.armors["level_" .. BuilderLoader.armor].name_id) .. "##"
    end

    function BuilderLoader:get_deployable_string()
        local toReturn = managers.localization:text("bm_menu_deployables") .. ": ##"
        for i = 1,#self.deployable,1 do
            if (i > 1) then
                toReturn = toReturn .. " & "
            end
            toReturn = toReturn .. managers.localization:text(tweak_data.upgrades.definitions[BuilderLoader.deployables[BuilderLoader.deployable[i]]].name_id)
        end
        toReturn = toReturn .. "##"
        return toReturn
    end

    function BuilderLoader:get_grenade_string()
        return managers.localization:text("bm_menu_grenades") .. ": ##" .. managers.localization:text(tweak_data.blackmarket.projectiles[BuilderLoader.grenades[BuilderLoader.grenade]].name_id) .. "##"
    end
end
BuilderLoader:load_build(Application:get_clipboard())

--All the skills on the tree are actually just text
--This way I can use dialog boxes
local text = ""
local text_formating_color_table = {}

if (not BuilderLoader:is_skills_empty()) then
    --Five rows of skills
    for i=1,5,1 do
        --Tree name
        text = text .. managers.localization:text("st_menu_" .. BuilderLoader.pages[i]) .. ":\n"
        --4 tier skills
        for j=1,3,1 do
            text = text .. "     ####          "
            table.insert(text_formating_color_table, BuilderLoader.colors[BuilderLoader.subtrees[(i - 1) * 3 + j][4][1] + 1])
        end
        --near technician we display other stuff about your build
        if (i == 3 and BuilderLoader.perkdeck) then
            text = text .. BuilderLoader:get_perkdeck_string()
            table.insert(text_formating_color_table, BuilderLoader.colors_unlocked[BuilderLoader:is_perkdeck_unlocked()])
        end
        text = text .. "\n"
        --3 and 2 tier skills
        for k=1,2,1 do
            for j=1,6,1 do
                text = text .. "####    "
                if (math.fmod(j,2) == 1) then
                    text = text .. " "
                end
                table.insert(text_formating_color_table, BuilderLoader.colors[
                    BuilderLoader.subtrees[(i - 1) * 3 + math.floor((j - 1) / 2) + 1][4 - k][math.fmod(j,2) + 1] + 1
                ])
            end
            --near technician we display armor and deployable
            if (i == 3) then
                if (k == 1 and BuilderLoader.armor) then
                    text = text .. " " .. BuilderLoader:get_armor_string()
                    table.insert(text_formating_color_table, Color.yellow)
                end
                if (k == 2 and BuilderLoader.deployable) then
                    text = text .. " " .. BuilderLoader:get_deployable_string()
                    table.insert(text_formating_color_table, Color.yellow)
                end
            end
            text = text .. "\n"
        end
        --1 tier skills
        for j=1,3,1 do
            text = text .. "     ####          "
            table.insert(text_formating_color_table, BuilderLoader.colors[BuilderLoader.subtrees[(i - 1) * 3 + j][1][1] + 1])
        end
        --near technician we display other stuff about your build
        if (i == 3 and BuilderLoader.grenade) then
            text = text .. BuilderLoader:get_grenade_string()
            table.insert(text_formating_color_table, BuilderLoader.colors_unlocked[BuilderLoader:is_grenade_unlocked()])
        end
        text = text .. "\n"
    end
else
    if (BuilderLoader.perkdeck) then
        text = text .. BuilderLoader:get_perkdeck_string() .. "\n"
        table.insert(text_formating_color_table, BuilderLoader.colors_unlocked[BuilderLoader:is_perkdeck_unlocked()])
    end
    if (BuilderLoader.armor) then
        text = text .. BuilderLoader:get_armor_string() .. "\n"
        table.insert(text_formating_color_table, Color.yellow)
    end
    if (BuilderLoader.deployable) then
        text = text .. BuilderLoader:get_deployable_string() .. "\n"
        table.insert(text_formating_color_table, Color.yellow)
    end
    if (BuilderLoader.grenade) then
        text = text .. BuilderLoader:get_grenade_string()
        table.insert(text_formating_color_table, BuilderLoader.colors_unlocked[BuilderLoader:is_grenade_unlocked()])
    end
end

local load_button = {
    text = managers.localization:text("dialog_ok"),
    callback_func = BuilderLoader.set_build
}
local cancel_button = {
    text = managers.localization:text("dialog_cancel")
}
local button_list = {}
if (text == "") then
    text = "Invalid PD2Builder link"
else
    table.insert(button_list, load_button)
end
table.insert(button_list, cancel_button)

local dialog_data = {
    focus_button = 1,
    title = "PD2Builder Loader",
    text = text,
    use_text_formating = true,
    text_formating_color_table = text_formating_color_table,
    h = 1920,
	w = 600,
	type = "",
    font_size = tweak_data.menu.pd2_medium_font_size * 0.9,
    button_list = button_list
}
managers.system_menu:show(dialog_data)
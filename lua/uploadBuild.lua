local buildLink = BuilderLoader:upload_build()
Steam:overlay_activate("url", buildLink)

local button_list = {{
    text = managers.localization:text("dialog_ok")
}}

local text = "Your build link has been successfully generated and opened in Steam overlay browser\n" .. buildLink

local dialog_data = {
    focus_button = 1,
    title = "PD2Builder Loader",
    text = text,
    use_text_formating = true,
    text_formating_color_table = {},
	type = "",
    font_size = tweak_data.menu.pd2_medium_font_size,
    button_list = button_list
}
managers.system_menu:show(dialog_data)
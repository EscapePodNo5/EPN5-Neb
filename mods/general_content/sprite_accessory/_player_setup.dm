/datum/category_group/player_setup_category/cosmetics
	name = "Cosmetics"
	sort_order = 9
	category_item_type = /datum/category_item/player_setup_item/cosmetics

// Define a place to save appearance in character setup
/datum/preferences
	var/ear_style		// Type of selected ear style
	var/r_ears = 30		// Ear color.
	var/g_ears = 30		// Ear color
	var/b_ears = 30		// Ear color
	var/r_ears2 = 30	// Ear extra color.
	var/g_ears2 = 30	// Ear extra color
	var/b_ears2 = 30	// Ear extra color
	var/tail_style		// Type of selected tail style
	var/r_tail = 30		// Tail/Taur color
	var/g_tail = 30		// Tail/Taur color
	var/b_tail = 30		// Tail/Taur color
	var/r_tail2 = 30 	// For extra overlay.
	var/g_tail2 = 30	// For extra overlay.
	var/b_tail2 = 30	// For extra overlay.

// Definition of the stuff for Ears
/datum/category_item/player_setup_item/cosmetics
	name = "Cosmetics"
	sort_order = 1

/datum/category_item/player_setup_item/cosmetics/load_character(var/savefile/S)
	from_file(S["ear_style"], pref.ear_style)
	from_file(S["r_ears"], pref.r_ears)
	from_file(S["g_ears"], pref.g_ears)
	from_file(S["b_ears"], pref.b_ears)
	from_file(S["r_ears2"], pref.r_ears2)
	from_file(S["g_ears2"], pref.g_ears2)
	from_file(S["b_ears2"], pref.b_ears2)
	from_file(S["tail_style"], pref.tail_style)
	from_file(S["r_tail"], pref.r_tail)
	from_file(S["g_tail"], pref.g_tail)
	from_file(S["b_tail"], pref.b_tail)
	from_file(S["r_tail2"], pref.r_tail2)
	from_file(S["g_tail2"], pref.g_tail2)
	from_file(S["b_tail2"], pref.b_tail2)

/datum/category_item/player_setup_item/cosmetics/save_character(var/savefile/S)
	to_file(S["ear_style"], pref.ear_style)
	to_file(S["r_ears"], pref.r_ears)
	to_file(S["g_ears"], pref.g_ears)
	to_file(S["b_ears"], pref.b_ears)
	to_file(S["r_ears2"], pref.r_ears2)
	to_file(S["g_ears2"], pref.g_ears2)
	to_file(S["b_ears2"], pref.b_ears2)
	to_file(S["tail_style"], pref.tail_style)
	to_file(S["r_tail"], pref.r_tail)
	to_file(S["g_tail"], pref.g_tail)
	to_file(S["b_tail"], pref.b_tail)
	to_file(S["r_tail2"], pref.r_tail2)
	to_file(S["g_tail2"], pref.g_tail2)
	to_file(S["b_tail2"], pref.b_tail2)

/datum/category_item/player_setup_item/cosmetics/sanitize_character()
	pref.r_ears		= sanitize_integer(pref.r_ears, 0, 255, initial(pref.r_ears))
	pref.g_ears		= sanitize_integer(pref.g_ears, 0, 255, initial(pref.g_ears))
	pref.b_ears		= sanitize_integer(pref.b_ears, 0, 255, initial(pref.b_ears))
	pref.r_ears2	= sanitize_integer(pref.r_ears2, 0, 255, initial(pref.r_ears2))
	pref.g_ears2	= sanitize_integer(pref.g_ears2, 0, 255, initial(pref.g_ears2))
	pref.b_ears2	= sanitize_integer(pref.b_ears2, 0, 255, initial(pref.b_ears2))
	pref.r_tail		= sanitize_integer(pref.r_tail, 0, 255, initial(pref.r_tail))
	pref.g_tail		= sanitize_integer(pref.g_tail, 0, 255, initial(pref.g_tail))
	pref.b_tail		= sanitize_integer(pref.b_tail, 0, 255, initial(pref.b_tail))
	pref.r_tail2	= sanitize_integer(pref.r_tail2, 0, 255, initial(pref.r_tail2))
	pref.g_tail2	= sanitize_integer(pref.g_tail2, 0, 255, initial(pref.g_tail2))
	pref.b_tail2	= sanitize_integer(pref.b_tail2, 0, 255, initial(pref.b_tail2))
	if(pref.ear_style)
		pref.ear_style	= sanitize_inlist(pref.ear_style, GLOB.ear_styles_list, initial(pref.ear_style))
	if(pref.tail_style)
		pref.tail_style	= sanitize_inlist(pref.tail_style, GLOB.tail_styles_list, initial(pref.tail_style))


/datum/preferences/copy_to(mob/living/carbon/human/character, is_preview_copy = FALSE)
	..()
	character.ear_style			= GLOB.ear_styles_list[ear_style]
	character.r_ears			= r_ears
	character.b_ears			= b_ears
	character.g_ears			= g_ears
	character.r_ears2			= r_ears2
	character.b_ears2			= b_ears2
	character.g_ears2			= g_ears2
	character.tail_style		= GLOB.tail_styles_list[tail_style]
	character.r_tail			= r_tail
	character.b_tail			= b_tail
	character.g_tail			= g_tail
	character.r_tail2			= r_tail2
	character.b_tail2			= b_tail2
	character.g_tail2			= g_tail2
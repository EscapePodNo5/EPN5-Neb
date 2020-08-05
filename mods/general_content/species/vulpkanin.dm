/datum/species/vulpkanin
	name = SPECIES_VULP
	name_plural = SPECIES_VULP

	description = "insert big bad lore description here."

	icobase = 'mods/general_content/icons/vulpkanin/body.dmi'
	//deform = They don't have deformed icons.
	husk_icon = 'mods/general_content/icons/vulpkanin/husk.dmi'
	preview_icon = 'mods/general_content/icons/vulpkanin/preview.dmi'
	tail = "vulptail"
	limb_blend = ICON_MULTIPLY
	tail_blend = ICON_MULTIPLY
	hidden_from_codex = FALSE
	bodytype = BODYTYPE_HUMANOID
	spawn_flags = SPECIES_CAN_JOIN

	//unarmed_attacks = list(/decl/natural_attack/stomp /decl/natural_attack/kick, /decl/natural_attack/punch, /decl/natural_attack/bite/sharp, /decl/natural_attack/claws)



//	spawn_flags = SPECIES_IS_RESTRICTED
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	sexybits_location = BP_GROIN //For groin shots.


	available_cultural_info = list( //Cultures and stuff.
		TAG_CULTURE = list(
			CULTURE_HUMAN
		)
	)
/datum/species/skrell
	name = SPECIES_SKRELL
	name_plural = SPECIES_SKRELL
	description = "insert big bad lore description here."
	icobase = 'mods/general_content/icons/skrell/body.dmi'
	deform = 'mods/general_content/icons/skrell/deformed_body.dmi'
	husk_icon = 'mods/general_content/icons/skrell/husk.dmi'
	preview_icon = 'mods/general_content/icons/skrell/preview.dmi'
	hidden_from_codex = FALSE
	spawn_flags = SPECIES_CAN_JOIN
	bodytype = BODYTYPE_HUMANOID
	genders = list(PLURAL)

	//unarmed_attacks = list(/decl/natural_attack/stomp /decl/natural_attack/kick, /decl/natural_attack/punch, /decl/natural_attack/bite/sharp, /decl/natural_attack/claws)



	spawn_flags = SPECIES_IS_RESTRICTED
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	sexybits_location = BP_GROIN //For groin shots.


	available_cultural_info = list( //Cultures and stuff.
		TAG_CULTURE = list(
			CULTURE_HUMAN
		)
	)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs/gills,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/skrell
		)


/datum/species/skrell/get_sex(var/mob/living/carbon/human/H)
	return istype(H) && (H.descriptors["headtail length"] == 1 ? MALE : FEMALE)

/datum/species/skrell/check_background()
	return TRUE
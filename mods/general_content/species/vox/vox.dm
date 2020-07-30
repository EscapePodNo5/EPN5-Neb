/datum/species/vox
	name = SPECIES_VOX
	name_plural = SPECIES_VOX
	icobase =         'mods/general_content/icons/vox/body.dmi'
	deform =          'mods/general_content/icons/vox/body.dmi'
	husk_icon =       'mods/general_content/icons/vox/body.dmi'
	damage_overlays = 'mods/general_content/icons/vox/damage_overlay.dmi'
	damage_mask =     'mods/general_content/icons/vox/damage_mask.dmi'
	blood_mask =      'mods/general_content/icons/vox/blood_mask.dmi'

	limb_blend = ICON_MULTIPLY
	bodytype = BODYTYPE_HUMANOID

	//unarmed_types = list(	/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws/strong/gloves, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/strong)
	rarity_value = 4
	description = "insert lore description"

	taste_sensitivity = TASTE_DULL

	warning_low_pressure = 50
	hazard_low_pressure = 0

	cold_level_1 = 80
	cold_level_2 = 50
	cold_level_3 = -1

	min_age = 18
	max_age = 100

	gluttonous = GLUT_TINY|GLUT_ITEM_NORMAL
	stomach_capacity = 12

	poison_types = list(GAS_OXYGEN = TRUE)
	siemens_coefficient = 0.2

	species_flags = SPECIES_FLAG_NO_SCAN
	spawn_flags = SPECIES_CAN_JOIN // | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_EYE_COLOR | HAS_HAIR_COLOR

	blood_color = "#2299fc"
	flesh_color = "#808d11"

	maneuvers = list(/decl/maneuver/leap/grab)
	standing_jump_range = 5

	sexybits_location = BP_GROIN

	has_organ = list(
		BP_STOMACH =    /obj/item/organ/internal/stomach/vox,
		BP_HEART =      /obj/item/organ/internal/heart/vox,
		BP_LUNGS =      /obj/item/organ/internal/lungs/vox,
		BP_LIVER =      /obj/item/organ/internal/liver/vox,
		BP_KIDNEYS =    /obj/item/organ/internal/kidneys/vox,
		BP_BRAIN =      /obj/item/organ/internal/voxstack,
		BP_EYES =       /obj/item/organ/internal/eyes/vox,
		BP_HINDTONGUE = /obj/item/organ/internal/hindtongue
		)

	genders = list(NEUTER)
	descriptors = list(
		/datum/mob_descriptor/height = -1,
		/datum/mob_descriptor/build = 1,
		)

	//available_cultural_info =

/datum/species/vox/disfigure_msg(var/mob/living/carbon/human/H)
	var/datum/gender/T = gender_datums[H.get_gender()]
	return "<span class='danger'>[T.His] beak-segments are cracked and chipped! [T.He] [T.is] not even recognizable.</span>\n"

/datum/species/vox/skills_from_age(age)
	. = 8
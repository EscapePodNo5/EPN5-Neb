/datum/species/unathi
	name = SPECIES_UNATHI
	name_plural = SPECIES_UNATHI
	icon_template = 'icons/mob/human_races/species/template_tall.dmi'
	icobase = 'mods/general_content/icons/unathi/body.dmi'
	deform = 'mods/general_content/icons/unathi/deformed_body.dmi'
	husk_icon = 'mods/general_content/icons/unathi/husk.dmi'
	preview_icon = 'mods/general_content/icons/unathi/preview.dmi'
	tail = "sogtail"
	tail_animation = 'mods/general_content/icons/unathi/unathi_tail.dmi'
	limb_blend = ICON_MULTIPLY
	tail_blend = ICON_MULTIPLY
	hidden_from_codex = FALSE

	unarmed_attacks = list(/decl/natural_attack/stomp, /decl/natural_attack/tail, /decl/natural_attack/claws, /decl/natural_attack/punch, /decl/natural_attack/bite/sharp)
	primitive_form = "Stok"
	darksight_range = 4
	darksight_tint = DARKTINT_MODERATE
	gluttonous = GLUT_TINY
	strength = STR_HIGH
	breath_pressure = 18
	slowdown = 0.5
	brute_mod = 0.8
	flash_mod = 1.2
	blood_volume = 800

	health_hud_intensity = 2
	hunger_factor = DEFAULT_HUNGER_FACTOR * 2

	min_age = 18
	max_age = 120 //At the request of the Unathi lore dev, pending lore update

	body_temperature = null //Makes their body temperature the same as environment, cold blooded

	description = "A heavily reptillian species, Unathi (or 'Sinta as they call themselves) hail from the \
	Uuosa-Eso system, which roughly translates to 'burning mother'.<br/><br/>Coming from a harsh, radioactive \
	desert planet, they mostly hold ideals of honesty, virtue, and bravery above all else, \
	frequently even their own lives. They prefer warmer temperatures than most species and \
	their native tongue is a heavy hissing laungage called Sinta'Unathi."

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_NO_ROBOTIC_INTERNAL_ORGANS
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#34af10"

	base_color = "#066000"
	blood_color = "#f24b2e"
	organs_icon = 'mods/general_content/icons/unathi/organs.dmi'

	move_trail = /obj/effect/decal/cleanable/blood/tracks/claw

	heat_discomfort_level = 320
	heat_discomfort_strings = list(
		"You feel soothingly warm.",
		"You feel the heat sink into your bones.",
		"You feel warm enough to take a nap."
		)

	cold_discomfort_level = 290
	cold_discomfort_strings = list(
		"You feel chilly.",
		"You feel sluggish and cold.",
		"Your scales bristle against the cold."
		)
	breathing_sound = 'sound/voice/lizard.ogg'

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/unathi
		)

	prone_overlay_offset = list(-4, -4)

	descriptors = list(
		/datum/mob_descriptor/height = 2,
		/datum/mob_descriptor/build = 2
		)

	pain_emotes_with_pain_level = list(
			list(/decl/emote/audible/wheeze, /decl/emote/audible/roar, /decl/emote/audible/bellow, /decl/emote/audible/howl) = 80,
			list(/decl/emote/audible/grunt, /decl/emote/audible/groan, /decl/emote/audible/wheeze, /decl/emote/audible/hiss) = 50,
			list(/decl/emote/audible/grunt, /decl/emote/audible/groan, /decl/emote/audible/hiss) = 20,
		)

/datum/species/unathi/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes_str)

/datum/species/unathi/get_bodytype(var/mob/living/carbon/human/H)
	return BODYTYPE_HUMANOID

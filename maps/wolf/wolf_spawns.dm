GLOBAL_LIST_EMPTY(latejoin_cryo_two)

/obj/effect/landmark/Initialize()
	if(name == "JoinLateCryoTwo")
		GLOB.latejoin_cryo_two += loc
		delete_me = 1
	. = ..()

/datum/map/wolf
	allowed_spawns = list("First Deck Cryogenic Storage", "Third Deck Cryogenic Storage", "Robot Storage")
	default_spawn = "Third Deck Cryogenic Storage"

/datum/spawnpoint/cryo
	display_name = "Third Deck Cryogenic Storage"
	msg = "has completed revival in the Third Deck cryogenics bay"
	disallow_job = list("Robot")

/datum/spawnpoint/cryo/two
	display_name = "First Deck Cryogenic Storage"
	msg = "has completed revival in the First Deck cryogenics bay"
	disallow_job = list("Robot")

/datum/spawnpoint/cryo/two/New()
	..()
	turfs = GLOB.latejoin_cryo_two
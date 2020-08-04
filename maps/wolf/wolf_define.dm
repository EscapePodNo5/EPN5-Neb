/datum/map/wolf
	name = "Wolf"
	full_name = "FTE Odyssey"
	path = "wolf"
	ground_noun = "deckplate"

	lobby_tracks = list(/music_track/wolf/great_expectations, /music_track/wolf/yamato, /music_track/wolf/interception, /music_track/wolf/augmentations)

	station_levels = list(1, 2, 3, 4)
	contact_levels = list(1, 2, 3, 4)
	player_levels = list(1, 2, 3, 4)

	station_name  = "FTE Odyssey"
	station_short = "Odyssey"

	dock_name     = "FTE Wolf's Den"
	boss_name     = "Fenris Tactical Enforcement Command"
	boss_short    = "Enforcement Command"
	company_name  = "Fenris Tactical Enforcement"
	company_short = "FTE"
	overmap_event_areas = 11
	lobby_screens = list('maps/wolf/icons/wolf_lobby.png')
	use_overmap = 1
	num_exoplanets = 3
	welcome_sound = 'sound/effects/cowboysting.ogg'
	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type = /datum/evacuation_controller/starship/wolf

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/wolf/get_map_info()
	return "You're aboard the <b>[station_name],</b> a mercenary vessel owned by Fenris Tactical Enterprises, an asset protection company specializing in anti-piracy. \
	Welcome to the deep frontier, it will be your home and place of employment for however long your contract with the company lasts, you're likely light years away from your real home now and in the deepest reaches of barely known space where all sorts of undesirables love to hide, this gives you a job. This also means you can't trust anybody outside of your crew, and even those within your crew should be looked at with a skeptical eye, even then they're all you have left now. It's just you, the rest of the crew, and the [station_short]."

/datum/map/wolf
	name = "Wolf"
	full_name = "FTE Odyssey"
	path = "wolf"
	ground_noun = "deckplate"

//	lobby_tracks = list(/music_track/absconditus)

	station_levels = list(1, 2, 3, 4)
	contact_levels = list(1, 2, 3, 4)
	player_levels = list(1, 2, 3, 4)

	station_name  = "IMV So Much For Subtlety"
	station_short = "So Much For Subtlety"

	dock_name     = "FTE Wolf's Den"
	boss_name     = "Fenris Tactical Enforcement Command"
	boss_short    = "Enforcement Command"
	company_name  = "Fenris Tactical Enforcement"
	company_short = "FTE"
	overmap_event_areas = 11
//	lobby_screens = list('maps/tradeship/lobby/bloodmoney.png','maps/tradeship/lobby/vapormoney.png')
	use_overmap = 1
	num_exoplanets = 3
	welcome_sound = 'sound/effects/cowboysting.ogg'
	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type = /datum/evacuation_controller/lifepods

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

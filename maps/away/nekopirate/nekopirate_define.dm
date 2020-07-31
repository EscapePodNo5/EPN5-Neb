/datum/map/nekopirate
	name = "Aurelia"
	full_name = "FC Aurelia"
	path = "nekopirate"
	ground_noun = "deck"

	station_levels = list(1, 2, 3)
	contact_levels = list(1, 2, 3)
	player_levels = list(1, 2, 3)

	station_name  = "FC Aurelia"
	station_short = "Aurelia"

	dock_name     = "Free Haven"
	boss_name     = "Celestial Heaven"
	boss_short    = "Celestials"
	company_name  = "Free Ships"
	company_short = "FS"
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

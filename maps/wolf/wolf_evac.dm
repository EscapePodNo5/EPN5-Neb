#define EVAC_WOLF_IDLE       0
#define EVAC_WOLF_PREPPING   1
#define EVAC_WOLF_LAUNCHING  2
#define EVAC_WOLF_IN_TRANSIT 3
#define EVAC_WOLF_COOLDOWN   4
#define EVAC_WOLF_COMPLETE   5

/datum/evacuation_controller/starship/wolf //We do some things differently. Literally. This just overwrites two lines.

/datum/map/wolf
	evac_controller_type = /datum/evacuation_controller/starship/wolf

/datum/evacuation_controller/starship/wolf/cancel_evacuation() //Overwrites yay
	if(!can_cancel())
		return 0

	evac_cooldown_time = world.time + (world.time - evac_called_at)
	state = EVAC_WOLF_COOLDOWN

	evac_ready_time =   null
	evac_arrival_time = null
	evac_no_return =    null
	evac_called_at =    null
	evac_launch_time =  null
	auto_recall_time =  null

	if(emergency_evacuation)
		evac_recalled.Announce(GLOB.using_map.emergency_shuttle_recall_message)
		for(var/area/A in world)
			if(istype(A, /area/ship/wolf/hallway/))
				A.readyreset()
		emergency_evacuation = 0
	else
		priority_announcement.Announce(GLOB.using_map.shuttle_recall_message)

	return 1

/datum/evacuation_controller/starship/wolf/call_evacuation(var/mob/user, var/_emergency_evac, var/forced, var/skip_announce, var/autotransfer)

	if(state != EVAC_WOLF_IDLE)
		return 0

	if(!can_evacuate(user, forced))
		return 0

	emergency_evacuation = _emergency_evac

	var/evac_prep_delay_multiplier = 1
	if(SSticker.mode)
		evac_prep_delay_multiplier = SSticker.mode.shuttle_delay

	var/additional_delay
	if(_emergency_evac)
		additional_delay = emergency_prep_additional_delay
	else if(autotransfer)
		additional_delay = autotransfer_prep_additional_delay
	else
		additional_delay = transfer_prep_additional_delay

	evac_called_at =    world.time
	evac_no_return =    evac_called_at +    round(evac_prep_delay/2) + additional_delay
	evac_ready_time =   evac_called_at +    (evac_prep_delay*evac_prep_delay_multiplier) + additional_delay
	evac_launch_time =  evac_ready_time +   evac_launch_delay
	evac_arrival_time = evac_launch_time +  evac_transit_delay

	var/evac_range = round((evac_launch_time - evac_called_at)/3)
	auto_recall_time =  rand(evac_called_at + evac_range, evac_launch_time - evac_range)

	state = EVAC_WOLF_PREPPING

	if(emergency_evacuation)
		for(var/area/A in world)
			if(istype(A, /area/ship/wolf/hallway/))
				A.readyalert()
		if(!skip_announce)
			GLOB.using_map.emergency_shuttle_called_announcement()
	else
		if(!skip_announce)
			priority_announcement.Announce(replacetext(replacetext(GLOB.using_map.shuttle_called_message, "%dock_name%", "[GLOB.using_map.dock_name]"),  "%ETA%", "[round(get_eta()/60)] minute\s"))

	return 1

/datum/evacuation_controller/starship/wolf/launch_evacuation()
	var/launch_delay = 0
	for(var/obj/machinery/cryopod/lifepod/LP in SSmachines.machinery)
		if(LP.z in GLOB.using_map.station_levels)
			addtimer(CALLBACK(LP, /obj/machinery/cryopod/lifepod/proc/launch), launch_delay SECONDS)
		launch_delay += 0.2
	..()

#undef EVAC_WOLF_IDLE
#undef EVAC_WOLF_PREPPING
#undef EVAC_WOLF_IN_TRANSIT
#undef EVAC_WOLF_COOLDOWN
#undef EVAC_WOLF_COMPLETE

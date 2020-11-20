//The purpose of this file is for various overwrites that need to be done to fix certain things.

//While the sequential blast door opening was cool, it was slow.

// Proc: force_open()
// Parameters: None
// Description: Opens the door. No checks are done inside this proc.
/obj/machinery/door/blast/regular/escape_pod/force_open()
	set waitfor = FALSE
	operating = 1
	playsound(src.loc, open_sound, 100, 1)
	flick(icon_state_opening, src)
	set_density(0)
	update_nearby_tiles()
	update_icon()
	set_opacity(0)
	sleep(15)
	layer = open_layer
	operating = 0

// Proc: force_close()
// Parameters: None
// Description: Closes the door. No checks are done inside this proc.
/obj/machinery/door/blast/regular/escape_pod/force_close()
	set waitfor = FALSE
	operating = 1
	playsound(src.loc, close_sound, 100, 1)
	layer = closed_layer
	flick(icon_state_closing, src)
	set_density(1)
	update_nearby_tiles()
	update_icon()
	set_opacity(1)
	sleep(15)
	operating = 0

/obj/machinery/door/blast/regular/escape_pod/Process()
	if(SSevac.evacuation_controller.emergency_evacuation && SSevac.evacuation_controller.state >= EVAC_LAUNCHING && src.icon_state == icon_state_closed)
		src.force_close()
//Escape pod overwrites for fancy things.

/obj/machinery/cryopod/lifepod
	does_spin = FALSE

/obj/machinery/cryopod/lifepod/launch()
	launched = 1
	for(var/d in GLOB.cardinal)
		var/turf/T = get_step(src,d)
		var/obj/machinery/door/blast/B = locate() in T
		if(B && B.density)
			B.force_open()
			break

	anchored = FALSE

	for(var/obj/machinery/mass_driver/MD in get_turf(src))
		MD.drive(10)

	spawn(1 SECONDS)
		var/list/possible_locations = list()
		if(GLOB.using_map.use_overmap)
			var/obj/effect/overmap/visitable/O = map_sectors["[z]"]
			for(var/obj/effect/overmap/visitable/OO in range(O,2))
				if((OO.sector_flags & OVERMAP_SECTOR_IN_SPACE) || istype(OO,/obj/effect/overmap/visitable/sector/exoplanet))
					possible_locations |= text2num(level)

		var/newz = GLOB.using_map.get_empty_zlevel()
		if(possible_locations.len && prob(10))
			newz = pick(possible_locations)
		var/turf/nloc = locate(rand(TRANSITIONEDGE, world.maxx-TRANSITIONEDGE), rand(TRANSITIONEDGE, world.maxy-TRANSITIONEDGE),newz)
		if(!istype(nloc, /turf/space))
			explosion(nloc, 1, 2, 3)
		playsound(loc,'sound/effects/rocket.ogg',100)
		forceMove(nloc)

/obj/machinery/cryopod/lifepod/Process() //We just want the default cryopod behavior - the evac controller handles launching.
	return //Don't want any of the machinery behavior, really.

/datum/department/engineering
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO

/datum/department/security
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO

/datum/department/medical
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO

/datum/department/science
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO

/datum/department/civilian
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO

/datum/department/command
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO

/datum/department/service
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO

/datum/department/supply
	request_console_flags = RC_ASSIST|RC_SUPPLY|RC_INFO
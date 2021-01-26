/datum/map/wolf
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/ship/wolf/maintenance = NO_SCRUBBER|NO_VENT,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ship/wolf/science/network_closet = NO_SCRUBBER|NO_VENT,
		/area/ship/wolf/engineering/substation = NO_SCRUBBER|NO_VENT,
		/area/ship/wolf/engineering/utility_shaft = NO_SCRUBBER|NO_VENT,
		/area/ship/wolf/security/weapons_bay/two = NO_APC,
		/area/ship/wolf/engineering/fuel_bay/co2 = NO_SCRUBBER,
		/area/ship/wolf/security/weapons_bay/three = NO_VENT|NO_SCRUBBER,
		/area/ship/wolf/command/ofd = NO_SCRUBBER|NO_VENT,
		/area/shuttle/escape_pod_1 = NO_APC,
		/area/shuttle/escape_pod_2 = NO_APC,
		/area/shuttle/escape_pod_3 = NO_APC,
		/area/shuttle/escape_pod_4 = NO_APC
	)

/obj/effect/landmark/map_data/wolf
	height = 4
	UT_turf_exceptions_by_door_type = list(/obj/machinery/door/firedoor = list(/turf/simulated/open))

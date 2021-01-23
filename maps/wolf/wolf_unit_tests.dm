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
		/area/ship/wolf/shuttle/gnat/maint = NO_VENT|NO_SCRUBBER,
		/area/ship/wolf/command/ofd = NO_SCRUBBER|NO_VENT
	)
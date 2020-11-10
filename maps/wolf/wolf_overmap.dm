/obj/effect/overmap/visitable/ship/wolf
	name = "USN Odyssey"
	color = "#00ffff"
	start_x = 4
	start_y = 4
	vessel_mass = 5000
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS
	initial_generic_waypoints = list("nav_odyssey_near_bow_third", "nav_odyssey_near_bow_bridge")
	initial_restricted_waypoints = list(
		"Gnat" = list("odyssey_hangar"), //pod can only dock starboard-side, b/c there's only one door.
	)
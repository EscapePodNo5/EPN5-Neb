/obj/effect/overmap/visitable/ship/nekopirate
	name = "FC Aurelia"
	color = "#00ffff"
	start_x = 4
	start_y = 4
	vessel_mass = 4000
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS

	initial_generic_waypoints = list("nav_nekopirate_below_bow", "nav_nekopirate_below_starboardastern", "nav_nekopirate_port_dock_shuttle")
	initial_restricted_waypoints = list(
		"Boarding Shuttle" = list("nav_nekopirate_aft_dock_pod"), //pod can only dock starboard-side, b/c there's only one door.
	)
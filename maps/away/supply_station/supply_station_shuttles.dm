/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	warmup_time = 10
	location = 1
	dock_target = "supply_shuttle"
	shuttle_area = /area/supply
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"
	defer_initialisation = TRUE


/obj/effect/shuttle_landmark/supply/start
	landmark_tag ="nav_cargo_start"

/obj/effect/shuttle_landmark/supply/station
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"
	base_area = /area/supply_station/supply_dock
	base_turf = /turf/space
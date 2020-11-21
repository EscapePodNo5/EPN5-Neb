#include "supply_station_areas.dm"
#include "supply_station_shuttles.dm"

/obj/effect/overmap/visitable/sector/supply_station
	name = "supply station"
	desc = "Sensors detect an automated supply station."
	icon_state = "object"
	known = 1

	initial_generic_waypoints = list(
		"nav_supply_station_1"
	)

/datum/map_template/ruin/away_site/supply_station
	name = "Supply Station"
	id = "awaysite_supplystation"
	description = "An automated supply station."
	suffixes = list("supply_station/supply_station-1.dmm","supply_station/supply_station-2.dmm")
	cost = 1
	area_usage_test_exempted_root_areas = list(/area/supply_station)
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/obj/effect/shuttle_landmark/nav_supply_station/nav1
	name = "Automated Supply Station Navpoint #1"
	landmark_tag = "nav_supply_station_1"
	base_area = /area/supply_station
	base_turf = /turf/simulated/floor/plating
/obj/machinery/computer/shuttle_control/explore/gnat
	name = "salvage shuttle control console"
	shuttle_tag = "Gnat"

/datum/shuttle/autodock/overmap/gnat
	name = "Gnat"
	shuttle_area = list(/area/ship/wolf/shuttle/gnat/cockpit,/area/ship/wolf/shuttle/gnat/passenger, /area/ship/wolf/shuttle/gnat/cargo, /area/ship/wolf/shuttle/gnat/maint)
	dock_target = "gnat_airlock"
	current_location = "odyssey_hangar"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	warmup_time = 5
	range = 1
	fuel_consumption = 7
	skill_needed = SKILL_BASIC

/obj/effect/overmap/visitable/ship/landable/salvage
	name = "Gnat"
	desc = "A small, slow salvage shuttle."
	shuttle = "Gnat"
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL
	vessel_mass = 10000

/obj/effect/shuttle_landmark/hangar
	name = "Odyssey Hangar"
	landmark_tag = "odyssey_hangar"
	base_area = /area/ship/wolf/hangar
	base_turf = /turf/simulated/floor/tiled/techfloor

/obj/effect/shuttle_landmark/near_bow_third
	name = "Near Odyssey Bow Third Deck"
	landmark_tag = "nav_odyssey_near_bow_third"

/obj/effect/shuttle_landmark/near_bow_bridge
	name = "Near Odyssey Bow Bridge Deck"
	landmark_tag = "nav_odyssey_near_bow_bridge"



/obj/structure/base_projectile
	var/obj/effect/overmap/projectile/overmap_missile = null
	var/frame_mass = 10 //tons.
	var/overmap_name = "projectile"
	var/list/equipment = list()
	var/accepted_equipment
	var/projectile_type

/obj/structure/base_projectile/Destroy()
	. = ..()
	if(!QDELETED(overmap_missile))
		QDEL_NULL(overmap_missile)
	overmap_missile = null

/obj/structure/base_projectile/proc/update_bounds()
	return

/obj/structure/base_projectile/proc/activate()
	var/obj/effect/overmap/start_object = waypoint_sector(src)
	if(!start_object)
		return 0

	var/turf/T = get_turf(start_object)

	overmap_missile = new /obj/effect/overmap/projectile(null, T)
	overmap_missile.set_missile(src)
	overmap_missile.recalc_mass()
	overmap_missile.SetName(overmap_name)
	overmap_missile.host_ship = start_object

/obj/structure/base_projectile/touch_map_edge()
	// In case the proc is called normally alongside the call in Move()
	if(loc == overmap_missile)
		return

	for(var/obj/item/projectile_equipment/E in equipment)
		E.on_touch_map_edge(overmap_missile)

	if(overmap_missile.dangerous)
		log_and_message_admins("A dangerous missile has entered the overmap (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[overmap_missile.x];Y=[overmap_missile.y];Z=[overmap_missile.z]'>JMP</a>)")

	// Abort walk
	walk(src, 0)
	forceMove(overmap_missile)
	overmap_missile.set_moving(TRUE)

/obj/structure/base_projectile/Move()
	. = ..()
	update_bounds()

	// for some reason, touch_map_edge doesn't always trigger like it should
	// this ensures that it does

	if(x < TRANSITIONEDGE || x > world.maxx - TRANSITIONEDGE || y < TRANSITIONEDGE || y > world.maxy - TRANSITIONEDGE)
		touch_map_edge()

/obj/structure/base_projectile/proc/enter_level(var/z_level)
	overmap_missile.set_moving(FALSE)

	var/heading = overmap_missile.dir
	if(!heading)
		heading = random_dir() // To prevent the missile from popping into the middle of the map and sitting there

	var/start_x = 0
	var/start_y = 0

	if(heading & WEST)
		start_x = world.maxx - TRANSITIONEDGE - 2
	else if(heading & EAST)
		start_x = TRANSITIONEDGE + 2
	else
		start_x = Floor(world.maxx / 2) + rand(-10, 10)

	if(heading & NORTH)
		start_y = TRANSITIONEDGE + 2
	else if(heading & SOUTH)
		start_y = world.maxy - TRANSITIONEDGE - 2
	else
		start_y = Floor(world.maxy / 2) + rand(-10, 10)

	var/turf/start = locate(start_x, start_y, z_level)

	if(overmap_missile.dangerous)
		log_and_message_admins("A dangerous missile has entered z level [z_level] (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)")
	forceMove(start)
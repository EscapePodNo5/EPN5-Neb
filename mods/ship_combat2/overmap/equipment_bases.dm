/obj/item/projectile_equipment//The base missile_equipment thing.
	name = "missile equipment"
	desc = "an advanced piece of military tech that does stuff for the missile it's fitted in"
	icon = 'mods/ship_combat2/icons/missile_equipment.dmi'
	icon_state = "equipment"

	var/next_work = 0
	var/cooldown = 10
	var/mass = 1 //Metric ton. Used to calculate the total mass of the missile
	var/obj/structure/base_projectile/missile/missile //The missile we're inside of.
	var/threat //Used for calculating just how threatening a missile is. Generally, the more equipment, the more capable a missile is - and thus, the higher the threat level. PDCs, can, of course, be fooled by decoys.

/obj/item/projectile_equipment/Destroy()
	. = ..()
	missile = null

// Called when the missile containing this equipment is activated
/obj/item/projectile_equipment/proc/on_missile_activated(var/obj/effect/overmap/projectile/P)
	return

// Called when the overmap projectile processes
/obj/item/projectile_equipment/proc/do_overmap_work(var/obj/effect/overmap/projectile/P)
	if(world.time < next_work)
		return 0
	next_work = world.time + cooldown
	return 1

// Called before the missile enters the overmap (before the active check, so you have a chance to remove stuff that shouldn't be qdeleted)
/obj/item/projectile_equipment/proc/on_touch_map_edge(var/obj/effect/overmap/projectile/P)
	return

// Called to determine if the missile should attempt to enter a level even if it's not in space
/obj/item/projectile_equipment/proc/should_enter(var/obj/effect/overmap/O)
	return FALSE

// Called when the missile enters a new Z level. Return a list of XY coordinates to set a target for the missile
/obj/item/projectile_equipment/proc/on_enter_level(var/z_level)
	return null

// Called by the missile when it detonates
/obj/item/projectile_equipment/proc/on_trigger(var/atom/triggerer)
	return

/obj/item/projectile_equipment/proc/on_install()
	return

//Payload base.
// Destroys missiles that are traveling on the overmap
/obj/item/projectile_equipment/payload
	name = "missile payload"
	desc = "dangerous equipment!!"

/obj/item/projectile_equipment/payload/on_missile_activated(var/obj/effect/overmap/projectile/P)
	P.set_dangerous(TRUE)
	P.set_enter_zs(TRUE)

/obj/item/projectile_equipment/payload/on_trigger()
	qdel(loc)

//Thruster bases.

/obj/item/projectile_equipment/thruster
	name = "missile booster"
	desc = "A relatively simple but capable missile booster stage, the range is not particularly spectacular."
	icon_state = "dumbfire"

	cooldown = 5

	var/fuel = 60 // how many times can the engine do work until its out of fuel
	var/fuel_mass = 5 //Used to calculate the total mass of the missile. This is in tons
	var/thrust = 2

/obj/item/projectile_equipment/thruster/do_overmap_work(var/obj/effect/overmap/projectile/P)
	if(!..() || isnull(P.target_x) || isnull(P.target_x) || !fuel)
		return 0

	var/turf/T = locate(P.target_x,P.target_y,GLOB.using_map.overmap_z)
	var/direction = get_dir(P.loc, T)
	var/speed = P.get_speed()
	var/heading = P.get_heading()
	var/did_work = FALSE

	if (speed > P.speedlimit)
		P.decelerate()
		did_work = TRUE
	// Heading does not match direction
	else if (heading & ~direction)
		P.accelerate(turn(heading & ~direction, 180), P.accellimit)
		did_work = TRUE
		// All other cases, move toward direction
	else if (speed + thrust <= P.speedlimit)
		P.accelerate(direction, P.accellimit)
		did_work = TRUE

	if(did_work)
		fuel--
	return 1

/obj/item/projectile_equipment/thruster/should_enter(var/obj/effect/overmap/visitable/O)
	if(O == missile.overmap_missile.target)
		return TRUE
	return FALSE

/obj/item/projectile_equipment/thruster/proc/is_target_valid(var/obj/effect/overmap/visitable/O)
	return ((O.sector_flags & OVERMAP_SECTOR_IN_SPACE) && !(O.sector_flags & OVERMAP_SECTOR_UNTARGETABLE) && LAZYLEN(O.map_z))
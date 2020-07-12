/*
	welcome to space war kiddo
	These are overmap capable missiles. Upon being activated, they appear on the overmap and travel along it until it enters a tile with associated z levels.
	Then it appears on the z level and travels on it. Maybe it hits something, maybe not. When it hits the z level edge, it'll disappear into the overmap again.
	The missiles are intended to be very modular, and thus do very little on their own except for handling the missile-overmap object interaction and calling appropriate procs on the missile equipment contained inside.
	Also note that while they're called missiles, it's a bit of a misleading name since the missile behavior is almost wholly determined by what equipment it has.
	Check equipment/missile_equipment.dm for more info.
*/

/obj/structure/base_projectile/missile
	name = "intergalactic missile"
	desc = "big scary missile that boom boom the ship. go open an issue for having seen this."
	icon = 'mods/ship_combat2/icons/bigmissile.dmi'
	icon_state = "base"

	density = 1
	w_class = ITEM_SIZE_HUGE
	dir = WEST
	does_spin = FALSE

	projectile_type = PROJECTILE_TYPE_MISSILE
	var/maintenance_hatch_open = FALSE
	var/active = FALSE

/obj/structure/base_projectile/missile/examine(mob/user)
	. = ..()
	if(LAZYLEN(equipment))
		to_chat(user, SPAN_NOTICE("It has these modules mounted:"))
	for(var/obj/item/projectile_equipment/E in equipment)
		to_chat(user, SPAN_NOTICE("\icon[E] [E.name]"))
	if(active)
		to_chat(user,SPAN_DANGER("A status light indicates that it is armed."))

/obj/structure/base_projectile/missile/proc/get_additional_info()
	var/list/info = list("Detected components:<ul>")
	for(var/obj/item/projectile_equipment/E in equipment)
		info += ("<li>" + E.name)
	info += "</ul>"
	return JOINTEXT(info)

/obj/structure/base_projectile/missile/update_bounds()
	if(dir in list(EAST, WEST))
		bound_width = 2 * world.icon_size
		bound_height = world.icon_size
	else
		bound_width = world.icon_size
		bound_height = 2 * world.icon_size

/obj/structure/base_projectile/missile/Initialize()
	. = ..()

	for(var/i = 1; i <= LAZYLEN(equipment); i++)
		var/path = equipment[i]
		equipment[i] = new path(src)

	for(var/obj/item/projectile_equipment/E in equipment)
		E.missile = src

	update_bounds()
	update_icon()

/obj/structure/base_projectile/missile/Destroy()
	. = ..()

	walk(src, 0)
	for(var/obj/item/projectile_equipment/E in equipment)
		E.missile = null

	QDEL_NULL_LIST(equipment)

/obj/structure/base_projectile/missile/Bump(var/atom/obstacle)
	..()
	detonate(obstacle)


/obj/structure/base_projectile/missile/attackby(var/obj/item/I, var/mob/user)
	if(!active && isMultitool(I))
		if(activate())
			if(overmap_missile.dangerous)
				log_and_message_admins("[key_name(user)] has armed a dangerous missile at ([x],[y],[z]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)")
			src.visible_message(SPAN_WARNING("\The [src] beeps. It's armed!"))
			playsound(src, 'sound/effects/alert.ogg', 50, 0, 0)
			return

	if(isScrewdriver(I))
		maintenance_hatch_open = !maintenance_hatch_open
		to_chat(user, "You [maintenance_hatch_open ? "open" : "close"] the maintenance hatch of \the [src].")

		update_icon()
		return

	if(maintenance_hatch_open)
		if(istype(I, /obj/item/projectile_equipment))
			var/obj/item/projectile_equipment/E = I

			if(!user.unEquip(E, src))
				return
			equipment += E
			E.missile = src
			to_chat(user, "You install \the [E] into \the [src].")
			E.on_install()

			update_icon()
			return

		if(isCrowbar(I))
			var/obj/item/projectile_equipment/removed_component = input("Which component would you like to remove?") as null|obj in equipment
			if(removed_component)
				to_chat(user, "You remove \the [removed_component] from \the [src].")
				user.put_in_hands(removed_component)
				equipment -= removed_component
				removed_component.missile = null

				update_icon()
			return

	..()

/obj/structure/base_projectile/missile/on_update_icon()
	overlays.Cut()

	for(var/obj/item/projectile_equipment/E in equipment)
		overlays += E.icon_state
	overlays += "panel[maintenance_hatch_open ? "_open" : ""]"

// primes the missile and puts it on the overmap
/obj/structure/base_projectile/missile/activate()
	..()
	active = TRUE
	if(active)
		return 0

	for(var/obj/item/projectile_equipment/E in equipment)
		E.on_missile_activated(overmap_missile)

	return 1

/obj/structure/base_projectile/missile/proc/detonate(var/atom/obstacle)
	if(!active)
		return

	// missile equipment triggers before the missile itself
	for(var/obj/item/projectile_equipment/E in equipment)
		E.on_trigger(obstacle)

	// stop moving
	walk(src, 0)
	active = FALSE
	qdel(src)

// Figure out where to pop in and set the missile flying
/obj/structure/base_projectile/missile/enter_level(var/z_level)
	..()

	var/heading = overmap_missile.dir
	if(!heading)
		heading = random_dir() // To prevent the missile from popping into the middle of the map and sitting there

	// let missile equipment decide a target
	var/list/goal_coords = null
	for(var/obj/item/projectile_equipment/E in equipment)
		var/list/coords = E.on_enter_level(z_level)
		if(coords)
			goal_coords = coords
			break

	// if a piece of equipment gave us a target, move towards that
	if(!isnull(goal_coords))
		var/turf/goal = locate(goal_coords[1], goal_coords[2], z_level)
		if(goal)
			walk_towards(src, goal, 1)
			return

	walk(src, heading, 1)

/obj/structure/base_projectile/missile/proc/has_iff()
	for(var/obj/item/projectile_equipment/E in equipment)
		if(istype(E, /obj/item/projectile_equipment/iff))
			return TRUE
		else
			continue

/obj/structure/base_projectile/missile/proc/get_iff_code()
	if(!has_iff())
		return

	for(var/obj/item/projectile_equipment/iff/E in equipment)
		return E.iff_code

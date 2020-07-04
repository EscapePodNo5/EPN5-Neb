/obj/machinery/point_defense/point_defense_cannon
	name = "point defense cannon"
	desc = "A massive point defense cannon designed to intercept missiles."
	icon_state = "turret_loaded"

	var/obj/machinery/point_defense/point_defense_computer/mainframe
	var/obj/machinery/point_defense/ammo_storage

	var/range = 35 //tiles
	var/cooldown = 1 SECOND
	var/last_fired
	var/base_miss_chance = 0
	var/rotation_speed = 0.25 SECONDS
	var/intercepting = FALSE

	id_tag = "test"

/obj/machinery/point_defense/point_defense_cannon/proc/scan_for_targets()
	for(var/obj/structure/missile/M in view(range))
		if(!istype(M, /obj/structure/missile))
			return

		var/obj/structure/missile/IM = M

		if(!IM.active)
			return
		if(IM.has_iff())
			var/missile_iff = IM.get_iff_code()

			if(missile_iff == mainframe.iff_code)
				continue //This is one of our missiles (or the enemy has figured out our IFF codes), so, we ignore it.

/obj/machinery/point_defense/point_defense_cannon/proc/space_los(var/target)
	for(var/turf/T in getline(src,target))
		if(T.density)
			return FALSE
	return TRUE

/obj/machinery/point_defense/point_defense_cannon/proc/intercept(var/obj/structure/missile/M)
	if(inoperable()) //Broken or no power.
		return

	if(!space_los(M))
		return //No line of sight!

	if(world.time < last_fired + cooldown)
		return //Cooldown is in effect.

	if(mainframe.sensor_integrity == 0) //Sensors are offline, PDCs can not target anything.
		return

	if(intercepting)
		return

	intercepting = TRUE

	var/miss_chance = mainframe.get_miss_chance()
	var/missed_target = prob(miss_chance)


	var/Angle = round(Get_Angle(src,M))
	var/matrix/rot_matrix = matrix()
	rot_matrix.Turn(Angle)
	addtimer(CALLBACK(src, .proc/finish_intercept, M, missed_target), rotation_speed)
	animate(src, transform = rot_matrix, rotation_speed, easing = SINE_EASING)

	set_dir(transform.get_angle() > 0 ? NORTH : SOUTH)


	last_fired = world.time


/obj/machinery/point_defense/point_defense_cannon/proc/finish_intercept(var/obj/structure/missile/M, miss_chance)
	var/bullet_stagger_time = 0

	var/list/turfs_around_target = list()
	var/missed_target = prob(miss_chance)
	var/shot_amount = rand(1, 12)

	for(var/turf/T in orange(2, M))
		turfs_around_target += T

	for(var/i = 1; i <= shot_amount; i++)
		var/turf/T = pick(turfs_around_target) //Grab a target to yeet a bullet at.
		addtimer(CALLBACK(src, .proc/do_bullet, T), bullet_stagger_time SECONDS)
		bullet_stagger_time += 0.2
		if(i == shot_amount)
			intercepting = FALSE

	if(!missed_target)
		M.detonate()

/obj/machinery/point_defense/point_defense_cannon/proc/do_bullet(var/turf/T) //This is it's own proc so we can stagger it.
		var/obj/item/projectile/bullet/rifle/B = new(get_turf(src)) //Make a new bullet.
		B.launch(T)//YEET
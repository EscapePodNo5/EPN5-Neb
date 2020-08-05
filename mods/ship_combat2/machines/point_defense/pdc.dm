/obj/machinery/point_defense/point_defense_cannon
	name = "point defense cannon"
	desc = "A massive point defense cannon designed to intercept missiles."
	icon_state = "turret_loaded"

	var/obj/machinery/point_defense/point_defense_computer/mainframe
	var/obj/machinery/point_defense/ammo_storage/storage

	var/range = 35 //tiles
	var/cooldown = 1 SECOND
	var/last_fired
	var/base_miss_chance = 0
	var/rotation_speed = 0.25 SECONDS
	var/intercepting = FALSE
	var/can_assess_threat = FALSE //PDC system is 2dumb to figure out how threatening a missile is.
	var/dispersion = 3 //What our bullet spread is - this gets smaller as the missile gets closer.

	var/working_sound = 'mods/ship_combat2/sounds/pdc_loop.ogg'
	var/datum/sound_token/sound_token
	var/sound_id

	var/dispersion_datum_type = /datum/pdc_dispersion_datum/normal //We use subtypesof to grab all our target datums.
	var/dispersion_list = list() //Handled in initialize

	var/list/target_list = list() //List of potential targets, iterated over so PDCs target the one with the highest threat.

	id_tag = "test"


/obj/machinery/point_defense/point_defense_cannon/Initialize()
	..()

	for(var/D in subtypesof(dispersion_datum_type)) //Generate our dispersion list.
		var/datum/pdc_dispersion_datum/S = new D
		dispersion_list += S

/obj/machinery/point_defense/point_defense_cannon/Destroy()
	. = ..()
	mainframe.pdcs -= src
	storage.pdc = null

/obj/machinery/point_defense/point_defense_cannon/proc/update_sound()
	if(!working_sound)
		return
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/obj/machinery/computer/ship/sensors)]"
	if(intercepting)
		var/volume = 15
		if(!sound_token)
			sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, working_sound, volume = volume, range = 10)
		sound_token.SetVolume(volume)
	else if(sound_token)
		QDEL_NULL(sound_token)

/obj/machinery/point_defense/point_defense_cannon/proc/scan_for_targets()
	for(var/obj/structure/base_projectile/missile/M in view(range))
		if(!istype(M, /obj/structure/base_projectile/missile))
			return

		var/obj/structure/base_projectile/missile/IM = M

		if(!IM.active)
			return
		if(IM.has_iff())
			var/missile_iff = IM.get_iff_code()

			if(missile_iff == mainframe.iff_code)
				continue //This is one of our missiles (or the enemy has figured out our IFF codes), so, we ignore it.

/obj/machinery/point_defense/point_defense_cannon/proc/get_sensor_loss_dispersion() //If we've lost sensors on the mainframe, accuracy suffers considerably.
	var/sensor_strength = mainframe.sensor_integrity

	if(sensor_strength == 100)
		return

	if(sensor_strength <= 75)
		return 1

	if(sensor_strength <= 50)
		return 2

	if(sensor_strength <= 25)
		return 3

/obj/machinery/point_defense/point_defense_cannon/proc/space_los(var/target)
	for(var/turf/T in getline(src,target))
		if(T.density)
			return FALSE
	return TRUE

/obj/machinery/point_defense/point_defense_cannon/proc/switch_dispersion(var/obj/O)
	var/dist = get_dist(src, O)

	for(var/datum/pdc_dispersion_datum/D in dispersion_list)
		var/datum/pdc_dispersion_datum/S = D
		if(dist <= S.distance)
			dispersion = S.spread

/obj/machinery/point_defense/point_defense_cannon/proc/intercept(var/obj/structure/base_projectile/missile/M)
	if(inoperable()) //Broken or no power.
		return

	if(!space_los(M))
		return //No line of sight!

	if(world.time < last_fired + cooldown)
		return //Cooldown is in effect.

	if(!mainframe)
		return //shit just got real, the mainframe's gone.

	if(mainframe.sensor_integrity == 0) //Sensors are offline, PDCs can not target anything.
		return

	if(intercepting)
		return

	intercepting = TRUE

	var/Angle = round(Get_Angle(src,M))
	var/matrix/rot_matrix = matrix()
	rot_matrix.Turn(Angle)
	addtimer(CALLBACK(src, .proc/finish_intercept, M), rotation_speed)
	animate(src, transform = rot_matrix, rotation_speed, easing = SINE_EASING)

	set_dir(transform.get_angle() > 0 ? NORTH : SOUTH)


	last_fired = world.time


/obj/machinery/point_defense/point_defense_cannon/proc/finish_intercept(var/obj/structure/base_projectile/missile/M, miss_chance)
	addtimer(CALLBACK(src, .proc/do_bullet, M), 1)


/obj/machinery/point_defense/point_defense_cannon/proc/do_bullet(var/obj/structure/base_projectile/missile/target) //This is it's own proc so we can stagger it.
	if(!target) //Target is null or destroyed.
		intercepting = FALSE
		return

	if(!intercepting)
		return

	if(!space_los(target))
		intercepting = FALSE
		return

	if(!storage)
		intercepting = FALSE
		return

	if(!storage.can_remove_ammo(1))
		intercepting = FALSE
		return

	switch_dispersion(target)

	storage.remove_ammo(1)

	dispersion += get_sensor_loss_dispersion()

	update_sound()
	var/Angle = round(Get_Angle(src,target))
	var/matrix/rot_matrix = matrix()
	rot_matrix.Turn(Angle)
	animate(src, transform = rot_matrix, 1, easing = SINE_EASING) //We want to always face our target.

	var/list/turfs_around_target = list()

	if(QDELETED(target))
		intercepting = FALSE
		return

	for(var/turf/T in orange(dispersion, target))
		turfs_around_target += T

	var/bullet_launch_loc = pick(turfs_around_target)

	var/obj/item/projectile/bullet/rifle/B = new(get_turf(src)) //Make a new bullet.
	B.step_delay = 0.2
	B.launch(bullet_launch_loc)//YEET
	addtimer(CALLBACK(src, .proc/do_bullet, target), 0.1 SECONDS) //Does this create a loop? Yes. The loop is only broken when the target is dead or intercepting is false.
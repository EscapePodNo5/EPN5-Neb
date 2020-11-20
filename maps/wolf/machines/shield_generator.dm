/obj/machinery/power/shield_generator/new_icon/
	icon = 'maps/wolf/icons/shieldgen32x32.dmi'
	icon_state = "shield_gen"
	var/width = 2


/obj/machinery/power/shield_generator/new_icon/Initialize()
	. = ..()
	SetBounds()

/obj/machinery/power/shield_generator/new_icon/on_update_icon()
	overlays.Cut()

	if(!overloaded)
		if(running == SHIELD_DISCHARGING)
			overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "shield_discharging")
		if(running == SHIELD_RUNNING)
			overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "shield_running")
		if(running == SHIELD_SPINNING_UP)
			overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "shield_spinning_up")

	if(overloaded)
		overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "shield_overloaded")

	if(current_energy >= max_energy)
		overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "power_overlay_100")
	if(current_energy >= (max_energy * 0.75))
		overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "power_overlay_75")
	if(current_energy >= (max_energy * 0.50))
		overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "power_overlay_50")
	if(current_energy <= (max_energy * 0.25))
		overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "power_overlay_25")

	if(powernet && (running > SHIELD_OFF) && !input_cut)
		overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "shield-charging")

	if(running > SHIELD_OFF)
		overlays += image('maps/wolf/icons/shieldgen32x32.dmi', "shield_active")

/obj/machinery/power/shield_generator/new_icon/proc/SetBounds()
	bound_width = width * world.icon_size
	bound_height = world.icon_size

/obj/machinery/power/shield_generator/new_icon/Process()
	..()
	update_icon()
	if(prob(10))
		shield_flicker()

/datum/map/wolf // setting the map to use this list
	security_state = /decl/security_state/default/wolf

//Torch map alert levels. Refer to security_state.dm.
/decl/security_state/default/wolf
	all_security_levels = list()


/decl/security_level/default/wolf/code_green
	name = "code green"

	light_max_bright = 0.25
	light_inner_range = 0.1
	light_outer_range = 1

	light_color_alarm = COLOR_GREEN
	light_color_status_display = COLOR_GREEN

	overlay_alarm = "alarm_green"
	overlay_status_display = "status_display_green"

	down_description = "All threats to the station have passed. Security may not have weapons visible, privacy laws are once again fully enforced."

/decl/security_level/default/code_blue
	name = "code blue"

	light_max_bright = 0.5
	light_inner_range = 0.1
	light_outer_range = 2
	light_color_alarm = COLOR_BLUE
	light_color_status_display = COLOR_BLUE

	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"

	up_description = "The station has received reliable information about possible hostile activity on the station. Security staff may have weapons visible, random searches are permitted."
	down_description = "The immediate threat has passed. Security may no longer have weapons drawn at all times, but may continue to have them visible. Random searches are still allowed."

/decl/security_level/default/code_red
	name = "code red"

	light_max_bright = 0.5
	light_inner_range = 0.1
	light_outer_range = 2
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_RED

	overlay_alarm = "alarm_red"
	overlay_status_display = "status_display_red"

	up_description = "There is an immediate serious threat to the station. Security may have weapons unholstered at all times. Random searches are allowed and advised."
	down_description = "The self-destruct mechanism has been deactivated, there is still however an immediate serious threat to the station. Security may have weapons unholstered at all times, random searches are allowed and advised."

/decl/security_level/default/code_delta
	name = "code delta"

	light_max_bright = 0.75
	light_inner_range = 0.1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_NAVY_BLUE

	overlay_alarm = "alarm_delta"
	overlay_status_display = "status_display_delta"

	var/static/datum/announcement/priority/security/security_announcement_delta = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/effects/siren.ogg'))

/decl/security_level/default/code_delta/switching_up_to()
	security_announcement_delta.Announce("The self-destruct mechanism has been engaged. All crew are instructed to obey all instructions given by heads of staff. Any violations of these orders can be punished by death. This is not a drill.", "Attention! Delta security level reached!")
	notify_station()
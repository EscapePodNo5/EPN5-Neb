
/datum/map/wolf // setting the map to use this list
	security_state = /decl/security_state/default/wolf

/decl/security_state/default/wolf
	all_security_levels = list(/decl/security_level/default/wolf/code_green, /decl/security_level/default/wolf/code_blue, /decl/security_level/default/wolf/code_orange, /decl/security_level/default/wolf/code_violet, /decl/security_level/default/wolf/code_red, /decl/security_level/default/wolf/code_delta)

/decl/security_level/default/wolf
	alarm_appearance = /datum/alarm_appearance/green

/decl/security_level/default/wolf/code_green
	name = "code green"

	light_max_bright = 0.25
	light_inner_range = 0.1
	light_outer_range = 1

	light_color_alarm = COLOR_GREEN
	light_color_status_display = COLOR_GREEN

	overlay_alarm = "alarm_green"
	overlay_status_display = "status_display_green"

	alarm_appearance = /datum/alarm_appearance/green

	down_description = "All threats to the ship have passed. Security may not have weapons visible, privacy laws are once again fully enforced."

/decl/security_level/default/wolf/code_blue
	name = "code blue"

	light_max_bright = 0.5
	light_inner_range = 0.1
	light_outer_range = 2
	light_color_alarm = COLOR_BLUE
	light_color_status_display = COLOR_BLUE

	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"

	alarm_appearance = /datum/alarm_appearance/blue

	up_description = "The station has received reliable information about possible hostile activity on the ship. Security staff may have weapons visible, random searches are permitted."
	down_description = "The immediate threat has passed. Security may no longer have weapons drawn at all times, but may continue to have them visible. Random searches are still allowed."

/decl/security_level/default/wolf/code_orange
	name = "code orange"

	light_max_bright = 0.5
	light_inner_range = 0.1
	light_outer_range = 2
	light_color_alarm = COLOR_ORANGE
	light_color_status_display = COLOR_ORANGE

	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"

	alarm_appearance = /datum/alarm_appearance/orange

	up_description = "A major Engineering emergency has developed; all crew are to follow orders given by engineering personnel at all times and assist in any way."
	down_description = "The previously developed emergency has been contained. All crew return to normal operating proceedures."

/decl/security_level/default/wolf/code_violet
	name = "code violet"

	light_max_bright = 0.5
	light_inner_range = 0.1
	light_outer_range = 2
	light_color_alarm = COLOR_VIOLET
	light_color_status_display = COLOR_VIOLET

	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"

	alarm_appearance = /datum/alarm_appearance/violet

	up_description = "A major Medical emergency has developed; all crew are to follow orders given by Medical personnel at all times and assist in any way."
	down_description = "The previously developed emergency has been contained. All crew return to normal operating proceedures."

/decl/security_level/default/wolf/code_red
	name = "code red"

	light_max_bright = 0.5
	light_inner_range = 0.1
	light_outer_range = 2
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_RED

	overlay_alarm = "alarm_red"
	overlay_status_display = "status_display_red"

	alarm_appearance = /datum/alarm_appearance/red

	up_description = "There is an immediate serious threat to the ship. Security may have weapons unholstered at all times. Random searches are allowed and advised."
	down_description = "The self-destruct mechanism has been deactivated, there is still however an immediate serious threat to the ship. Security may have weapons unholstered at all times, random searches are allowed and advised."

/decl/security_level/default/wolf/code_delta
	name = "code delta"

	light_max_bright = 0.75
	light_inner_range = 0.1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_NAVY_BLUE

	alarm_appearance = /datum/alarm_appearance/delta

	overlay_alarm = "alarm_delta"
	overlay_status_display = "status_display_delta"

	var/static/datum/announcement/priority/security/security_announcement_delta = new(do_log = 0, do_newscast = 1, new_sound = sound('maps/wolf/sounds/delta.ogg'))

/decl/security_level/default/wolf/code_delta/switching_up_to()
	security_announcement_delta.Announce("The self-destruct mechanism has been engaged. All crew are instructed to obey all instructions given by heads of staff. Any violations of these orders can be punished by death. This is not a drill.", "Attention! Delta security level reached!")
	notify_station()

/datum/alarm_appearance/orange
	display_icon = "status_display_lines"
	display_icon_color = COLOR_ORANGE

	display_emblem = "status_display_alert"
	display_emblem_color = COLOR_WHITE

	alarm_icon = "alarm_normal"
	alarm_icon_color = COLOR_ORANGE

/datum/alarm_appearance/violet
	display_icon = "status_display_lines"
	display_icon_color = COLOR_VIOLET

	display_emblem = "status_display_alert"
	display_emblem_color = COLOR_WHITE

	alarm_icon = "alarm_normal"
	alarm_icon_color = COLOR_VIOLET
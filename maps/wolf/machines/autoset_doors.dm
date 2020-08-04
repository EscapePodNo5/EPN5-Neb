/obj/machinery/door/airlock/autoname/wolf/

/obj/machinery/door/airlock/autoname/wolf/mining
	door_color = COLOR_PALE_ORANGE
	stripe_color = COLOR_BEASTY_BROWN

/obj/machinery/door/airlock/autoname/wolf/command
	door_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/autoname/wolf/security
	door_color = COLOR_NT_RED

/obj/machinery/door/airlock/autoname/wolf/security/research
	door_color = COLOR_WHITE
	stripe_color = COLOR_NT_RED

/obj/machinery/door/airlock/autoname/wolf/medical
	door_color = COLOR_WHITE
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/autoname/wolf/virology
	door_color = COLOR_WHITE
	stripe_color = COLOR_GREEN

/obj/machinery/door/airlock/autoname/wolf/atmos
	door_color = COLOR_AMBER
	stripe_color = COLOR_CYAN

/obj/machinery/door/airlock/autoname/wolf/research
	door_color = COLOR_WHITE
	stripe_color = COLOR_BOTTLE_GREEN

/obj/machinery/door/airlock/autoname/wolf/science
	door_color = COLOR_WHITE
	stripe_color = COLOR_VIOLET

/obj/machinery/door/airlock/autoname/wolf/sol
	door_color = COLOR_BLUE_GRAY

/obj/machinery/door/airlock/autoname/wolf/civilian
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/autoname/wolf/chaplain
	stripe_color = COLOR_GRAY20

/obj/machinery/door/airlock/autoname/wolf/engineering
	door_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/wolf/maintenance
	stripe_color = COLOR_AMBER

// Glass airlock presets

/obj/machinery/door/airlock/autoname/wolf/glass
	name = "Glass Airlock"
	icon_state = "preview_glass"
	hitsound = 'sound/effects/Glasshit.ogg'
	maxhealth = 300
	explosion_resistance = 5
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/autoname/wolf/glass/command
	door_color = COLOR_COMMAND_BLUE
	stripe_color = COLOR_SKY_BLUE

/obj/machinery/door/airlock/autoname/wolf/glass/security
	door_color = COLOR_NT_RED
	stripe_color = COLOR_ORANGE

/obj/machinery/door/airlock/autoname/wolf/glass/engineering
	door_color = COLOR_AMBER
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/autoname/wolf/glass/medical
	door_color = COLOR_WHITE
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/autoname/wolf/glass/mining
	door_color = COLOR_PALE_ORANGE
	stripe_color = COLOR_BEASTY_BROWN

/obj/machinery/door/airlock/autoname/wolf/glass/atmos
	door_color = COLOR_AMBER
	stripe_color = COLOR_CYAN

/obj/machinery/door/airlock/autoname/wolf/glass/research
	door_color = COLOR_WHITE
	stripe_color = COLOR_RESEARCH

/obj/machinery/door/airlock/autoname/wolf/glass/science
	door_color = COLOR_WHITE
	stripe_color = COLOR_VIOLET

/obj/machinery/door/airlock/autoname/wolf/glass/sol
	door_color = COLOR_BLUE_GRAY
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/wolf/glass/freezer
	door_color = COLOR_WHITE

/obj/machinery/door/airlock/autoname/wolf/glass/civilian
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/autoname/wolf/glass/mining
	door_color = COLOR_PALE_ORANGE
	stripe_color = COLOR_BEASTY_BROWN

/obj/machinery/door/airlock/autoname/wolf/glass/engineering
	door_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/wolf/glass/hydroponic
	door_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/hatch/autoname/wolf

/obj/machinery/door/airlock/hatch/autoname/wolf/Initialize()
	. = ..()
	var/area/A = get_area(src)
	SetName("[A.name]")

/obj/machinery/door/airlock/hatch/autoname/wolf/general
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/hatch/autoname/wolf/maintenance
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/wolf/command
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/hatch/autoname/wolf/engineering
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/wolf/science
	stripe_color = COLOR_PURPLE
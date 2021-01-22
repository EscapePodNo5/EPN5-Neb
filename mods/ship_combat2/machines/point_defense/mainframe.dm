/obj/machinery/point_defense
	icon = 'mods/ship_combat2/icons/pointdefensemainframe.dmi'

/obj/machinery/point_defense/point_defense_computer
	name = "point defense mainframe"
	desc = "A complicated, large computer that provides rapid targeting for point defense cannons."
	icon_state = "pdc_mainframe"

	var/list/sensors = list() //Our sensors, generally used for measuring integrity of the PDC network.
	var/list/pdcs = list() //Our point defense cannons. They're added in the Initialize() call.

	var/max_shots
	var/shots_left
	var/sensor_integrity = 100 //This also fucks with targeting accuracy.
	var/initial_sensors = 0 //num. Basically used to calculate the health of the sensor network.
	var/iff_code //The IFF code for the ship.

	id_tag = "test"

/obj/machinery/point_defense/point_defense_computer/Initialize()
	for(var/obj/machinery/point_defense/point_defense_cannon/C in SSmachines.machinery)
		if(C.id_tag == id_tag)
			pdcs += C
			C.mainframe = src

	for(var/obj/machinery/point_defense/point_defense_sensor/S in SSmachines.machinery)
		if(S.id_tag == id_tag)
			sensors += S
			S.mainframe = src

	initial_sensors = sensors.len //Set initial_sensors for sensor health comparison. As long as every sensor in the list reports that it's online, sensor integrity is fine.

	update_sensor_status()

	update_icon()
	..()

/obj/machinery/point_defense/point_defense_computer/Destroy()
	. = ..()
	for(var/obj/machinery/point_defense/point_defense_sensor/M in sensors)
		M.mainframe = null
	for(var/obj/machinery/point_defense/point_defense_cannon/pdc in sensors)
		pdc.mainframe = null


/obj/machinery/point_defense/point_defense_computer/Process()
	if(inoperable()) //Broken or no power.
		return
	update_sensor_status()

	update_icon()

/obj/machinery/point_defense/point_defense_computer/on_update_icon()
	overlays.Cut()
	if(stat & (BROKEN|NOPOWER))
		overlays.Cut()
		return
	if(sensor_integrity <= 0)
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "mim_status_offline")
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "pdc_screen_offline")

	if(sensor_integrity <= 25)
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "mim_status_25")
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "pdc_screen_alert")

	if(sensor_integrity <= 50)
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "mim_status_50")
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "pdc_screen_caution")

	if(sensor_integrity <= 75)
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "mim_status_75")
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "pdc_screen_norm")

	if(sensor_integrity == 100)
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "mim_status_100")
		overlays += image('mods/ship_combat2/icons/pointdefensemainframe.dmi', "pdc_screen_norm")

/obj/machinery/point_defense/point_defense_computer/proc/update_sensor_status()
	var/operable_sensors = 0
	for(var/obj/machinery/point_defense/point_defense_sensor/S in sensors)
		if(!S.report_status())
			continue
		operable_sensors++

	if(!operable_sensors) //no div by zero errors pls, just stop here.
		sensor_integrity = 0
		return

	if(operable_sensors != initial_sensors) //Uh oh. Something's broken or unpowered.
		sensor_integrity = round((initial_sensors/operable_sensors)*100)

/obj/machinery/point_defense/point_defense_computer/proc/get_miss_chance()
	if(sensor_integrity == 100)
		return 0 //No extra miss chance.
	else
		var/extra_miss_chance = (100-sensor_integrity) / 2
		return extra_miss_chance

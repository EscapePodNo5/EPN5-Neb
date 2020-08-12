///I'm actually too lazy to mapedit this shit
//Too bad!

//This loops through a tile's contents and sets everything - used universally for sensors, computers, injectors and output vents.
/obj/effect/landmark/atmos_config
	name = "atmos config landmark"
	var/comp_name
	var/comp_id_tag
	var/input_tag
	var/output_tag
	var/sensor_tag
	var/sensor_name

/obj/effect/landmark/atmos_config/Initialize()
	var/turf/T = get_turf(src)

	for(var/obj/machinery/atmospherics/unary/outlet_injector/O in T)
		O.id_tag = input_tag

	for(var/obj/machinery/computer/air_control/AC in T)
		AC.id_tag = comp_id_tag
		AC.input_tag = input_tag
		AC.output_tag = output_tag
		AC.sensor_tag = sensor_tag
		AC.sensor_name = sensor_name
		AC.name = comp_name

	for(var/obj/machinery/atmospherics/unary/vent_pump/siphon/on/atmos/V in T)
		V.id_tag = output_tag

	for(var/obj/machinery/air_sensor/dist/tank/S in T)
		S.id_tag = sensor_tag

	..()
	return INITIALIZE_HINT_QDEL

//OXYGEN TANK
/obj/effect/landmark/atmos_config/oxygen
	name = "oxygen config landmark"
	comp_name = "oxygen tank control"
	comp_id_tag = "oxygen_comp"
	input_tag = "oxygen_tank_input"
	output_tag = "oxygen_tank_output"
	sensor_tag = "oxygen_tank_sensor"
	sensor_name = "O2 Tank"

//NITROGEN TANK
/obj/effect/landmark/atmos_config/nitrogen
	name = "nitrogen config landmark"
	comp_name = "nitrogen tank control"
	comp_id_tag = "nitrogen_comp"
	input_tag = "nitrogen_tank_input"
	output_tag = "nitrogen_tank_output"
	sensor_tag = "nitrogen_tank_sensor"
	sensor_name = "N2 Tank"

//HYDROGEN TANK (in atmos)
/obj/effect/landmark/atmos_config/hydrogen
	name = "hydrogen config landmark"
	comp_name = "hydrogen tank control"
	comp_id_tag = "hydrogen_comp"
	input_tag = "hydrogen_tank_input"
	output_tag = "hydrogen_tank_output"
	sensor_tag = "hydrogen_tank_sensor"
	sensor_name = "H2 Tank"

//CO2 TANK
/obj/effect/landmark/atmos_config/co2
	name = "co2 config landmark"
	comp_name = "carbon dioxide tank control"
	comp_id_tag = "co2_comp"
	input_tag = "co2_tank_input"
	output_tag = "co2_tank_output"
	sensor_tag = "co2_tank_sensor"
	sensor_name = "CO2 Tank"

//MIXED AIR TANK
/obj/effect/landmark/atmos_config/air
	name = "air config landmark"
	comp_name = "air tank control"
	comp_id_tag = "air_comp"
	input_tag = "air_tank_input"
	output_tag = "air_tank_output"
	sensor_tag = "air_tank_sensor"
	sensor_name = "Mixed Air Tank"

/obj/effect/landmark/atmos_config/reactor_h2
	name = "engine hydrogen injection landmark"
	comp_name = "reactor hydrogen control"
	comp_id_tag = "reactor_comp"
	input_tag = "reactor_input"
	sensor_tag = "reactor_sensor"
	sensor_name = "Reactor Core"

/obj/effect/landmark/atmos_config/propellant
	name = "propellant tank landmark"
	comp_name = "propellant tank control"
	comp_id_tag = "propellant_tank"
	input_tag = "propellant_input"
	output_tag = "propellant_output"
	sensor_tag = "propellant_sensor"
	sensor_name = "Propellant Tank"

/obj/effect/landmark/atmos_config/engine_hydrogen
	name = "engine hydrogen tank landmark"
	comp_name = "reactor hydrogen storage control"
	comp_id_tag = "reactor_hydrogen"
	input_tag = "engine_hydrogen_input"
	output_tag = "engine_hydrogen_output"
	sensor_tag = "engine_hydrogen_sensor"
	sensor_name = "Reactor H2 Tank"
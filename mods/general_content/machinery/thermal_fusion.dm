//#define MAX_THERMAL_CORE_TEMP 20000

#define SURFACE_AREA_TORUS(inner_radius, outer_radius) (4*(3.14**2)*(outer_radius*inner_radius))

#define FUSION_ENERGY_PER_K        20
#define FUSION_INSTABILITY_DIVISOR 50000
#define FUSION_RUPTURE_THRESHOLD   10000
#define FUSION_REACTANT_CAP        10000

/obj/machinery/power/fusion_core/thermal
	name = "\improper R-UST Mk. 9T Tokamak core"
	desc = "A variant of the Mark 8 Core, the Mark 9T eschews the classic kinetic energy harvester and instead lets an atmosphere interact with the fusion field itself - producing heat."


/obj/effect/fusion_em_field/thermal
	var/thermal_release_modifier = 2500		//Higher == more heat released during reaction
	var/radiation_release_modifier = 2      //Higher == more radiation released with more power.
	var/reaction_power_modifier =  0.2			//Higher == more overall power
	var/gasefficency = 0.25
	var/decay_factor = 500
	var/debug

/obj/machinery/power/fusion_core/thermal/Startup()
	if(owned_field)
		return
	owned_field = new /obj/effect/fusion_em_field/thermal(loc, src)
	owned_field.ChangeFieldStrength(field_strength)
	icon_state = "core1"
	update_use_power(POWER_USE_ACTIVE)
	. = 1

/obj/effect/fusion_em_field/thermal/Process() //This has to be a complete overwrite of the process() call because of how the EM field handles things.
	//make sure the field generator is still intact
	if(!owned_core || QDELETED(owned_core))
		qdel(src)
		return

	// Take some gas up from our environment.
	var/added_particles = FALSE
	var/datum/gas_mixture/uptake_gas = owned_core.loc.return_air()
	if(uptake_gas)
		uptake_gas = uptake_gas.remove_by_flag(MAT_FLAG_FUSION_FUEL, rand(50,100), TRUE)
	if(uptake_gas && uptake_gas.total_moles)
		for(var/gasname in uptake_gas.gas)
			if(uptake_gas.gas[gasname]*10 > reactants[gasname])
				AddParticles(gasname, uptake_gas.gas[gasname]*10)
				uptake_gas.adjust_gas(gasname, -(uptake_gas.gas[gasname]), update=FALSE)
				added_particles = TRUE
		if(added_particles)
			uptake_gas.update_values()

	//let the particles inside the field react
	React()

	// Energy decay.
	if(plasma_temperature >= 1)
		var/lost = plasma_temperature*0.01
		radiation += lost
		plasma_temperature -= lost

	//handle some reactants formatting
	for(var/reactant in reactants)
		var/amount = reactants[reactant]
		if(amount < 1)
			reactants.Remove(reactant)
		else if(amount >= FUSION_REACTANT_CAP)
			var/radiate = rand(3 * amount / 4, amount / 4)
			reactants[reactant] -= radiate
			radiation += radiate

	var/use_range
	var/use_power
	if(plasma_temperature <= 6000)
		use_range = light_min_range
		use_power = light_min_power
	else if(plasma_temperature >= 25000)
		use_range = light_max_range
		use_power = light_max_power
	else
		var/temp_mod = ((plasma_temperature-5000)/20000)
		use_range = light_min_range + ceil((light_max_range-light_min_range)*temp_mod)
		use_power = light_min_power + ceil((light_max_power-light_min_power)*temp_mod)

	if(last_range != use_range || last_power != use_power)
		set_light(min(use_power, 1), use_range / 6, use_range) //cap first arg at 1 to avoid breaking lighting stuff.
		last_range = use_range
		last_power = use_power

	check_instability()
	Radiate()
	return 1

/obj/effect/fusion_em_field/thermal/AddEnergy(var/a_energy, var/a_plasma_temperature)
	energy += a_energy
	plasma_temperature += a_plasma_temperature
	if(a_energy && percent_unstable > 0)
		percent_unstable -= a_energy/10000
		if(percent_unstable < 0)
			percent_unstable = 0
	if(energy >= 100)
		plasma_temperature += 5 * (energy / 5)

/obj/effect/fusion_em_field/thermal/Radiate() //Another overwrite, this time to play with the math regarding thermal output
	if(istype(loc, /turf))
		var/empsev = max(1, min(3, ceil(size/2)))
		for(var/atom/movable/AM in range(max(1,Floor(size/2)), loc))

			if(AM == src || AM == owned_core || !AM.simulated)
				continue

			var/skip_obstacle
			for(var/ignore_path in ignore_types)
				if(istype(AM, ignore_path))
					skip_obstacle = TRUE
					break
			if(skip_obstacle)
				continue

			AM.visible_message(SPAN_DANGER("The field buckles visibly around \the [AM]!"))
			tick_instability += rand(30,50)
			AM.emp_act(empsev)

	if(owned_core && owned_core.loc)
		var/datum/gas_mixture/removed = null
		var/datum/gas_mixture/env = null
		var/equilibrium_power = 250
		var/temp_factor

		if(!istype(loc, /turf/space))
			env = loc.return_air()
			removed = env.remove(gasefficency * env.total_moles)	//Remove gas from surrounding area


		temp_factor = ( (equilibrium_power/decay_factor)**3 )/800
		energy = max( (removed.temperature * temp_factor) * 1 + energy, 0)

		var/device_energy = energy * reaction_power_modifier

		var/thermal_power = thermal_release_modifier * device_energy
		if (debug)
			visible_message("[src]: Releasing [round(thermal_power)] W.")
			visible_message("[src]: energy: [energy].")
			visible_message("[src]: temp_factor: [temp_factor]")

		removed.add_thermal_energy(thermal_power)
		removed.temperature = between(0, removed.temperature, 10000)
		env.merge(removed)
		if(radiation)
			SSradiation.radiate(src, energy * radiation_release_modifier)
		energy -= (energy/decay_factor)**3		//energy losses due to radiation
	radiation = 0
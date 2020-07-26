//#define MAX_THERMAL_CORE_TEMP 20000

#define SURFACE_AREA_TORUS(inner_radius, outer_radius) (4*(3.14**2)*(outer_radius*inner_radius))

#define FUSION_ENERGY_PER_K        20
#define FUSION_INSTABILITY_DIVISOR 50000
#define FUSION_RUPTURE_THRESHOLD   10000
#define FUSION_REACTANT_CAP        10000

/obj/machinery/power/fusion_core/thermal
	name = "\improper R-UST Mk. 9T Tokamak core"
	desc = "A variant of the Mark 8 Core, the Mark 9T eschews the classic kinetic energy harvester and instead lets an atmosphere interact with the fusion field itself - producing heat."
	active_power_usage = 25000


/obj/effect/fusion_em_field/thermal
	var/thermal_release_modifier = 3500	//Higher == more heat released during reaction
	var/radiation_release_modifier = 2      //Higher == more radiation released with more power.
	var/reaction_power_modifier =  0.3			//Higher == more overall power
	var/gasefficency = 0.25
	var/decay_factor = 700
	var/debug
	var/list/heat_exchangers = list()


/obj/machinery/power/fusion_core/thermal/Startup()
	if(owned_field)
		return
	owned_field = new /obj/effect/fusion_em_field/thermal(loc, src)
	owned_field.ChangeFieldStrength(field_strength)
	icon_state = "core1"
	update_use_power(POWER_USE_ACTIVE)

	. = 1

/obj/effect/fusion_em_field/thermal/Initialize()
	. = ..()
	for(var/obj/machinery/atmospherics/unary/heat_exchanger/HE in range(5, src))
		heat_exchangers += HE

/obj/effect/fusion_em_field/thermal/Destroy()
	. = ..()
	QDEL_NULL(heat_exchangers)


/obj/effect/fusion_em_field/thermal/Process() //This has to be a complete overwrite of the process() call because of how the EM field handles things.
	//make sure the field generator is still intact
	if(!owned_core || QDELETED(owned_core))
		qdel(src)
		return

	// Take some gas up from our environment.
	var/added_particles = FALSE
	var/datum/gas_mixture/uptake_gas = owned_core.loc.return_air()
	if(uptake_gas)
		uptake_gas = uptake_gas.remove_by_flag(MAT_FLAG_FUSION_FUEL, rand(100,200), TRUE)
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
	if(energy < 100)
		energy += a_energy
	if(plasma_temperature < 2000)
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

	if(owned_core)
		var/datum/gas_mixture/removed = new
		var/equilibrium_power = 250
		var/temp_factor

		for(var/obj/machinery/atmospherics/unary/heat_exchanger/HE in heat_exchangers)
			if(HE.air_contents.total_moles > 0)
				var/datum/gas_mixture/to_remove = HE.air_contents.remove(gasefficency * HE.air_contents.total_moles)
				removed.merge(to_remove)

		if(!removed.total_moles)
			return
		temp_factor = ( (equilibrium_power/decay_factor)**3 )/800
	//	energy = max( (removed.temperature * temp_factor) * 0 + energy, 0)

		var/device_energy = energy * reaction_power_modifier

		var/thermal_power = thermal_release_modifier * device_energy


		removed.add_thermal_energy(thermal_power)
		removed.temperature = between(0, removed.temperature, 10000)

		var/atmos_divisor = LAZYLEN(heat_exchangers) //Get however many heat exchangers we have.
		var/transfer_moles = removed.total_moles / atmos_divisor
		for(var/obj/machinery/atmospherics/unary/heat_exchanger/HE in heat_exchangers)
			var/datum/gas_mixture/gas_to_transfer
			gas_to_transfer = removed.remove(transfer_moles)
			HE.air_contents.merge(gas_to_transfer)


		if(radiation)
			SSradiation.radiate(src, energy * radiation_release_modifier)
		energy -= (energy/decay_factor)**3		//energy losses due to radiation
		if (debug)
			visible_message("[src]: Releasing [round(thermal_power)] W.")
			visible_message("[src]: energy: [energy].")
			visible_message("[src]: temp_factor: [temp_factor]")

	if(owned_core && owned_core.loc)
		var/datum/gas_mixture/environment = owned_core.loc.return_air()
		if(environment && environment.temperature < (T0C+1000)) // Putting an upper bound on it to stop it being used in a TEG.
			environment.add_thermal_energy(plasma_temperature*20000)

	radiation = 0


//the !!fun!! part
/obj/effect/fusion_em_field/thermal/React()
	//loop through the reactants in random order
	var/list/react_pool = reactants.Copy()

	//cant have any reactions if there aren't any reactants present
	if(react_pool.len)
		//determine a random amount to actually react this cycle, and remove it from the standard pool
		//this is a hack, and quite nonrealistic :(
		for(var/reactant in react_pool)
			react_pool[reactant] = rand(Floor(react_pool[reactant]/2),react_pool[reactant])
			reactants[reactant] -= react_pool[reactant]
			if(!react_pool[reactant])
				react_pool -= reactant

		//loop through all the reacting reagents, picking out random reactions for them
		var/list/produced_reactants = new/list
		var/list/p_react_pool = react_pool.Copy()
		while(p_react_pool.len)
			//pick one of the unprocessed reacting reagents randomly
			var/cur_p_react = pick(p_react_pool)
			p_react_pool.Remove(cur_p_react)

			//grab all the possible reactants to have a reaction with
			var/list/possible_s_reacts = react_pool.Copy()
			//if there is only one of a particular reactant, then it can not react with itself so remove it
			possible_s_reacts[cur_p_react] -= 1
			if(possible_s_reacts[cur_p_react] < 1)
				possible_s_reacts.Remove(cur_p_react)

			//loop through and work out all the possible reactions
			var/list/possible_reactions
			for(var/cur_s_react in possible_s_reacts)
				if(possible_s_reacts[cur_s_react] < 1)
					continue
				var/decl/fusion_reaction/cur_reaction = SSmaterials.get_fusion_reaction(cur_p_react, cur_s_react)
				if(cur_reaction && plasma_temperature >= cur_reaction.minimum_energy_level)
					LAZYDISTINCTADD(possible_reactions, cur_reaction)

			//if there are no possible reactions here, abandon this primary reactant and move on
			if(!LAZYLEN(possible_reactions))
				continue

			/// Sort based on reaction priority to avoid deut-deut eating all the deut before deut-trit can run etc.
			sortTim(possible_reactions, /proc/cmp_fusion_reaction_des)

			//split up the reacting atoms between the possible reactions
			while(possible_reactions.len)
				var/decl/fusion_reaction/cur_reaction = possible_reactions[1]
				possible_reactions.Remove(cur_reaction)

				//set the randmax to be the lower of the two involved reactants
				var/max_num_reactants = react_pool[cur_reaction.p_react] > react_pool[cur_reaction.s_react] ? \
				react_pool[cur_reaction.s_react] : react_pool[cur_reaction.p_react]
				if(max_num_reactants < 1)
					continue

				//make sure we have enough energy
				if(plasma_temperature < cur_reaction.minimum_reaction_temperature)
					continue

				if(plasma_temperature < max_num_reactants * cur_reaction.energy_consumption)
					max_num_reactants = round(plasma_temperature / cur_reaction.energy_consumption)
					if(max_num_reactants < 1)
						continue

				//randomly determined amount to react
				var/amount_reacting = rand(1, max_num_reactants)

				//removing the reacting substances from the list of substances that are primed to react this cycle
				//if there aren't enough of that substance (there should be) then modify the reactant amounts accordingly
				if( react_pool[cur_reaction.p_react] - amount_reacting >= 0 )
					react_pool[cur_reaction.p_react] -= amount_reacting
				else
					amount_reacting = react_pool[cur_reaction.p_react]
					react_pool[cur_reaction.p_react] = 0
				//same again for secondary reactant
				if(react_pool[cur_reaction.s_react] - amount_reacting >= 0 )
					react_pool[cur_reaction.s_react] -= amount_reacting
				else
					react_pool[cur_reaction.p_react] += amount_reacting - react_pool[cur_reaction.p_react]
					amount_reacting = react_pool[cur_reaction.s_react]
					react_pool[cur_reaction.s_react] = 0

				plasma_temperature -= max_num_reactants * cur_reaction.energy_consumption  // Remove the consumed energy.
				energy += max_num_reactants * cur_reaction.energy_production   // Add any produced energy.
				radiation +=   max_num_reactants * cur_reaction.radiation           // Add any produced radiation.
				tick_instability += max_num_reactants * cur_reaction.instability

				// Create the reaction products.
				for(var/reactant in cur_reaction.products)
					var/success = 0
					for(var/check_reactant in produced_reactants)
						if(check_reactant == reactant)
							produced_reactants[reactant] += cur_reaction.products[reactant] * amount_reacting
							success = 1
							break
					if(!success)
						produced_reactants[reactant] = cur_reaction.products[reactant] * amount_reacting

				// Handle anything special. If this proc returns true, abort the current reaction.
				if(cur_reaction.handle_reaction_special(src))
					return

				// This reaction is done, and can't be repeated this sub-cycle.
				possible_reactions.Remove(cur_reaction.s_react)

		// Loop through the newly produced reactants and add them to the pool.
		for(var/reactant in produced_reactants)
			AddParticles(reactant, produced_reactants[reactant])

		// Check whether there are reactants left, and add them back to the pool.
		for(var/reactant in react_pool)
			AddParticles(reactant, react_pool[reactant])
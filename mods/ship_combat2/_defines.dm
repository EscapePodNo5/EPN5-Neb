#define MISSILE_TARGET_STRUCTURAL list(/turf/simulated/wall, /turf/simulated/wall/r_wall, /turf/simulated/wall/voxshuttle, /turf/simulated/wall/r_titanium)
#define MISSILE_TARGET_TECHNICAL list(/obj/machinery/power/shield_generator, /obj/machinery/power/generator, /obj/machinery/power/tracker)
#define MISSILE_TARGET_ELECTRICAL list(/obj/machinery/power/smes, /obj/machinery/power/breakerbox)
#define MISSILE_TARGET_REACTOR list(/obj/machinery/power/ascent_reactor, /obj/machinery/power/fusion_core, /obj/machinery/power/supermatter)
#define MISSILE_TARGET_THRUST list(/obj/machinery/atmospherics/unary/engine)
#define MISSILE_TARGET_WEAPONS list() //Unused for the moment until weapons are actually coded in.
#define MISSILE_TARGET_WARCRIMES list(/mob/living/carbon/human) //Can't commit warcrimes on people who are just atoms in spread across 300km of space.

#define PROJECTILE_TYPE_MISSILE 1
#define PROJECTILE_TYPE_KINETIC 2
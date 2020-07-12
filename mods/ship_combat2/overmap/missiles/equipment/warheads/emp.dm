// Diffuses shields in a large radius for a long time
/obj/item/projectile_equipment/payload/emp
	name = "EMP device"
	desc = "Emits a strong electromagnetic pulse when the detonation mechanism of the missile it's fitted in is triggered."
	icon_state = "ion"

	threat = 5

/obj/item/projectile_equipment/payload/emp/on_trigger()
	empulse(get_turf(src), rand(4,5), rand(6,7))

	..()
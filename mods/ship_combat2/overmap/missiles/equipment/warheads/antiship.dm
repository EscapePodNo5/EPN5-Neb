/obj/item/projectile_equipment/payload/explosive
	name = "explosive charge"
	desc = "An explosive charge. Detonates when the missile is triggered."
	icon_state = "explosive"

	threat = 20

/obj/item/projectile_equipment/payload/explosive/on_trigger(var/atom/triggerer)
	if(istype(triggerer, /obj/effect/shield))
		explosion(get_turf(src), 1, 2, 3, 4)
	else
		explosion(get_turf(src), 3, 6, 8, 4)

	..()
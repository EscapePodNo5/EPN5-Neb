///slight modification to normal timers



/obj/machinery/door_timer/wolf/LateInitialize()
	for(var/obj/machinery/door/airlock/M in SSmachines.machinery)
		if (M.id_tag == src.id)
			targets += M

	for(var/obj/machinery/flasher/F in SSmachines.machinery)
		if(F.id_tag == src.id)
			targets += F

	for(var/obj/structure/closet/secure_closet/brig/C in world)
		if(C.id == src.id)
			targets += C

	if(targets.len==0)
		set_broken(TRUE)
	queue_icon_update()

/obj/machinery/door_timer/wolf/timer_start()
	if(stat & (NOPOWER|BROKEN))	return 0

	// Set releasetime
	releasetime = world.timeofday + timetoset


	//set timing
	timing = 1

	for(var/obj/machinery/door/airlock/door in targets)
		door.unlock()
		spawn(10)
			door.close()

	for(var/obj/structure/closet/secure_closet/brig/C in targets)
		if(C.broken)	continue
		if(C.opened && !C.close())	continue
		C.locked = TRUE
		C.queue_icon_update()
	return 1

/obj/machinery/door_timer/wolf/timer_end(var/broadcast_to_huds = FALSE)
	if(stat & (NOPOWER|BROKEN))	return 0

	// Reset releasetime
	releasetime = 0

	//reset timing
	timing = 0

	if (broadcast_to_huds)
		broadcast_security_hud_message("The timer for [id] has expired.", src)

	for(var/obj/machinery/door/airlock/door in targets)
		door.open()
		spawn(10)
			door.lock(TRUE)


	for(var/obj/structure/closet/secure_closet/brig/C in targets)
		if(C.broken)	continue
		if(C.opened)	continue
		C.locked = 0
		C.queue_icon_update()

	return 1
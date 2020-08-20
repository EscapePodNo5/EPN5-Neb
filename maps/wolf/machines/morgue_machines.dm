/obj/structure/morgue/wolf
	name = "wall-mounted morgue tray"
	density = 0

/obj/structure/morgue/wolf/attack_hand(mob/user) //As these are generally offset into a wall, tray placement might get a little fucky without overwriting some stuff.
	if (src.connected)
		for(var/atom/movable/A as mob|obj in src.connected.loc)
			if (!( A.anchored ))
				A.forceMove(src)
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		qdel(src.connected)
		src.connected = null
	else
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		src.connected = new /obj/structure/m_tray( src.loc )
		var/turf/T = get_turf(src)
		if (T.contents.Find(src.connected))
			src.connected.connected = src
			src.icon_state = "morgue0"
			for(var/atom/movable/A as mob|obj in src)
				A.forceMove(src.connected.loc)
			src.connected.icon_state = "morguet"
			src.connected.set_dir(src.dir)
		else
			qdel(src.connected)
			src.connected = null
	src.add_fingerprint(user)
	update()
	return

/obj/structure/crematorium/wolf
	name = "wall-mounted crematorium"
	density = 0

/obj/structure/crematorium/wolf/attack_hand(mob/user) //This code is literally the same as the morgue tray. I have no idea why this isn't one object.
	if(cremating)
		to_chat(usr, "<span class='warning'>It's locked.</span>")
		return
	if(src.connected && (src.locked == FALSE))
		for(var/atom/movable/A as mob|obj in src.connected.loc)
			if (!( A.anchored ))
				A.forceMove(src)
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		qdel(src.connected)
	else if(src.locked == 0)
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		src.connected = new /obj/structure/c_tray(src.loc)
		var/turf/T = get_turf(src)
		if (T.contents.Find(src.connected))
			src.connected.connected = src
			src.icon_state = "crema0"
			for(var/atom/movable/A as mob|obj in src)
				A.forceMove(src.connected.loc)
			src.connected.icon_state = "cremat"
		else
			qdel(src.connected)
	src.add_fingerprint(user)
	update()
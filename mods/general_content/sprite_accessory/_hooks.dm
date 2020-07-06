/hook/startup/proc/init_ears_tails_datums()
	var/paths

	//Tails.
	paths = typesof(/datum/sprite_accessory/tail/) - /datum/sprite_accessory/tail
	for(var/path in paths)
		var/datum/sprite_accessory/tail/H = new path()
		GLOB.tail_styles_list[H.name] = H

	paths = typesof(/datum/sprite_accessory/ears) - /datum/sprite_accessory/ears
	for(var/path in paths)
		var/datum/sprite_accessory/ears/H = new path()
		GLOB.ear_styles_list[H.name] = H

	return 1
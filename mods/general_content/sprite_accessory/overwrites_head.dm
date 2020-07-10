/obj/item/organ/external/head/get_hair_icon()
	var/image/res = image(species.icon_template,"")
	if(owner.f_style)
		var/datum/sprite_accessory/facial_hair_style = GLOB.facial_hair_styles_list[owner.f_style]
		if(facial_hair_style)
			if(!facial_hair_style.species_allowed || (species.get_root_species_name(owner) in facial_hair_style.species_allowed))
				if(!facial_hair_style.subspecies_allowed || (species.name in facial_hair_style.subspecies_allowed))
					var/icon/facial_s = new/icon("icon" = facial_hair_style.icon, "icon_state" = "[facial_hair_style.icon_state]_s")
					if(owner.facial_hair_colour && facial_hair_style.do_colouration)
						facial_s.Blend(owner.facial_hair_colour, facial_hair_style.blend)
					res.overlays |= facial_s

	if(owner.h_style)
		var/style = owner.h_style
		var/datum/sprite_accessory/hair/hair_style = GLOB.hair_styles_list[style]
		if(owner.head && (owner.head.flags_inv & BLOCKHEADHAIR))
			if(!(hair_style.flags & VERY_SHORT))
				hair_style = GLOB.hair_styles_list["Short Hair"]
		if(hair_style)
			if(!hair_style.species_allowed || (species.get_root_species_name(owner) in hair_style.species_allowed))
				if(!hair_style.subspecies_allowed || (species.name in hair_style.subspecies_allowed))
					var/icon/hair_s = new/icon("icon" = hair_style.icon, "icon_state" = "[hair_style.icon_state]_s")
					if(hair_style.do_colouration && hair_colour)
						hair_s.Blend(hair_colour, hair_style.blend)
					res.overlays |= hair_s

	for (var/M in markings)
		var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
		if (mark_style.draw_target == MARKING_TARGET_HAIR)
			var/icon/mark_icon = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]")
			if (!mark_style.do_colouration && owner.h_style)
				var/datum/sprite_accessory/hair/hair_style = GLOB.hair_styles_list[owner.h_style]
				if ((~hair_style.flags & HAIR_BALD) && hair_colour)
					mark_icon.Blend(hair_colour, ICON_ADD)
				else //only baseline human skin tones; others will need species vars for coloration
					mark_icon.Blend(rgb(200 + skin_tone, 150 + skin_tone, 123 + skin_tone), ICON_ADD)
			else
				mark_icon.Blend(markings[M]["color"], ICON_ADD)
			res.overlays |= mark_icon
			icon_cache_key += "[M][markings[M]["color"]]"

	if(owner.ear_style)
		if(owner.ear_style && !(owner.head && (owner.head.flags_inv & BLOCKHEADHAIR)))
			var/icon/ears_s = new/icon("icon" = owner.ear_style.icon, "icon_state" = owner.ear_style.icon_state)
			if(owner.ear_style.do_colouration)
				ears_s.Blend(rgb(owner.r_ears, owner.g_ears, owner.b_ears), owner.ear_style.color_blend_mode)
			if(owner.ear_style.extra_overlay)
				var/icon/overlay = new/icon("icon" = owner.ear_style.icon, "icon_state" = owner.ear_style.extra_overlay)
				overlay.Blend(rgb(owner.r_ears2, owner.g_ears2, owner.b_ears2), owner.ear_style.color_blend_mode)
				ears_s.Blend(overlay, ICON_OVERLAY)
				qdel(overlay)
			res.overlays |= ears_s

	return res
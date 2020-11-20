//We need to overwrite some stuff because absurd tails and shit will probably prevent you from wearing a voidsuit.

/obj/item/clothing
	var/tail_size_check = FALSE //Do we check tail size?

/obj/item/clothing/suit/space
	tail_size_check = TRUE

/obj/item/clothing/proc/check_tail(var/mob/living/carbon/human/M) //Returns 0 if tail is too big, otherwise returns true.
	if(tail_size_check)
		if(M.tail_style) //There's a datum associated with our tail var.
			if(M.tail_style.is_large)
				return FALSE
			else
				return TRUE
	else
		return TRUE

/obj/item/clothing/mob_can_equip(mob/living/M, slot, disable_warning = 0)
	. = ..()
	if(. && length(bodytype_restricted) && ishuman(M) && !(slot in list(slot_l_store_str, slot_r_store_str, slot_s_store_str)) && !(slot in M.held_item_slots))
		var/mob/living/carbon/human/H = M
		if(!check_tail(H))
			return FALSE //Don't even bother checking the bodytype because the tail's too big.
		. = ("exclude" in bodytype_restricted) ? !(H.species.get_bodytype(H) in bodytype_restricted) : (H.species.get_bodytype(H) in bodytype_restricted)
		if(!. && !disable_warning)
			to_chat(H, SPAN_WARNING("\The [src] [gender == PLURAL ? "do" : "does"] not fit you."))
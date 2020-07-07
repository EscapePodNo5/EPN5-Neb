/mob/living/carbon/human/proc/get_tail_image()
	//If you have a custom tail selected
	if(tail_style && !(wear_suit && wear_suit.flags_inv & HIDETAIL))
		var/icon/tail_s = new/icon("icon" = tail_style.icon, "icon_state" = tail_style.icon_state)
		if(tail_style.do_colouration)
			tail_s.Blend(rgb(src.r_tail, src.g_tail, src.b_tail), tail_style.color_blend_mode)
		if(tail_style.extra_overlay)
			var/icon/overlay = new/icon("icon" = tail_style.icon, "icon_state" = tail_style.extra_overlay)
			overlay.Blend(rgb(src.r_tail2, src.g_tail2, src.b_tail2), tail_style.color_blend_mode)
			tail_s.Blend(overlay, ICON_OVERLAY)
			qdel(overlay)

		return image(tail_s)
	return null

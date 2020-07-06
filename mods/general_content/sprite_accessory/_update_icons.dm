#define HO_MUTATIONS_LAYER  1
#define HO_SKIN_LAYER       2
#define HO_DAMAGE_LAYER     3
#define HO_SURGERY_LAYER    4 //bs12 specific.
#define HO_UNDERWEAR_LAYER  5
#define HO_UNIFORM_LAYER    6
#define HO_ID_LAYER         7
#define HO_SHOES_LAYER      8
#define HO_GLOVES_LAYER     9
#define HO_BELT_LAYER       10
#define HO_SUIT_LAYER       11
#define HO_TAIL_LAYER       12 //bs12 specific. this hack is probably gonna come back to haunt me
#define HO_GLASSES_LAYER    13
#define HO_BELT_LAYER_ALT   14
#define HO_SUIT_STORE_LAYER 15
#define HO_BACK_LAYER       16
#define HO_HAIR_LAYER       17 //TODO: make part of head layer?
#define HO_GOGGLES_LAYER    18
#define HO_EARS_LAYER       19
#define HO_FACEMASK_LAYER   20
#define HO_HEAD_LAYER       21
#define HO_COLLAR_LAYER     22
#define HO_HANDCUFF_LAYER   23
#define HO_L_HAND_LAYER     24
#define HO_R_HAND_LAYER     25
#define TAIL_LAYER_ALT		26	//BastionStation edit. Simply move this up a number if things are added.
#define HO_FIRE_LAYER       27 //If you're on fire
#define TOTAL_LAYERS        27	//BASTION EDIT - KEEP THIS UPDATED

/mob/living/carbon/human/update_tail_showing(var/update_icons=1)
	overlays_standing[HO_TAIL_LAYER] = null
	var/species_tail = species.get_tail(src)
	var/used_tail_layer = tail_alt ? TAIL_LAYER_ALT : HO_TAIL_LAYER
	var/image/vr_tail_image = get_tail_image()

	if(vr_tail_image) //we don't do the wearsuit check here because that's done in get_tail_image() evidently.
		vr_tail_image.layer = used_tail_layer
		overlays_standing[HO_TAIL_LAYER] = vr_tail_image
		if(update_icons)
			queue_icon_update()

	if(species_tail && !(wear_suit && wear_suit.flags_inv & HIDETAIL) && !vr_tail_image) //Custom tails over-ride species tails.
		var/icon/tail_s = get_tail_icon()
		overlays_standing[HO_TAIL_LAYER] = image(tail_s, icon_state = "[species_tail]_s")
		animate_tail_reset(0)
		if(update_icons)
			queue_icon_update()

#undef HO_MUTATIONS_LAYER
#undef HO_SKIN_LAYER
#undef HO_DAMAGE_LAYER
#undef HO_SURGERY_LAYER
#undef HO_UNDERWEAR_LAYER
#undef HO_UNIFORM_LAYER
#undef HO_ID_LAYER
#undef HO_SHOES_LAYER
#undef HO_GLOVES_LAYER
#undef HO_BELT_LAYER
#undef HO_EARS_LAYER
#undef HO_SUIT_LAYER
#undef HO_TAIL_LAYER
#undef HO_GLASSES_LAYER
#undef HO_BELT_LAYER_ALT
#undef HO_SUIT_STORE_LAYER
#undef HO_BACK_LAYER
#undef HO_HAIR_LAYER
#undef HO_GOGGLES_LAYER
#undef HO_FACEMASK_LAYER
#undef HO_HEAD_LAYER
#undef HO_COLLAR_LAYER
#undef HO_HANDCUFF_LAYER
#undef HO_L_HAND_LAYER
#undef HO_R_HAND_LAYER
#undef HO_FIRE_LAYER
#undef TOTAL_LAYERS
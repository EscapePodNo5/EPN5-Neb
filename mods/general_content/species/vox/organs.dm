//vox got different organs within. This will also help with regular surgeons knowing the organs within an alien as alien as vox.
/obj/item/organ/internal/heart/vox
	icon_state = "vox heart"
	dead_icon = null
	parent_organ = BP_GROIN

/obj/item/organ/internal/lungs/vox
	name = "air capillary sack" //Like birds, Vox absorb gas via air capillaries.
	icon_state = "vox lung"

/obj/item/organ/internal/kidneys/vox
	name = "filtration bladder"
	icon_state = "lungs" //wow are vox kidneys fat.
	color = "#99ccff"
	parent_organ = BP_CHEST

/obj/item/organ/internal/liver/vox
	name = "waste tract"
	parent_organ = BP_CHEST
	color = "#0033cc"

/obj/item/organ/internal/eyes/vox
	eye_icon = "general_content/icons/vox/eyes.dmi"
	color = "#0033cc"

/obj/item/organ/internal/stomach/vox
	name = "gizzard"
	color = "#0033cc"

/obj/item/organ/internal/hindtongue
	name = "hindtongue"
	desc = "Some kind of severed bird tongue."
	parent_organ = BP_HEAD
	icon_state = "hindtongue"
	organ_tag = BP_HINDTONGUE

/obj/item/organ/internal/voxstack
	name = "cortical stack"
	parent_organ = BP_HEAD
	icon_state = "cortical-stack"
	organ_tag = BP_STACK
	vital = 1
	origin_tech = list(TECH_BIO = 4, TECH_MATERIAL = 4, TECH_MAGNET = 2, TECH_DATA = 3)
	relative_size = 10
	var/invasive = 1

	var/ownerckey
	var/default_language
	var/list/languages = list()
	var/datum/mind/backup
	var/prompting = FALSE // Are we waiting for a user prompt?

/obj/item/organ/internal/voxstack/New()
	..()
	robotize()

/obj/item/organ/internal/voxstack/examine(mob/user)
	. = ..()

	var/user_vox = isspecies(user,SPECIES_VOX)
	if (istype(backup))
		var/owner_viable = find_dead_player(ownerckey, TRUE)
		if (user_vox)
			to_chat(user, SPAN_NOTICE("The integrity light on [src] blinks [owner_viable ? "rapidly. It can be implanted." : "slowly. It is dormant."]"))
		else
			to_chat(user, SPAN_NOTICE("A light on [src] blinks [owner_viable ? "rapidly" : "slowly"]."))
	else if (user_vox)
		to_chat(user, SPAN_NOTICE("The integrity light on [src] is off. It is empty and lifeless."))

/obj/item/organ/internal/voxstack/emp_act()
	return

/obj/item/organ/internal/voxstack/getToxLoss()
	return 0

/obj/item/organ/internal/voxstack/proc/do_backup()
	if(owner && owner.stat != DEAD && !is_broken() && owner.mind)
		languages = owner.languages.Copy()
		backup = owner.mind
		default_language = owner.default_language
		if(owner.ckey)
			ownerckey = owner.ckey

/obj/item/organ/internal/voxstack/proc/backup_inviable()
	return 	(!istype(backup) || backup == owner.mind || (backup.current && backup.current.stat != DEAD))

/obj/item/organ/internal/voxstack/replaced()
	if(!..()) return 0
	if(prompting) // Don't spam the player with twenty dialogs because someone doesn't know what they're doing or panicking.
		return 0
	if(owner && !backup_inviable())
		var/current_owner = owner
		prompting = TRUE
		var/response = alert(find_dead_player(ownerckey, 1), "Your neural backup has been placed into a new body. Do you wish to return to life as the mind of [backup.name]?", "Resleeving", "Yes", "No")
		prompting = FALSE
		if(src && response == "Yes" && owner == current_owner)
			overwrite()
	sleep(-1)
	do_backup()

	return 1

/obj/item/organ/internal/voxstack/removed()
	var/obj/item/organ/external/head = owner.get_organ(parent_organ)
	owner.visible_message(SPAN_DANGER("\The [src] rips gaping holes in \the [owner]'s [head.name] as it is torn loose!"))
	head.take_external_damage(rand(15,20))
	for(var/obj/item/organ/internal/O in head.contents)
		O.take_internal_damage(rand(30,70))
	do_backup()
	..()

/obj/item/organ/internal/voxstack/proc/overwrite()
	if(owner.mind && owner.ckey) //Someone is already in this body!
		if(owner.mind == backup) // Oh, it's the same mind in the backup. Someone must've spammed the 'Start Procedure' button in a panic.
			return
		owner.visible_message(SPAN_DANGER("\The [owner] spasms violently!"))
		if(prob(66))
			to_chat(owner, SPAN_DANGER("You fight off the invading tendrils of another mind, holding onto your own body!"))
			return
		owner.ghostize()
	backup.active = 1
	backup.transfer_to(owner)
	if (default_language)
		owner.default_language = default_language
	owner.languages = languages.Copy()
	to_chat(owner, SPAN_NOTICE("Consciousness slowly creeps over you as your new body awakens."))

/datum/species/vox/handle_death(var/mob/living/carbon/human/H)
	..()
	var/obj/item/organ/internal/voxstack/stack = H.get_organ(BP_STACK)
	if (stack)
		stack.do_backup()
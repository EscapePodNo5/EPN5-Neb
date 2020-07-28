/datum/job/assistant
	title = "Tester"
	supervisors = "literally everyone, you bottom feeder"
	outfit_type = /decl/hierarchy/outfit/job/tradeship/hand
	hud_icon = "hudcargotechnician"

/datum/map/wolf
	default_assistant_title = "Tester"
	allowed_jobs = list(
		/datum/job/assistant
	)

/decl/hierarchy/outfit/job/tradeship/hand
	name = "Tester"

/decl/hierarchy/outfit/job/tradeship/hand/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(list(/obj/item/clothing/under/overalls, /obj/item/clothing/under/hazard, /obj/item/clothing/under/rank/cargotech, /obj/item/clothing/under/color/black, /obj/item/clothing/under/color/grey, /obj/item/clothing/under/casual_pants/track))


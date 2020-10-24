#define WOLF_OUTFIT_JOB_NAME(job_name) ("Wolf - Job - " + job_name)

/decl/hierarchy/outfit/job/wolf
	hierarchy_type = /decl/hierarchy/outfit/job/wolf
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store_str

/decl/hierarchy/outfit/job/wolf/assistant
	name = WOLF_OUTFIT_JOB_NAME("Crewman")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/civilian
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/grey

//COMMAND//

/decl/hierarchy/outfit/job/wolf/captain
	name = WOLF_OUTFIT_JOB_NAME("Captain")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/heads/captain
	shoes = /obj/item/clothing/shoes/jackboots/duty
	uniform = /obj/item/clothing/under/wolf/blue
	pda_type = /obj/item/modular_computer/pda/heads/captain
	l_ear = /obj/item/radio/headset/heads/captain

/decl/hierarchy/outfit/job/wolf/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/captain/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/captain/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)


/decl/hierarchy/outfit/job/wolf/first_officer
	name = WOLF_OUTFIT_JOB_NAME("First Officer")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/heads/FO
	shoes = /obj/item/clothing/shoes/jackboots/duty
	uniform = /obj/item/clothing/under/wolf/blue
	pda_type = /obj/item/modular_computer/pda/heads/hop
	l_ear = /obj/item/radio/headset/heads/hop

/decl/hierarchy/outfit/job/wolf/first_officer/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/command/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/command/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)

/decl/hierarchy/outfit/job/wolf/CE
	name = WOLF_OUTFIT_JOB_NAME("Chief Engineer")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/heads/CE
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/wolf/tan
	pda_type = /obj/item/modular_computer/pda/heads/ce
	l_ear = /obj/item/radio/headset/heads/ce

/decl/hierarchy/outfit/job/wolf/CE/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/engineering/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/engineering/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)

/decl/hierarchy/outfit/job/wolf/SSC
	name = WOLF_OUTFIT_JOB_NAME("Ship Security Commander")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/heads/SSC
	shoes = /obj/item/clothing/shoes/jackboots/duty
	uniform = /obj/item/clothing/under/wolf/black
	pda_type = /obj/item/modular_computer/pda/security
	l_ear = /obj/item/radio/headset/heads/hos

/decl/hierarchy/outfit/job/wolf/SSC/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/security/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/security/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)

/decl/hierarchy/outfit/job/wolf/CMO
	name = WOLF_OUTFIT_JOB_NAME("Chief Medical Officer")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/heads/CMO
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda/medical
	belt = /obj/item/scanner/health
	l_ear = /obj/item/radio/headset/heads/cmo

/decl/hierarchy/outfit/job/wolf/CMO/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/medical/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/medical/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)

/decl/hierarchy/outfit/job/wolf/TD
	name = WOLF_OUTFIT_JOB_NAME("Technology Director")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/heads/TD
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/blue
	pda_type = /obj/item/modular_computer/pda/science
	l_ear = /obj/item/radio/headset/heads/rd

/decl/hierarchy/outfit/job/wolf/TD/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/science/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/science/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)

/decl/hierarchy/outfit/job/wolf/bosun
	name = WOLF_OUTFIT_JOB_NAME("Bosun")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/heads/bosun
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/wolf/olive
	pda_type = /obj/item/modular_computer/pda/cargo
	belt = /obj/item/clipboard/ebony
	l_ear = /obj/item/radio/headset/headset_bosun

/decl/hierarchy/outfit/job/wolf/bosun/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/cargo/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/cargo/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)

/decl/hierarchy/outfit/job/wolf/bridge_officer
	name = WOLF_OUTFIT_JOB_NAME("Bridge Officer")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/command/bridge_officer
	shoes = /obj/item/clothing/shoes/jackboots/duty
	uniform = /obj/item/clothing/under/wolf/blue
	pda_type = /obj/item/modular_computer/pda
	l_ear = /obj/item/radio/headset/heads/hop

/decl/hierarchy/outfit/job/wolf/bridge_officer/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/chevrons/command/chevrons = new()
		var/obj/item/clothing/accessory/dept_stripes/command/stripes = new()
		if(uniform.can_attach_accessory(chevrons))
			uniform.attach_accessory(null, chevrons)
		if(uniform.can_attach_accessory(stripes))
			uniform.attach_accessory(null, stripes)
		else
			qdel(chevrons)
			qdel(stripes)

//SECURITY//

/decl/hierarchy/outfit/job/wolf/brig_chief
	name = WOLF_OUTFIT_JOB_NAME("Chief Officer")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/security/brig_chief
	shoes = /obj/item/clothing/shoes/jackboots/duty
	uniform = /obj/item/clothing/under/wolf/black
	pda_type = /obj/item/modular_computer/pda/security
	l_ear = /obj/item/radio/headset/heads/hos


/decl/hierarchy/outfit/job/wolf/armsman
	name = WOLF_OUTFIT_JOB_NAME("Armsman")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/security/armsman
	shoes = /obj/item/clothing/shoes/jackboots/duty
	uniform = /obj/item/clothing/under/wolf/black
	pda_type = /obj/item/modular_computer/pda/security
	l_ear = /obj/item/radio/headset/sec

/decl/hierarchy/outfit/job/wolf/gunship_pilot
	name = WOLF_OUTFIT_JOB_NAME("Gunship Pilot")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/security/gunship_pilot
	shoes = /obj/item/clothing/shoes/jackboots/duty
	uniform = /obj/item/clothing/under/wolf/black
	pda_type = /obj/item/modular_computer/pda/security
	l_ear = /obj/item/radio/headset/sec


//ENGINEERING//

/decl/hierarchy/outfit/job/wolf/engineering
	name = WOLF_OUTFIT_JOB_NAME("Engineer")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/engineering
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/wolf/tan
	pda_type = /obj/item/modular_computer/pda/engineering
	l_ear = /obj/item/radio/headset/headset_eng


//MEDICAL//

/decl/hierarchy/outfit/job/wolf/medtech
	name = WOLF_OUTFIT_JOB_NAME("Medical Support Technician")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/medical/medtech
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda/medical
	belt = /obj/item/scanner/health
	l_ear = /obj/item/radio/headset/headset_med


/decl/hierarchy/outfit/job/wolf/doctor
	name = WOLF_OUTFIT_JOB_NAME("Doctor")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/medical/doctor
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda/medical
	belt = /obj/item/scanner/health
	l_ear = /obj/item/radio/headset/headset_med


/decl/hierarchy/outfit/job/wolf/pharmacist
	name = WOLF_OUTFIT_JOB_NAME("Pharmacist")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/medical/pharmacist
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda/medical
	l_ear = /obj/item/radio/headset/headset_med


//SCIENCE//

/decl/hierarchy/outfit/job/wolf/research_tech
	name = WOLF_OUTFIT_JOB_NAME("Research Technician")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/science/research_tech
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda/science
	l_ear = /obj/item/radio/headset/headset_sci


/decl/hierarchy/outfit/job/wolf/robotics
	name = WOLF_OUTFIT_JOB_NAME("Robotics Specialist")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/science/robotics
	shoes = /obj/item/clothing/shoes/color/black
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda/science
	l_ear = /obj/item/radio/headset/headset_sci


//CARGO//

/decl/hierarchy/outfit/job/wolf/deck_hand
	name = WOLF_OUTFIT_JOB_NAME("Deck Hand")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/cargo/deck_hand
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/wolf/olive
	pda_type = /obj/item/modular_computer/pda/cargo
	belt = /obj/item/clipboard/ebony
	l_ear = /obj/item/radio/headset/headset_cargo



/decl/hierarchy/outfit/job/wolf/salvage_technician
	name = WOLF_OUTFIT_JOB_NAME("Salvage Technician")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/cargo/salvage_technician
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/wolf/olive
	pda_type = /obj/item/modular_computer/pda/cargo
	l_ear = /obj/item/radio/headset/headset_cargo



//SERVICE//

/decl/hierarchy/outfit/job/wolf/chef
	name = WOLF_OUTFIT_JOB_NAME("Chef")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/civilian/chef
	shoes = /obj/item/clothing/shoes/color/white
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda
	l_ear = /obj/item/radio/headset/headset_service


/decl/hierarchy/outfit/job/wolf/bartender
	name = WOLF_OUTFIT_JOB_NAME("Bartender")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/civilian/bartender
	shoes = /obj/item/clothing/shoes/color/white
	uniform = /obj/item/clothing/under/wolf/white
	pda_type = /obj/item/modular_computer/pda
	l_ear = /obj/item/radio/headset/headset_service


/decl/hierarchy/outfit/job/wolf/botanist
	name = WOLF_OUTFIT_JOB_NAME("Botanist")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/civilian/botanist
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/wolf/black
	pda_type = /obj/item/modular_computer/pda
	l_ear = /obj/item/radio/headset/headset_service



/decl/hierarchy/outfit/job/wolf/janitor
	name = WOLF_OUTFIT_JOB_NAME("Janitor")
	flags = OUTFIT_HAS_BACKPACK
	id_type = /obj/item/card/id/wolf/civilian/janitor
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/wolf/black
	pda_type = /obj/item/modular_computer/pda
	l_ear = /obj/item/radio/headset/headset_service



/obj/item/card/id/wolf
	name = "identification card"
	desc = "A typical identification card."

///CIVILIAN///

/obj/item/card/id/wolf/civilian/
	detail_color = COLOR_GREEN

/obj/item/card/id/wolf/civilian/janitor
	job_access_type = /datum/job/wolf/civilian/janitor

/obj/item/card/id/wolf/civilian/botanist
	job_access_type = /datum/job/wolf/civilian/botanist

/obj/item/card/id/wolf/civilian/bartender
	job_access_type = /datum/job/wolf/civilian/bartender

/obj/item/card/id/wolf/civilian/chef
	job_access_type = /datum/job/wolf/civilian/chef

///CARGO///

/obj/item/card/id/wolf/cargo
	detail_color = COLOR_BEASTY_BROWN

/obj/item/card/id/wolf/cargo/salvage_technician
	job_access_type = /datum/job/wolf/civilian/salvage_tech

/obj/item/card/id/wolf/cargo/deck_hand
	job_access_type = /datum/job/wolf/civilian/deck_hand

///MEDICAL///

/obj/item/card/id/wolf/medical
	detail_color = COLOR_DEEP_SKY_BLUE

/obj/item/card/id/wolf/medical/doctor
	job_access_type = /datum/job/wolf/medical/doctor

/obj/item/card/id/wolf/medical/medtech
	job_access_type = /datum/job/wolf/medical/medtech

/obj/item/card/id/wolf/medical/pharmacist
	job_access_type = /datum/job/wolf/medical/pharmacist

///SECURITY///

/obj/item/card/id/wolf/security
	detail_color = COLOR_NT_RED

/obj/item/card/id/wolf/security/brig_chief
	job_access_type = /datum/job/wolf/security/brig_chief

/obj/item/card/id/wolf/security/armsman
	job_access_type = /datum/job/wolf/security/armsmen

/obj/item/card/id/wolf/security/gunship_pilot
	job_access_type = /datum/job/wolf/security/gunship_pilot

///SCIENCE///

/obj/item/card/id/wolf/science
	detail_color = COLOR_VIOLET

/obj/item/card/id/wolf/science/research_tech
	job_access_type = /datum/job/wolf/science/research_tech

/obj/item/card/id/wolf/science/robotics
	job_access_type = /datum/job/wolf/science/robotics

///ENGINEERING///

/obj/item/card/id/wolf/engineering
	detail_color = COLOR_AMBER

/obj/item/card/id/wolf/engineering/engineer
	job_access_type = /datum/job/wolf/engineering/engineer

///COMMAND///

/obj/item/card/id/wolf/command
	color = COLOR_COMMAND_BLUE

/obj/item/card/id/wolf/command/heads
	extra_details = list("goldstripe")
	detail_color = COLOR_AMBER

/obj/item/card/id/wolf/command/bridge_officer
	job_access_type = /datum/job/wolf/command/bridge_officer

/obj/item/card/id/wolf/command/heads/CE
	job_access_type = /datum/job/wolf/engineering/CE
	detail_color = COLOR_DARK_ORANGE

/obj/item/card/id/wolf/command/heads/CMO
	job_access_type = /datum/job/wolf/medical/CMO
	detail_color = "#92e7fc"

/obj/item/card/id/wolf/command/heads/SSC
	job_access_type = /datum/job/wolf/security/SSC
	detail_color = COLOR_NT_RED

/obj/item/card/id/wolf/command/heads/TD
	job_access_type = /datum/job/wolf/science/TD
	detail_color = COLOR_VIOLET

/obj/item/card/id/wolf/command/heads/bosun
	job_access_type = /datum/job/wolf/civilian/bosun
	detail_color = COLOR_BEASTY_BROWN

/obj/item/card/id/wolf/command/heads/FO
	job_access_type = /datum/job/wolf/command/first_officer

/obj/item/card/id/wolf/command/heads/captain
	color = COLOR_AMBER

/obj/item/card/id/wolf/command/heads/captain/Initialize()
	. = ..()
	access = get_all_station_access()
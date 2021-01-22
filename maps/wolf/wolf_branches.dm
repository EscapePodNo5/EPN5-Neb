/datum/map/wolf
	branch_types = list(
		/datum/mil_branch/exoplanetary_affairs,
		/datum/mil_branch/civilian
	)

	spawn_branch_types = list(
		/datum/mil_branch/exoplanetary_affairs,
		/datum/mil_branch/civilian
	)

/datum/mil_branch/exoplanetary_affairs
	name = "Exoplanetary Affairs"
	name_short = "EXA"

	rank_types = list(
		/datum/mil_rank/exo/e1,
		/datum/mil_rank/exo/e2,
		/datum/mil_rank/exo/e3,
		/datum/mil_rank/exo/e4,
		/datum/mil_rank/exo/e5,
		/datum/mil_rank/exo/e6,
		/datum/mil_rank/exo/e7,
		/datum/mil_rank/exo/o1,
		/datum/mil_rank/exo/o2,
		/datum/mil_rank/exo/o3,
		/datum/mil_rank/exo/o4,
		/datum/mil_rank/exo/o5,
		/datum/mil_rank/exo/o6,
		/datum/mil_rank/exo/o7,
		/datum/mil_rank/exo/o8,
		/datum/mil_rank/exo/o9,
		)

	spawn_rank_types = list(
		/datum/mil_rank/exo/e2,
		/datum/mil_rank/exo/e3,
		/datum/mil_rank/exo/e4,
		/datum/mil_rank/exo/e5,
		/datum/mil_rank/exo/e6,
		/datum/mil_rank/exo/e7,
		/datum/mil_rank/exo/o1,
		/datum/mil_rank/exo/o2,
		/datum/mil_rank/exo/o3,
		/datum/mil_rank/exo/o4,
		/datum/mil_rank/exo/o5,
		/datum/mil_rank/exo/o6
		)

	assistant_job = DEFAULT_JOB_TYPE

	// Email addresses will be created under this domain name. Mostly for the looks.
	email_domain = "odyssey.exo.usn.net"

	min_skill = list(	SKILL_SCIENCE = SKILL_BASIC,
						SKILL_EVA     = SKILL_BASIC)

/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "Civ"
	email_domain = "freemail.net"

	assistant_job = /datum/job/passenger

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)

///EXOPLANETARY AFFAIRS RANKS///

/datum/mil_rank/exo/e1
	name = "Starman Recruit"
	name_short = "SR"
	sort_order = 1
	accessory = list(/obj/item/clothing/accessory/ranks/enlisted/e1)

/datum/mil_rank/exo/e2
	name = "Starman Apprentice"
	name_short = "SA"
	sort_order = 2
	accessory = list(/obj/item/clothing/accessory/ranks/enlisted/e2)

/datum/mil_rank/exo/e3
	name = "Starman"
	name_short = "SP"
	sort_order = 3
	accessory = list(/obj/item/clothing/accessory/ranks/enlisted/e3)

/datum/mil_rank/exo/e4
	name = "Lance Starman"
	name_short = "LSP"
	sort_order = 4
	accessory = list(/obj/item/clothing/accessory/ranks/enlisted/e4)

/datum/mil_rank/exo/e5
	name = "Senior Lance Starman"
	name_short = "LSP"
	sort_order = 5
	accessory = list(/obj/item/clothing/accessory/ranks/senior_enlisted/e5)

/datum/mil_rank/exo/e6
	name = "Chief Lance Starman"
	name_short = "CLSP"
	sort_order = 6
	accessory = list(/obj/item/clothing/accessory/ranks/senior_enlisted/e6)

/datum/mil_rank/exo/e7
	name = "Senior Chief Lance Starman"
	name_short = "SCLSP"
	sort_order = 7
	accessory = list(/obj/item/clothing/accessory/ranks/senior_enlisted/e7)

/datum/mil_rank/exo/o1
	name = "Ensign"
	name_short = "ENS"
	sort_order = 8
	accessory = list(/obj/item/clothing/accessory/ranks/officer/o1)

/datum/mil_rank/exo/o2
	name = "Sub-lieutenant"
	name_short = "SLT"
	sort_order = 9
	accessory = list(/obj/item/clothing/accessory/ranks/officer/o2)

/datum/mil_rank/exo/o3
	name = "Lieutenant"
	name_short = "LT"
	sort_order = 10
	accessory = list(/obj/item/clothing/accessory/ranks/officer/o3)

/datum/mil_rank/exo/o4
	name = "Lieutenant-Commander"
	name_short = "LTCR"
	sort_order = 11
	accessory = list(/obj/item/clothing/accessory/ranks/officer/o4)

/datum/mil_rank/exo/o5
	name = "Commander"
	name_short = "CDR"
	sort_order = 12
	accessory = list(/obj/item/clothing/accessory/ranks/officer/o5)

/datum/mil_rank/exo/o6
	name = "Captain"
	name_short = "CAPT"
	sort_order = 13
	accessory = list(/obj/item/clothing/accessory/ranks/command/o6)

/datum/mil_rank/exo/o7
	name = "Commodore"
	name_short = "CDRE"
	sort_order = 14
	accessory = list(/obj/item/clothing/accessory/ranks/command/o7)

/datum/mil_rank/exo/o8
	name = "Rear Admiral"
	name_short = "RADM"
	sort_order = 15
	accessory = list(/obj/item/clothing/accessory/ranks/command/o8)

/datum/mil_rank/exo/o9
	name = "Vice Admiral"
	name_short = "VADM"
	sort_order = 16
	accessory = list(/obj/item/clothing/accessory/ranks/command/o9)

/datum/mil_rank/exo/o10
	name = "Admiral"
	name_short = "ADM"
	sort_order = 17
	accessory = list(/obj/item/clothing/accessory/ranks/command/o10)

///CIVILIAN RANKS///

/datum/mil_rank/civ/civ
	name = "Civilian"

/datum/mil_rank/civ/contractor
	name = "Contractor"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"
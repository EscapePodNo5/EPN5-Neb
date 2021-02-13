//Unsorted, random shit goes here.

/obj/item/modular_computer/pda/security
	color = COLOR_BLACK
	decals = list(
		"stripe" = COLOR_NT_RED
	)

/obj/item/radio/headset/headset_bosun
	name = "bosun's radio headset"
	desc = "A headset used by the box-pushers's boss."
	icon_state = "cargo_headset"
	item_state = "headset"
	ks1type = /obj/item/encryptionkey/headset_bosun

/obj/item/encryptionkey/headset_bosun
	name = "supply radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Supply" = 1, "Service" = 1, "Command" = 1)

//cyclers.

/obj/machinery/suit_cycler/wolf
	boots = /obj/item/clothing/shoes/magboots
	req_access = list(access_eva)
	initial_access = list()

/obj/machinery/suit_cycler/wolf/engineering
	helmet = /obj/item/clothing/head/helmet/space/void/engineering
	suit = /obj/item/clothing/suit/space/void/engineering
	available_modifications = list(
		/decl/item_modifier/space_suit/engineering
	)


/obj/machinery/suit_cycler/wolf/engineering/atmos
	helmet = /obj/item/clothing/head/helmet/space/void/atmos
	suit = /obj/item/clothing/suit/space/void/atmos
	available_modifications = list(
		/decl/item_modifier/space_suit/atmos
	)

/obj/machinery/suit_cycler/wolf/security
	helmet =  /obj/item/clothing/head/helmet/space/void/security
	suit = /obj/item/clothing/suit/space/void/security
	available_modifications = list(
		/decl/item_modifier/space_suit/security
	)

/obj/machinery/suit_cycler/wolf/medical
	helmet = /obj/item/clothing/head/helmet/space/void/medical/alt
	suit = /obj/item/clothing/suit/space/void/medical/alt
	available_modifications = list(
		/decl/item_modifier/space_suit/medical
	)

/obj/machinery/suit_cycler/wolf/generic
	helmet = /obj/item/clothing/head/helmet/space
	suit = /obj/item/clothing/suit/space
	available_modifications = list(
		/decl/item_modifier/space_suit/medical
	)

/obj/machinery/suit_cycler/wolf/salvage
	helmet = /obj/item/clothing/head/helmet/space/void/mining
	suit = /obj/item/clothing/suit/space/void/mining
	available_modifications = list(
		/decl/item_modifier/space_suit/mining
	)

//Ship pet stuff below

/obj/random_multi/single_item/poppy
	name = "poppy spawn"
	id = "poppy"
	item_path = /mob/living/simple_animal/opossum/poppy

/obj/random_multi/single_item/runtime
	name = "runtime spawn"
	id = "runtime"
	item_path = /mob/living/simple_animal/cat/fluff/Runtime

/obj/random_multi/single_item/palmers
	name = "palmers spawn"
	id = "palmers"
	item_path = /mob/living/simple_animal/koala/palmers

/obj/random_multi/single_item/palmers
	name = "palmers spawn"
	id = "palmers"
	item_path = /mob/living/simple_animal/koala/palmers

/obj/random_multi/single_item/ian
	name = "ian spawn"
	id = "ian"
	item_path = /mob/living/simple_animal/corgi/Ian

/obj/random_multi/single_item/lisa
	name = "lisa spawn"
	id = "lisa"
	item_path = /mob/living/simple_animal/corgi/Lisa

/obj/random_multi/single_item/kovacs
	name = "kovacs spawn"
	id = "kovacs"
	item_path = /mob/living/simple_animal/crow/cyber/kovacs

/mob/living/simple_animal/koala/palmers
	name = "Executive Director Palmers"
	desc = "A lazy koala. Why is there a koala on the ship?"

/mob/living/simple_animal/crow/cyber/kovacs
	name = "Kovacs"
	desc = "A strange cyber crow. Caw."




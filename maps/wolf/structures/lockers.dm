/obj/structure/closet/secure_closet/armsmen
	name = "armsman's locker"
	req_access = list(access_brig)
	closet_appearance = /decl/closet_appearance/secure_closet/security

/obj/structure/closet/secure_closet/armsmen/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/sec, 50),
		/obj/item/clothing/head/helmet,
		/obj/item/radio/headset/headset_sec,
		/obj/item/storage/belt/holster/security,
		/obj/item/flash,
		/obj/item/chems/spray/pepper,
		/obj/item/grenade/chem_grenade/teargas,
		/obj/item/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/taperoll/police,
		/obj/item/hailer,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gun/energy/taser,
		/obj/item/holowarrant,
		/obj/item/clothing/suit/armor/pcarrier/medium
	)
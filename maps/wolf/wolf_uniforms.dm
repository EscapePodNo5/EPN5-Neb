/obj/item/clothing/under/wolf
	item_icons = list(slot_w_uniform_str = 'maps/wolf/icons/onmob_under.dmi')
	icon = 'maps/wolf/icons/uniforms.dmi'
	gender_icons = FALSE
	rolled_down = 0
	rolled_sleeves = 0

/obj/item/clothing/under/wolf/grey
	name = "grey jumpsuit"
	desc = "A utilitarian jumpsuit in grey. How typical."
	icon_state = "grey_obj"
	worn_state = "grey"

/obj/item/clothing/under/wolf/olive
	name = "olive jumpsuit"
	desc = "A utilitarian jumpsuit in olive drab. It feels like canvas, and is festooned with gear attachment points."
	icon_state = "olive_obj"
	worn_state = "olive"

/obj/item/clothing/under/wolf/white
	name = "white jumpsuit"
	desc = "A utilitarian jumpsuit in white. They feel like scrubs."
	icon_state = "white_obj"
	worn_state = "white"

/obj/item/clothing/under/wolf/black
	name = "reinforced jumpsuit"
	desc = "A utilitarian jumpsuit in a fetching black with kevlar inserts over vital organs."
	icon_state = "black_obj"
	worn_state = "black"

/obj/item/clothing/under/wolf/blue
	name = "blue jumpsuit"
	desc = "A utilitarian jumpsuit in a fancy blue color. Makes you feel calm and collected just looking at it."
	icon_state = "blue_obj"
	worn_state = "blue"

/obj/item/clothing/under/wolf/darkbrown
	name = "dark brown jumpsuit"
	desc = "A utilitarian jumpsuit in dark brown."
	icon_state = "brown_obj"
	worn_state = "brown"

/obj/item/clothing/under/wolf/tan
	name = "tan jumpsuit"
	desc = "A utilitarian jumpsuit in a tactical tan. It feels like it has insulation, and smells of engine grease."
	icon_state = "tan_obj"
	worn_state = "tan"

/obj/item/clothing/accessory/chevrons
	name = "rank chevrons"
	desc = "A set of chevrons denoting rank at a glance."
	slot = ACCESSORY_SLOT_RANK
	on_rolled = list("down" = "none", "rolled" = "chevron")
	accessory_icons = list(slot_w_uniform_str = 'maps/wolf/icons/rank_chevrons_onmob.dmi', slot_wear_suit_str = 'maps/wolf/icons/rank_chevrons_onmob.dmi')
	icon = 'maps/wolf/icons/rank_chevrons.dmi'
	icon_state = "chevron"

/obj/item/clothing/accessory/chevrons/engineering
	color = COLOR_ORANGE

/obj/item/clothing/accessory/chevrons/security
	color = COLOR_NT_RED

/obj/item/clothing/accessory/chevrons/cargo
	color = COLOR_BEASTY_BROWN

/obj/item/clothing/accessory/chevrons/command
	color = COLOR_SILVER

/obj/item/clothing/accessory/chevrons/science
	color = COLOR_VIOLET

/obj/item/clothing/accessory/chevrons/medical
	color = COLOR_SKY_BLUE

/obj/item/clothing/accessory/chevrons/captain
	color = COLOR_AMBER

/obj/item/clothing/accessory/dept_stripes
	name = "department stripes"
	desc = "A set of colored fabric with a hook-and-loop backing."
	slot = ACCESSORY_SLOT_DEPT
	on_rolled = list("down" = "none", "rolled" = "deptstripe_rolled")
	icon = 'maps/wolf/icons/dept_stripes.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/wolf/icons/dept_stripes_onmob.dmi', slot_wear_suit_str = 'maps/wolf/icons/dept_stripes_onmob.dmi')
	icon_state = "deptstripe"

/obj/item/clothing/accessory/dept_stripes/engineering
	color = COLOR_ORANGE

/obj/item/clothing/accessory/dept_stripes/security
	color = COLOR_NT_RED

/obj/item/clothing/accessory/dept_stripes/cargo
	color = COLOR_BEASTY_BROWN

/obj/item/clothing/accessory/dept_stripes/command
	color = COLOR_SILVER

/obj/item/clothing/accessory/dept_stripes/science
	color = COLOR_VIOLET

/obj/item/clothing/accessory/dept_stripes/medical
	color = COLOR_SKY_BLUE

/obj/item/clothing/accessory/dept_stripes/captain
	color = COLOR_AMBER
// Wrapper obj for cooked food. Appearance is set in the cooking code, not on spawn.
/obj/item/chems/food/snacks/variable
	name = "cooked food"
	icon = 'icons/obj/food_custom.dmi'
	desc = "If you can see this description then something is wrong. Please report the bug on the tracker."
	nutriment_amt = 5
	bitesize = 2
	filling_color = COLOR_BROWN

/obj/item/chems/food/snacks/variable/Initialize()
	. = ..()
	update_icon()

/obj/item/chems/food/snacks/variable/update_food_appearance_from(var/obj/item/donor, var/food_color, var/copy_donor_appearance = TRUE)
	..(donor, food_color, (type == /obj/item/chems/food/snacks/variable)) // variable is used for generic foods (deep fried X), subtypes are used for specific foods

/obj/item/chems/food/snacks/variable/pizza
	name = "personal pizza"
	desc = "A personalized pan pizza meant for only one person."
	icon_state = "personal_pizza"

/obj/item/chems/food/snacks/variable/bread
	name = "bread"
	desc = "Tasty bread."
	icon_state = "breadcustom"

/obj/item/chems/food/snacks/variable/pie
	name = "pie"
	desc = "Tasty pie."
	icon_state = "piecustom"

/obj/item/chems/food/snacks/variable/cake
	name = "cake"
	desc = "A popular band."
	icon_state = "cakecustom"

/obj/item/chems/food/snacks/variable/pocket
	name = "hot pocket"
	desc = "You wanna put a bangin- oh, nevermind."
	icon_state = "donk"
	filling_color = COLOR_BROWN

/obj/item/chems/food/snacks/variable/kebab
	name = "kebab"
	desc = "Food is just tastier on a stick!"
	icon_state = "kabob"
	filling_color = COLOR_DARK_RED

/obj/item/chems/food/snacks/variable/waffles
	name = "waffles"
	desc = "Made with love."
	icon_state = "waffles"
	gender = PLURAL

/obj/item/chems/food/snacks/variable/pancakes
	name = "pancakes"
	desc = "How does an oven make pancakes?"
	icon_state = "pancakescustom"
	gender = PLURAL

/obj/item/chems/food/snacks/variable/cookie
	name = "cookie"
	desc = "Sugar snap!"
	icon_state = "cookie"

/obj/item/chems/food/snacks/variable/donut
	name = "filled donut"
	desc = "Donut eat this!" // kill me
	icon_state = "donut"

/obj/item/chems/food/snacks/variable/jawbreaker
	name = "flavored jawbreaker"
	desc = "It's like cracking a molar on a rainbow."
	icon_state = "jawbreaker"
	filling_color = COLOR_RED

/obj/item/chems/food/snacks/variable/candybar
	name = "flavored chocolate bar"
	desc = "Made in a factory downtown."
	icon_state = "bar"
	filling_color = COLOR_DARK_BROWN

/obj/item/chems/food/snacks/variable/sucker
	name = "flavored sucker"
	desc = "Suck, suck, suck."
	icon_state = "sucker"
	filling_color = COLOR_RED

/obj/item/chems/food/snacks/variable/jelly
	name = "jelly"
	desc = "All your friends will be jelly."
	icon_state = "jellycustom"
	filling_color = COLOR_RED

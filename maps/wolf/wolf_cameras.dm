#define NETWORK_COMMAND "Command"
#define NETWORK_GNAT "Gnat"
#define NETWORK_FIRST_DECK "First Deck"
#define NETWORK_SECOND_DECK "Second Deck"
#define NETWORK_THIRD_DECK "Third Deck"
#define NETWORK_FOURTH_DECK "Bridge Deck"

/datum/map/wolf/get_network_access(var/network)
	switch(network)
		if(NETWORK_COMMAND)
			return access_heads
		if(NETWORK_GNAT)
			return access_cargo

	. = ..()

/datum/map/wolf
	station_networks = list(
		NETWORK_EXODUS,
		NETWORK_MINE,
		NETWORK_SECURITY,
		NETWORK_RESEARCH,
		NETWORK_MEDICAL,
		NETWORK_ENGINEERING,
		NETWORK_ROBOTS,
		NETWORK_ALARM_ATMOS,
		NETWORK_ALARM_CAMERA,
		NETWORK_ALARM_FIRE,
		NETWORK_ALARM_MOTION,
		NETWORK_ALARM_POWER,
		NETWORK_COMMAND,
		NETWORK_GNAT,
		NETWORK_FIRST_DECK,
		NETWORK_SECOND_DECK,
		NETWORK_THIRD_DECK,
		NETWORK_FOURTH_DECK)

/obj/machinery/camera/network/command
	network = list(NETWORK_COMMAND)

/obj/machinery/camera/network/gnat
	network = list(NETWORK_GNAT)

/obj/machinery/camera/network/first_deck
	network = list(NETWORK_FIRST_DECK)

/obj/machinery/camera/network/second_deck
	network = list(NETWORK_SECOND_DECK)

/obj/machinery/camera/network/third_deck
	network = list(NETWORK_THIRD_DECK)

/obj/machinery/camera/network/fourth_deck
	network = list(NETWORK_FOURTH_DECK)
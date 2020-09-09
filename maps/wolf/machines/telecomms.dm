//We don't really have enough space for a massive tcomms setup, so we just need five machines.
//HUB

/obj/machinery/telecomms/hub/wolf/preset
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub", "mainbus","receiverA", "broadcasterA")

//Buses

/obj/machinery/telecomms/bus/wolf/main
	id = "Main Bus"
	network = "tcommsat"
	freq_listening = list(SCI_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, SEC_FREQ, COMM_FREQ, ENG_FREQ, AI_FREQ, PUB_FREQ, ENT_FREQ)
	autolinkers = list("mainprocessor", "mainbus")

/obj/machinery/telecomms/bus/wolf/main/Initialize()
	. = ..()
	for(var/i = PUBLIC_LOW_FREQ, i < PUBLIC_HIGH_FREQ, i += 2)
		if(i == PUB_FREQ)
			continue
		freq_listening |= i

//Processors

/obj/machinery/telecomms/processor/wolf
	id = "Main Processor"
	network = "tcommsat"
	autolinkers = list("mainprocessor") // processors are sort of isolated; they don't need backward links

//These don't actually do anything, but if the mainframe looses them then PDC targeting accuracy goes to shit and eventually, stops the pdcs from firing altogether.

/obj/machinery/point_defense/point_defense_sensor
	name = "sensor node"
	desc = "An advanced sensor node capable of tracking rapidly moving objects, usually mounted in groups on ships for point defense."
	icon_state = "commdish"

	var/obj/machinery/point_defense/point_defense_computer/mainframe
	var/health = 100
	var/max_health = 100

	id_tag = "test"

/obj/machinery/point_defense/point_defense_sensor/Destroy()
	. = ..()
	mainframe.sensors -= src

/obj/machinery/point_defense/point_defense_sensor/proc/report_status()
	if(inoperable())
		return FALSE
	else
		return TRUE

/obj/machinery/point_defense/point_defense_sensor/Process()
	update_health()

/obj/machinery/point_defense/point_defense_sensor/proc/update_health()
	if(health <= 0)
		stat = BROKEN
		health = clamp(health, 0, max_health) //clamp it to 0 if we're negative.
	if(health > 0 && (stat & BROKEN))
		stat = 0 //fixed, start working again.

/obj/machinery/point_defense/point_defense_sensor/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	if(severity == 1)
		health = 0
		stat = BROKEN
	else
		health -= rand(5,15)
		update_health()


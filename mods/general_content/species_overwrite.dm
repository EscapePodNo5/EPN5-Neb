/datum/species/skills_from_age(age)	//Converts an age into a skill point allocation modifier. Can be used to give skill point bonuses/penalities not depending on job.
	switch(age)
		if(0 to 22) 	. = 8
		if(23 to 30) 	. = 8
		if(31 to 45)	. = 8
		else			. = 8
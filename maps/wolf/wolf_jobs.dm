/datum/map/wolf
	default_assistant_title = "Crewmember"
	allowed_jobs = list(
		/datum/job/wolf/command/captain,
		/datum/job/wolf/command/first_officer,
		/datum/job/wolf/security/SSC,
		/datum/job/wolf/engineering/CE,
		/datum/job/wolf/medical/CMO,
		/datum/job/wolf/science/TD,
		/datum/job/wolf/civilian/bosun,
		/datum/job/wolf/command/bridge_officer,
		/datum/job/assistant,
		/datum/job/wolf/security/brig_chief,
		/datum/job/wolf/security/armsmen,
		/datum/job/wolf/engineering/engineer,
		/datum/job/wolf/medical/medtech,
		/datum/job/wolf/medical/doctor,
		/datum/job/wolf/medical/pharmacist,
		/datum/job/wolf/science/research_tech,
		/datum/job/wolf/science/robotics,
		/datum/job/wolf/civilian/deck_hand,
		/datum/job/wolf/civilian/salvage_tech,
		/datum/job/wolf/civilian/chef,
		/datum/job/wolf/civilian/bartender,
		/datum/job/wolf/civilian/botanist,
		/datum/job/wolf/civilian/janitor
		)

//Command

/datum/job/wolf/command
	selection_color = COLOR_COMMAND_BLUE
	department_refs = list(DEPT_COMMAND)

/datum/job/wolf/command/captain
	title = "Captain"
	head_position = TRUE
	req_admin_notify = TRUE
	supervisors = "Exoplanetary Affairs Command"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/captain
	allowed_ranks = list(/datum/mil_rank/exo/o6)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_BASIC,
		SKILL_FINANCE  = SKILL_EXPERT,
		SKILL_PILOT    = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT =   SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 30

/datum/job/wolf/command/captain/get_description_blurb()
	var/desc = {"You are the Captain assigned to the USN Odyssey. In your hands is a significant investment of trust from Exoplanetary Affairs - and the lives of everyone on your ship.
	Lead them well, complete the mission, and come home alive. Your mission is to explore these dangerous border regions for resources the USN can use. Take flora and fauna samples, make contact with unknown colonies and races.
	In between, survive contact with those who might not be so friendly to outsiders. Your ship is highly capable - but only as much as the person leading it."}
	return desc


/datum/job/wolf/command/first_officer
	title = "First Officer"
	head_position = TRUE
	req_admin_notify = TRUE
	supervisors = "the Captain"
	access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
		access_heads,
		access_medical,
		access_engine,
		access_change_ids,
		access_ai_upload,
		access_eva,
		access_bridge,
		access_all_personal_lockers,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_construction,
		access_morgue,
		access_crematorium,
		access_kitchen,
		access_cargo,
		access_cargo_bot,
		access_mailsorting,
		access_qm,
		access_hydroponics,
		access_lawyer,
		access_chapel_office,
		access_library,
		access_research,
		access_mining,
		access_heads_vault,
		access_mining_station,
		access_hop,
		access_RC_announce,
		access_keycard_auth,
		access_gateway,
		access_external_airlocks
	)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/first_officer
	allowed_ranks = list(/datum/mil_rank/exo/o5)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_BASIC,
		SKILL_FINANCE  = SKILL_EXPERT,
		SKILL_PILOT    = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT =   SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 30

/datum/job/wolf/command/first_officer/get_description_blurb()
	var/desc = {"You are the First Officer aboard the USN Odyssey. You are the Captain's finger on the pulse of the crew, and the one who executes his orders by passing information down to
	the appropriate departments. You also handle personnel matters and disputes aboard the ship that Security does not need to be involved with. The Bosun is your right hand man, managing supplies
	and organizing salvage efforts. All service personnel report to them."}
	return desc

/datum/job/wolf/command/bridge_officer
	title = "Bridge Officer"
	alt_titles = list("Sensor Operator", "Helmsman")
	supervisors = "every head of staff"
	access = list(access_bridge, access_heads, access_security, access_RC_announce, access_keycard_auth, access_external_airlocks, access_eva)
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/wolf/bridge_officer
	allowed_ranks = list(/datum/mil_rank/exo/o1, /datum/mil_rank/exo/o2)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_BASIC,
		SKILL_PILOT    = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT =   SKILL_MAX,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 20

/datum/job/wolf/command/bridge_officer/get_description_blurb()
	var/desc = {"You are a bridge officer aboard the USN Odyssey. Not quite high enough on the chain of command to have any real power, your job lies in piloting the ship, operating sensors
	or just keeping watch over the bridge or CIC. You answer to every head of staff aboard the ship, so long as their orders are in the purview of your duties. Expect to spend much time watching
	blinking sensor screens or listening to the First Officer's orders."}
	return desc

/datum/job/wolf/security
	selection_color = COLOR_NT_RED
	department_refs = list(DEPT_SECURITY)
	supervisors = "the Security Commander"

/datum/job/wolf/security/SSC
	title = "Ship Security Commander"
	department_refs = list(DEPT_COMMAND,DEPT_SECURITY)
	head_position = TRUE
	req_admin_notify = TRUE
	supervisors = "the Captain and the First Officer"
	access = list(access_security,
		access_brig,
		access_sec_doors,
		access_forensics_lockers,
		access_armory,
		access_bridge,
		access_heads,
		access_security,
		access_RC_announce,
		access_keycard_auth,
		access_hos,
		access_medical,
		access_engine,
		access_cargo,
		access_research,
		access_external_airlocks,
		access_maint_tunnels,
		access_eva,
		access_sec_doors
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/SSC
	allowed_ranks = list(/datum/mil_rank/exo/o3)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_FORENSICS = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_EVA = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 24

/datum/job/wolf/security/SSC/get_description_blurb()
	var/desc = {"You are the Ship Security Commander aboard the USN Odyssey. Chosen for your ability to lead or your skills, you've been placed in charge of the ship's security. A serious task
	considering where it's main area of operations is. Under your purview are a handful of security staff, and the power to deputize anyone who you see fit. Your underlings man it's weapons, and keep the crew in good order.
	When in combat, you may be right by their side repelling boarders - and watching them die. Give your orders carefully, for life is precious on the frontier."}
	return desc

/datum/job/wolf/security/brig_chief
	title = "Brig Chief"
	alt_titles = list("Senior Armsman")
	access = list(access_security, access_brig, access_sec_doors, access_forensics_lockers, access_armory, access_external_airlocks, access_maint_tunnels, access_eva)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/security/brig_chief
	allowed_ranks = list(/datum/mil_rank/exo/e5)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_FORENSICS = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_WEAPONS = SKILL_EXPERT,
		SKILL_EVA = SKILL_EXPERT,
		SKILL_FORENSICS = SKILL_EXPERT,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 20

/datum/job/wolf/security/brig_chief/get_description_blurb()
	var/desc = {"You are the Brig Chief aboard the USN Odyssey. Your job is to watch over the brig and armory while maintaining a careful eye on any crew or captured individuals who've been placed
	within your brig. When the situation requires it, your job also mandates that you open the ship's armory and hand out weapons to the Armsmen or those the HoS has deputized to act in defense of the ship.
	Additionally, your duties include making sure the brig is well-supplied for any occasion - be it mundane items like food and ammo, to medical supplies for when the floors are red with blood."}
	return desc

/datum/job/wolf/security/armsmen
	title = "Armsman"
	access = list(access_security, access_brig, access_sec_doors, access_forensics_lockers, access_external_airlocks, access_maint_tunnels, access_eva)
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/wolf/security/armsman
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_FORENSICS = SKILL_BASIC
	)
	max_skill = list(
		SKILL_WEAPONS = SKILL_EXPERT,
		SKILL_EVA = SKILL_MAX,
		SKILL_FORENSICS = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 16

/datum/job/wolf/security/armsmen/get_description_blurb()
	var/desc = {"You are an Armsman aboard the USN Odyssey. A fancy word for a hired gun - You might be exmilitary or some career member of EXO. Your job is to keep the crew in order and arrest any who violate ship's regulations, and to defend the ship by
	repelling boarders, operating weaponry and in general acting as a security force for any occasion, including away missions to gather supplies or explore exoworlds. Your life is hardly expendable
	for there is no easy way back from death on the Frontier. Consider your actions carefully - and remember, without the ship, nobody goes home."}
	return desc

/datum/job/wolf/security/gunship_pilot
	title = "Gunship Pilot"
	access = list(access_security, access_brig, access_sec_doors, access_forensics_lockers, access_external_airlocks, access_maint_tunnels, access_eva)
	total_positions = 0
	spawn_positions = 0
	outfit_type = 	/decl/hierarchy/outfit/job/wolf/security/gunship_pilot

/datum/job/wolf/security/gunship_pilot/get_description_blurb()
	var/desc = {"You are a Gunship Pilot aboard the USN Odyssey. The chances are that either you showed enough aptitude in a simulator for FENRIS to pay your way in exchange for a contract,
	or you are ex-military aviation. Regardless of your origins, your job is to pilot the ship's gunship, designed to support the Odyssey in combat, or deliver boarding parties when required.
	You are not front-line personnel. In an emergency, you may be pressed into service, but your job is first and foremost to fly the gunship, and maybe the ship's salvage shuttle."}
	return desc

/datum/job/wolf/engineering
	selection_color = COLOR_AMBER
	department_refs = list(DEPT_ENGINEERING)
	supervisors = "the Chief Engineer"
	outfit_type = 	/decl/hierarchy/outfit/job/wolf/engineering

/datum/job/wolf/engineering/CE
	title = "Chief Engineer"
	department_refs = list(DEPT_COMMAND,DEPT_ENGINEERING)
	access = list()
	head_position = TRUE
	req_admin_notify = TRUE
	supervisors = "the Captain and the First Officer"
	access = list(
		access_atmospherics,
		access_engine,
		access_tech_storage,
		access_external_airlocks,
		access_maint_tunnels,
		access_engine_equip,
		access_construction,
		access_eva,
		access_network,
		access_ce,
		access_tcomsat,
		access_bridge,
		access_heads,
		access_security,
		access_RC_announce,
		access_keycard_auth
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/CE
	allowed_ranks = list(/datum/mil_rank/exo/o3)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_ENGINES = SKILL_ADEPT,
		SKILL_COMPUTER = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_ELECTRICAL = SKILL_ADEPT,
		SKILL_ATMOS = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_EVA = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 24

/datum/job/wolf/engineering/CE/get_description_blurb()
	var/desc = {"You are the Chief Engineer aboard the USN Odyssey. You are a highly skilled professional at least somewhat understanding of how to coordinate a team of enginers to maintain,
	repair and run a ship like the Odyssey. Given the high-tech nature of many of it's systems, you are likely to be highly educated - or have significant hands-on experience."}
	return desc


/datum/job/wolf/engineering/engineer
	title = "Engineer"
	alt_titles = list("Atmospheric Technician", "Maintenance Technician", "Damage Control Technician")
	access = list(
		access_atmospherics,
		access_engine,
		access_tech_storage,
		access_external_airlocks,
		access_maint_tunnels,
		access_engine_equip,
		access_construction,
		access_eva,
		access_engine_equip
		)
	total_positions = 3
	spawn_positions = 3
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_ENGINES = SKILL_BASIC,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL = SKILL_BASIC,
		SKILL_ATMOS = SKILL_BASIC
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_ENGINES = SKILL_EXPERT,
		SKILL_COMPUTER = SKILL_EXPERT,
		SKILL_CONSTRUCTION = SKILL_EXPERT,
		SKILL_ELECTRICAL = SKILL_EXPERT,
		SKILL_ATMOS = SKILL_EXPERT,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX
	)

/datum/job/wolf/engineering/engineer/get_description_blurb()
	var/desc = {"You are an Engineer aboard the USN Odyssey. A rough and tumble greasemonkey, or a nerd more comfortable with computer systems than fighting, it doesn't matter. You've been hired
	to maintain, repair, and run the Odyssey and execute the Chief Engineer's orders, be those painting the hull or remodeling a department. Your field of expertise and role may vary depending
	on your level of experience, but you're part of the ship's engineering complement - and you can probably tell when something's wrong with her just by the sounds she makes."}
	return desc

/datum/job/wolf/medical
	selection_color = "#92e7fc"
	department_refs = list(DEPT_MEDICAL)
	supervisors = "the Chief Medical Officer"

/datum/job/wolf/medical/CMO
	title = "Chief Medical Officer"
	department_refs = list(DEPT_COMMAND,DEPT_MEDICAL)
	access = list()
	head_position = TRUE
	req_admin_notify = TRUE
	supervisors = "the Captain and the First Officer"
	access = list(
		access_medical,
		access_surgery,
		access_medical_equip,
		access_crematorium,
		access_morgue,
		access_eva,
		access_maint_tunnels,
		access_external_airlocks,
		access_cmo,
		access_chemistry,
		access_bridge,
		access_heads,
		access_security,
		access_RC_announce,
		access_keycard_auth
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/CMO
	allowed_ranks = list(/datum/mil_rank/exo/o4)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_MEDICAL = SKILL_ADEPT,
		SKILL_ANATOMY = SKILL_ADEPT,
		SKILL_CHEMISTRY = SKILL_ADEPT,
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_MEDICAL = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 30

/datum/job/wolf/medical/CMO/get_description_blurb()
	var/desc = {"You are the Chief Medical Officer aboard the USN Odyssey. Your job is to keep the crew alive and reasonably healthy within your abilities. You oversee the medical department and
	coordinate rescue efforts when in combat, or providing aid to ships in need. You are not front-line personnel - your skills are better used in medical, patching up those who get dragged in from the
	front lines. As the Chief Medical Officer, you are also required to be keenly aware of the crew's overall mental health - and advise the Captain accordingly."}
	return desc


/datum/job/wolf/medical/medtech
	title = "Medical Support Technician"
	alt_titles = list("Corpsman", "Paramedic")
	access = list(
		access_medical,
		access_surgery,
		access_medical_equip,
		access_crematorium,
		access_morgue,
		access_eva,
		access_maint_tunnels,
		access_external_airlocks,
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/medical/medtech
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_EVA = SKILL_ADEPT,
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_MEDICAL = SKILL_BASIC,
		SKILL_ANATOMY = SKILL_BASIC,
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_MEDICAL = SKILL_EXPERT,
		SKILL_ANATOMY = SKILL_EXPERT,
		SKILL_CHEMISTRY = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 20

/datum/job/wolf/medical/medtech/get_description_blurb()
	var/desc = {"You are the Medical Support Technician aboard the USN Odyssey. Your job is to function as a mix between a doctor and paramedic. You exist to rescue people who are in dangerous situations
	who may be injured and in need of urgent medical attention. To this end, you have specialized gear and training that means you are fully capable of preforming EVA rescues in and out of combat.
	You are the front line for those in need. Doctors may accompany you, but they don't have your training and your skills."}
	return desc

/datum/job/wolf/medical/doctor
	title = "Medical Doctor"
	access = list(
		access_medical,
		access_surgery,
		access_medical_equip,
		access_crematorium,
		access_morgue,
		access_eva,
		access_maint_tunnels,
		access_external_airlocks,
		)
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/wolf/medical/doctor
	allowed_ranks = list(/datum/mil_rank/exo/o3, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_MEDICAL = SKILL_BASIC,
		SKILL_ANATOMY = SKILL_BASIC,
		SKILL_CHEMISTRY = SKILL_BASIC,
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_MEDICAL = SKILL_EXPERT,
		SKILL_ANATOMY = SKILL_EXPERT,
		SKILL_CHEMISTRY = SKILL_EXPERT,
		SKILL_HAULING = SKILL_EXPERT
	)
	skill_points = 26

/datum/job/wolf/medical/doctor/get_description_blurb()
	var/desc = {"You are a Medical Doctor aboard the USN Odyssey. Hired to patch up the gun-slingers and greasemonkeys that run this ship and inevitably get injured in combat, your job is to mind
	the medical bay and keep everything nice and tidy - while waiting for the bodies to roll in. When the going gets tough, you're expected to work under pressure and in conditions that are not ideal.
	The Medbay is somewhat limited in space - so you'll have to keep this in mind when running triage or treating a large volume of patients."}
	return desc

/datum/job/wolf/medical/pharmacist
	title = "Pharmacist"
	access = list(
		access_medical,
		access_medical_equip,
		access_surgery,
		access_chemistry,
		access_eva,
		access_maint_tunnels,
		access_external_airlocks
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/medical/pharmacist
	allowed_ranks = list(/datum/mil_rank/exo/o1, /datum/mil_rank/exo/o2, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_MEDICAL = SKILL_BASIC,
		SKILL_ANATOMY = SKILL_BASIC,
		SKILL_CHEMISTRY = SKILL_ADEPT,
	)
	max_skill = list(
		SKILL_EVA = SKILL_ADEPT,
		SKILL_MEDICAL = SKILL_ADEPT,
		SKILL_ANATOMY = SKILL_ADEPT,
		SKILL_CHEMISTRY = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 16

/datum/job/wolf/medical/pharmacist/get_description_blurb()
	var/desc = {"You are the Pharmacist aboard the USN Odyssey, placed in charge of the Chemistry Lab. Your main function is to make sure Medbay is supplied with a steady stream of useful medicines
	to keep the crew alive with. You also serve as a general dispensary for industrial chemicals that may be required around the ship for various functions. Expect to need to deal with the crew's
	prescriptions as well, and occasionally assist medical in times of crisis with certain minor tasks. You're not a doctor, keep that in mind."}
	return desc

/datum/job/wolf/science
	selection_color = COLOR_VIOLET
	department_refs = list(DEPT_EXPLORATION)

/datum/job/wolf/science/TD
	title = "Technology Director"
	department_refs = list(DEPT_COMMAND,DEPT_EXPLORATION)
	head_position = TRUE
	req_admin_notify = TRUE
	supervisors = "the Captain and the First Officer"
	alt_titles = list("Chief Science Officer")
	access = list(
		access_research,
		access_xenoarch,
		access_xenobiology,
		access_robotics,
		access_tox,
		access_tox_storage,
		access_eva,
		access_maint_tunnels,
		access_external_airlocks,
		access_rd,
		access_tech_storage,
		access_network,
		access_bridge,
		access_heads,
		access_security,
		access_RC_announce,
		access_keycard_auth
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/TD
	allowed_ranks = list(/datum/mil_rank/exo/o3)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_BASIC,
		SKILL_COMPUTER = SKILL_ADEPT,
		SKILL_DEVICES = SKILL_ADEPT,
		SKILL_SCIENCE = SKILL_ADEPT,
		SKILL_ANATOMY = SKILL_BASIC,
		SKILL_CHEMISTRY = SKILL_BASIC,
		SKILL_MECH = SKILL_BASIC,
		SKILL_PILOT = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX,
		SKILL_PILOT = SKILL_ADEPT
	)
	skill_points = 26


/datum/job/wolf/science/TD/get_description_blurb()
	var/desc = {"You are the Technology Director aboard the USN Odyssey. Almost a token position, all things considered, given the fact that it is a converted warship. Regardless, you do have a role to
	fulfill. You are placed in charge of directing the Salvage Technicians to recover any technology that may be of interest for research and development - or sold for a pretty penny by your
	bosses when the ship docks. You are additionally in charge of making sure all the departments have the machinery and parts they need to function correctly - and of course, the ship's network."}
	return desc

/datum/job/wolf/science/research_tech
	title = "Research Technician"
	alt_titles = list("Xenobiologist", "Xenoarcheologist", "Xenobotanist")
	supervisors = "the Technology Director"
	access = list(
		access_research,
		access_xenoarch,
		access_xenobiology,
		access_robotics,
		access_tox,
		access_tox_storage,
		access_eva,
		access_maint_tunnels,
		access_external_airlocks,
		access_tech_storage
		)
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/wolf/research/research_tech
	allowed_ranks = list(/datum/mil_rank/exo/o1, /datum/mil_rank/exo/o2, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_BASIC,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_DEVICES = SKILL_BASIC,
		SKILL_SCIENCE = SKILL_BASIC,
		SKILL_ANATOMY = SKILL_BASIC,
		SKILL_CHEMISTRY = SKILL_BASIC,
		SKILL_MECH = SKILL_BASIC,
		SKILL_PILOT = SKILL_BASIC
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_COMPUTER = SKILL_EXPERT,
		SKILL_DEVICES = SKILL_EXPERT,
		SKILL_SCIENCE = SKILL_EXPERT,
		SKILL_ANATOMY = SKILL_EXPERT,
		SKILL_CHEMISTRY = SKILL_EXPERT,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX,
		SKILL_PILOT = SKILL_ADEPT
	)
	skill_points = 20

/datum/job/wolf/science/research_tech/get_description_blurb()
	var/desc = {"You are a Research Technician aboard the USN Odyssey. Grants are hard to get, and a bunk on a proper science ship even harder to get. Sometimes you have to compromise. You are here
	to either find whatever you can while the ship patrols, or hired by the USN to assist the Technology Director in their mission of making sure that the ship's machinery and such are functioning
	at peak preformance. You may additional persue your academic desires, given the blessing of the Captain."}
	return desc

/datum/job/wolf/science/robotics
	title = "Robotics Specialist"
	access = list(
		access_research,
		access_robotics,
		access_maint_tunnels,
		access_tech_storage
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/research/robotics
	allowed_ranks = list(/datum/mil_rank/exo/o1, /datum/mil_rank/exo/o2, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_BASIC,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_DEVICES = SKILL_BASIC,
		SKILL_SCIENCE = SKILL_BASIC,
		SKILL_ANATOMY = SKILL_BASIC,
		SKILL_MECH = SKILL_ADEPT,
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_COMPUTER = SKILL_EXPERT,
		SKILL_DEVICES = SKILL_EXPERT,
		SKILL_SCIENCE = SKILL_EXPERT,
		SKILL_ANATOMY = SKILL_ADEPT,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 20

/datum/job/wolf/science/robotics/get_description_blurb()
	var/desc = {"You are the Robotics Specialist aboard the USN Odyssey. Given the tendency for full-body-prosthetic crew members and unlawed IPCs to take damage during combat - be it boarding
	or just being in the wrong place at the wrong time, you exist to maintain and repair these crew members, as well as build mechs when required to do so. You work very closely with medical,
	as you are not a surgeon, and your work may involve cyborgification operations. You do get a snazzy jumpsuit, too."}
	return desc

/datum/job/wolf/civilian
	selection_color = COLOR_BEASTY_BROWN
	department_refs = list(DEPT_SUPPLY)
	supervisors = "the Bosun"

/datum/job/wolf/civilian/bosun
	title = "Bosun"
	department_refs = list(DEPT_COMMAND,DEPT_SUPPLY)
	head_position = TRUE
	req_admin_notify = TRUE
	alt_titles = list("Quartermaster")
	supervisors = "the Captain and the First Officer"
	access = list(
		access_mailsorting,
		access_cargo,
		access_cargo_bot,
		access_manufacturing,
		access_mining,
		access_mining_office,
		access_mailsorting,
		access_maint_tunnels,
		access_external_airlocks,
		access_eva,
		access_qm,
		access_bridge,
		access_heads,
		access_security,
		access_RC_announce,
		access_keycard_auth,
		)

	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/bosun
	allowed_ranks = list(/datum/mil_rank/exo/e6, /datum/mil_rank/exo/e7)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_FINANCE = SKILL_ADEPT,
		SKILL_EVA = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL = SKILL_BASIC,
		SKILL_COOKING = SKILL_BASIC,
		SKILL_BOTANY = SKILL_BASIC,
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_EXPERT,
		SKILL_ELECTRICAL = SKILL_EXPERT,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 20

/datum/job/wolf/civilian/bosun/get_description_blurb()
	var/desc = {"You are the Bosun aboard the USN Odyssey. Your job is to oversee all the civilian functions of the ship, and ensure that supplies are evenly, and quickly distributed.
	You also oversee the bar, kitchen, and botany. It is your job to make sure these departments are functioning appropriately and have the materials they need to keep the crew fat and happy.
	Additionally, you oversee the Deck Hands who run cargo, and give the Salvage Teams their missions. You are finger keeping the pulse on the ship's crew - and should advise the Captain about
	their morale whenever you see it fit."}
	return desc

/datum/job/wolf/civilian/deck_hand
	title = "Deck Hand"
	alt_titles = list("Deck Technician")
	access = list(
		access_mailsorting,
		access_cargo,
		access_cargo_bot,
		access_manufacturing,
		access_mining,
		access_mining_office,
		access_mailsorting,
		access_maint_tunnels,
		access_external_airlocks,
		access_eva
		)
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/wolf/cargo/deck_hand
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_FINANCE = SKILL_BASIC,
		SKILL_EVA = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL = SKILL_BASIC,
		SKILL_COOKING = SKILL_BASIC,
		SKILL_BOTANY = SKILL_BASIC,
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_FINANCE = SKILL_EXPERT,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_ELECTRICAL = SKILL_ADEPT,
		SKILL_HAULING = SKILL_MAX
	)
	skill_points = 16

/datum/job/wolf/civilian/deck_hand/get_description_blurb()
	var/desc = {"You are a Deck Hand aboard the USN Odyssey. Your job is to organize and manage the mess that is the Cargo bay, storing materials and running the commissary to sell goods to the crew
	. Keep in mind that the goods in the comissary aren't free for you. You also deliver supplies across the ship to any department that asks for them. You may be called on to assist on any expeditions,
	or to work on a fabrication order for a department like Engineering."}
	return desc

/datum/job/wolf/civilian/salvage_tech
	title = "Salvage Technician"
	alt_titles = list("Drill Technician", "Prospector")
	access = list(
		access_mailsorting,
		access_cargo,
		access_cargo_bot,
		access_manufacturing,
		access_mining,
		access_mining_office,
		access_mailsorting,
		access_maint_tunnels,
		access_external_airlocks,
		access_eva
		)
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/wolf/cargo/deck_hand
	allowed_ranks = list(/datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL = SKILL_BASIC,
		SKILL_PILOT = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_EVA = SKILL_EXPERT,
		SKILL_MECH = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_EXPERT,
		SKILL_ELECTRICAL = SKILL_EXPERT,
		SKILL_HAULING = SKILL_MAX,
		SKILL_PILOT = SKILL_EXPERT
	)
	skill_points = 16

/datum/job/wolf/civilian/salvage_tech/get_description_blurb()
	var/desc = {"You are a Salvage Technician aboard the USN Odyssey. Exoplanetary Affairs expects the ship's main source of materials to be from valuable materials and technologies recovered from ships the Odyssey
	engages in combat and hopefully defeats - or things just looted from wrecks. Your job is to go into these potentially hostile enviroments - with or without protection - and acquire these resources.
	As the Odyssey's resources are limited, if it sustains any damage, the responsibility for repair materials lies on your shoulders. You may occasionally be called on to do some mining."}
	return desc

/datum/job/wolf/civilian/chef
	title = "Mess Cook"
	alt_titles = list("Chef")
	selection_color = "#8bc95b"
	access = list(
		access_hydroponics,
		access_kitchen,
		access_bar,
		access_maint_tunnels
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/chef
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_COOKING = SKILL_ADEPT,
		SKILL_BOTANY = SKILL_BASIC,
		SKILL_HAULING = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_COOKING = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_BOTANY = SKILL_EXPERT
	)
	skill_points = 16

/datum/job/wolf/civilian/chef/get_description_blurb()
	var/desc = {"You are the Mess Cook aboard the USN Odyssey. Your job is to keep the crew fat and happy by providing at least somewhat servicable food to them. You're not expected to be the best
	at your job, but you are expected to be able to feed the crew without making anyone sick or killing them. Anticipate working closely with the Bosun and Botany to see to the needs of the crew,
	and stare moodily across the mess hall at the bartender who seems to be getting all the attention - and tips."}
	return desc

/datum/job/wolf/civilian/bartender
	title = "Bartender"
	selection_color = "#8bc95b"
	access = list(
		access_hydroponics,
		access_kitchen,
		access_bar,
		access_maint_tunnels
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/bartender
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_COOKING = SKILL_BASIC,
		SKILL_BOTANY = SKILL_BASIC,
		SKILL_HAULING = SKILL_ADEPT,
		SKILL_CHEMISTRY = SKILL_BASIC
	)
	max_skill = list(
		SKILL_COOKING = SKILL_EXPERT,
		SKILL_BOTANY = SKILL_EXPERT,
		SKILL_HAULING = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_EXPERT
	)
	skill_points = 16

/datum/job/wolf/civilian/bartender/get_description_blurb()
	var/desc = {"You are the Bartender aboard the USN Odyssey. Your job is to keep the crew's Alcohol Blood Level at a place where they're nice and happy, and willing to forget the fact that
	none of them have proper bedrooms and the meals aren't quite up to par with what you'd find even on the worst space stations. You also need to refill the bar peanuts, now and again. Do they even exist?
	Regardless of the existence of bar peanuts, you're to serve drinks to the crew to keep them happy, and be the faceless bartender they can vent their woes too when it comes down to that."}
	return desc

/datum/job/wolf/civilian/botanist
	title = "Botanist"
	selection_color = "#8bc95b"
	access = list(
		access_hydroponics,
		access_kitchen,
		access_bar,
		access_maint_tunnels
		)
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/botanist
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_BOTANY = SKILL_ADEPT,
		SKILL_HAULING = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_HAULING = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX
	)
	skill_points = 16

/datum/job/wolf/civilian/botanist/get_description_blurb()
	var/desc = {"You are the Botanist aboard the USN Odyssey. Your job is to make sure the crew has plenty of fresh produce to keep them happy and healthy. Space scurvy would be pretty bad, wouldn't it?
	Expect to work with the chef and bartender routinely to attend to the needs of the crew, and deal with special requests from the Bosun or First Officer for anything the heads of staff might want."}
	return desc

/datum/job/wolf/civilian/janitor
	title = "Janitor"
	selection_color = "#8bc95b"
	access = list(
		access_maint_tunnels,
		access_janitor
		)

	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/wolf/janitor
	allowed_ranks = list(/datum/mil_rank/exo/e3, /datum/mil_rank/exo/e4, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs, /datum/mil_branch/civilian)

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_HAULING = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL = SKILL_BASIC
	)
	max_skill = list(
		SKILL_HAULING = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_EXPERT,
		SKILL_ELECTRICAL = SKILL_EXPERT,
	)
	skill_points = 16

/datum/job/wolf/civilian/janitor/get_description_blurb()
	var/desc = {"You are the Janitor aboard the USN Odyssey. A simple job, but a never the less vital one. Your job is to keep the ship clean during routine life - replace bulbs, and preform general maintenance
	Anything Engineering is too busy to handle, you should be doing. In the aftermath of battle, of course, your services are vital for keeping areas like Medbay clear of blood and reducing the
	risk of infection."}
	return desc

/datum/job/assistant
	title = "Crewmember"
	alt_titles = list("Trainee Crewmember")
	hud_icon = "hudcargotechnician"
	allowed_ranks = list(/datum/mil_rank/exo/e2, /datum/mil_rank/exo/e3)
	allowed_branches = list(/datum/mil_branch/exoplanetary_affairs)
	skill_points = 16

	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA = SKILL_ADEPT,
		SKILL_HAULING = SKILL_ADEPT,
	)

	max_skill = list(
		SKILL_HAULING = SKILL_MAX
	)

/datum/job/assistant/get_description_blurb()
	var/desc = {"You're a Crewmember aboard the USN Odyssey. Your answer to absolutely everyone. You are a jack of all trades but master of none, answering directly to literally everyone with a preference
	towards the Bosun. You're largely here are spare manpower for expeditions and for Security to call on when needed."}
	return desc

/datum/job/passenger
	title = "Passenger"
	hud_icon = "hudcargotechnician"
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	allowed_branches = list(/datum/mil_branch/civilian)
	skill_points = 8

/datum/job/passenger/get_description_blurb()
	var/desc = {"You're a passenger aboard the USN Odyssey. You answer to everyone. You are probably here to sight-see and observe the inner workings of a ship, and generally make a nuisance of yourself."}
	return desc
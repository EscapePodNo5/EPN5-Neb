/area/ship/wolf
	name = "\improper Generic Ship"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	icon = 'maps/wolf/icons/areas.dmi'

//Engineering

/area/ship/wolf/engineering
	name = "Engineering Bay"
	icon_state = "enghall"
	req_access = list(access_engine)

/area/ship/wolf/engineering/secure_storage
	name = "Secure Storage"
	icon_state = "secstore"
	req_access = list(access_engine)

/area/ship/wolf/engineering/engine_room
	name = "\improper Engine Monitoring Room"
	icon_state = "engineroom"
	req_access = list(access_engine, access_engine_equip)

/area/ship/wolf/engineering/smes
	name = "\improper Primary Power Storage"
	icon_state = "smes"
	req_access = list(access_engine, access_engine_equip)

/area/ship/wolf/engineering/fuel_bay
	icon_state = "fuelbay"

/area/ship/wolf/engineering/fuel_bay/co2
	name = "\improper Propellant Storage Bay"

/area/ship/wolf/engineering/hallway
	icon_state = "enghall"
	name = "\improper Engineering Hallway"
	req_access = list(access_engine)

/area/ship/wolf/engineering/hallway/upper
	name = "\improper Upper Engineering Hallway"
	req_access = list(access_engine)

/area/ship/wolf/engineering/utility_shaft
	name = "\improper Utility Shaft"
	icon_state = "utilityshaft"

/area/ship/wolf/engineering/solars
	name = "\improper Bridge Solar Array"
	icon_state = "solars"

/area/ship/wolf/engineering/shield_generator
	name = "\improper Primary Shield Generator"
	icon_state = "shieldgen"

/area/ship/wolf/engineering/reactor
	name = "\improper Primary Reactor Core"
	icon_state = "reactor"
	req_access = list(access_engine, access_engine_equip)

/area/ship/wolf/engineering/atmospherics
	icon_state = "atmos"
	name = "\improper Atmospherics"
	req_access = list(access_engine, access_atmospherics)

/area/ship/wolf/engineering/atmospherics/pump_room
	name = "Coolant Pump Bay"
	req_access = list(access_engine, access_engine_equip)

/area/ship/wolf/engineering/atmospherics/monitoring_room
	name = "Atmospherics Monitoring Room"

/area/ship/wolf/engineering/EVA
	name = "\improper EVA Bay"
	icon_state = "EVA"
	req_access = list(access_engine)

/area/ship/wolf/engineering/substation
	icon_state = "substation"

/area/ship/wolf/engineering/substation/one
	name = "\improper First Deck Substation"

/area/ship/wolf/engineering/substation/two
	name = "\improper Second Deck Substation"

/area/ship/wolf/engineering/substation/three
	name = "\improper Third Deck Substation"

/area/ship/wolf/engineering/substation/four
	name = "\improper Bridge Deck Substation"

/area/ship/wolf/engineering/thruster_bay
	icon_state = "thrustbay"

/area/ship/wolf/engineering/thruster_bay/one
	name = "\improper First Deck Thruster Bay"

/area/ship/wolf/engineering/thruster_bay/two
	name = "\improper Third Deck Thruster Bay"

/area/ship/wolf/engineering/inertial_damper
	name = "Inertial Damper Bay"
	icon_state = "damper"

//Habitation

/area/ship/wolf/habitation
	icon_state = "habitation"

/area/ship/wolf/habitation/gentool
	icon_state = "gentool"
	name = "General Tool Storage"

/area/ship/wolf/habitation/bar
	icon_state = "bar"
	name = "\improper Mess Hall"

/area/ship/wolf/habitation/bar/backroom
	icon_state = "barback"
	name = "Bar Backroom"
	req_access = list(access_bar)

/area/ship/wolf/habitation/kitchen
	icon_state = "kitchen"
	name = "\improper Kitchen"
	req_access = list(access_kitchen)

/area/ship/wolf/habitation/bathroom
	icon_state = "bathroom"

/area/ship/wolf/habitation/bathroom/one
	name = "\improper Third Deck Bathroom"

/area/ship/wolf/habitation/bathroom/two
	name = "\improper Second Deck Bathroom"

/area/ship/wolf/habitation/hydroponics
	icon_state = "hydroponic"
	name = "\improper Hydroponics Bay"
	req_access = list(access_hydroponics)

/area/ship/wolf/habitation/cabins
	icon_state = "cabin"

/area/ship/wolf/habitation/cabins/one
	name = "\improper Cabin One"

/area/ship/wolf/habitation/cabins/two
	name = "\improper Cabin Two"

/area/ship/wolf/habitation/cabins/three
	name = "\improper Cabin Three"

/area/ship/wolf/habitation/cabins/four
	name = "\improper Cabin Four"

/area/ship/wolf/habitation/cryo
	icon_state = "cryo"

/area/ship/wolf/habitation/cryo/one
	name = "Cryo Bay One"

/area/ship/wolf/habitation/cryo/two
	name = "Cryo Bay Two"

/area/ship/wolf/habitation/observation
	name = "Observation Lounge"
	icon_state = "observation"

/area/ship/wolf/habitation/garden
	name = "Garden"
	icon_state = "garden"

//Security

/area/ship/wolf/security
	icon_state = "sec"
	name = "Security"
	req_access = list(access_sec_doors)

/area/ship/wolf/security/lockers
	name = "Locker Room"
	icon_state = "lockers"
	req_access = list(access_sec_doors, access_brig)

/area/ship/wolf/security/maa_office
	icon_state = "maa"
	name = "\improper Brig Chief's Office"
	req_access = list(access_armory, access_brig, access_sec_doors)

/area/ship/wolf/security/armory
	icon_state = "armory"
	name = "\improper Armory"
	req_access = list(access_armory)

/area/ship/wolf/security/weapons_bay
	icon_state = "weaponsbay"
	req_access = list(access_security)

/area/ship/wolf/security/weapons_bay/two
	name = "\improper Torpedo Bay One"

/area/ship/wolf/security/weapons_bay/three
	name = "\improper Main Weapons Bay"

/area/ship/wolf/security/hallway/weapons_bay/port
	name = "\improper Port Weapons Bay Access"

/area/ship/wolf/security/hallway/weapons_bay/starboard
	name = "\improper Starboard Weapons Bay Access"

//Medical

/area/ship/wolf/medical
	icon_state = "medbay"
	name = "\improper Medbay"
	req_access = list(access_medical)

/area/ship/wolf/medical/treatment
	icon_state = "etc"
	name = "\improper Treatment Center"

/area/ship/wolf/medical/operating
	icon_state = "or"

/area/ship/wolf/medical/operating/one
	name = "\improper Operating Room One"

/area/ship/wolf/medical/operating/two
	name = "\improper Operating Room Two"

/area/ship/wolf/medical/chemistry
	icon_state = "chem"
	name = "\improper Chemistry Lab"
	req_access = list(access_chemistry, access_medical)

/area/ship/wolf/medical/storage
	name = "Medical Storage"
	icon_state = "medstore"
	req_access = list(access_medical, access_medical_equip)

/area/ship/wolf/medical/morgue
	name = "Morgue"
	icon_state = "morgue"

/area/ship/wolf/medical/morgue/viewing
	name = "Burial Observation"
	icon_state = "morgueview"

/area/ship/wolf/medical/medtech
	name = "Medical Technician Bay"
	icon_state = "medtech"

//Command

/area/ship/wolf/command
	icon_state = "comhall"
	req_access = list(access_heads)

/area/ship/wolf/command/bridge
	icon_state = "bridge"
	name = "\improper Bridge"
	req_access = list(access_bridge)

/area/ship/wolf/command/bridge/cic
	icon_state = "cic"
	name = "\improper Combat Information Center"
	req_access = list(access_bridge)

/area/ship/wolf/command/hallway
	name = "\improper Bridge Hallway"
	req_access = null

/area/ship/wolf/command/hallway/cic
	name = "\improper CIC Hallway"
	req_access = null

/area/ship/wolf/command/office
	icon_state = "comoffice"

/area/ship/wolf/command/office/captain
	name = "\improper Captain's Office"
	req_access = list(access_heads, access_captain)

/area/ship/wolf/command/office/captain/bedroom
	name = "Captain's Quarters"
	icon_state = "combed"

/area/ship/wolf/command/office/xo
	name = "\improper Executive Officer's Office"
	req_access = list(access_heads, access_hop)

/area/ship/wolf/command/office/ce
	name = "\improper Chief Engineer's Office"
	req_access = list(access_heads, access_ce)

/area/ship/wolf/command/office/ce/bedroom
	name = "\improper Chief Engineer's Quarters"
	icon_state = "combed"

/area/ship/wolf/command/office/cmo
	name = "\improper CMO's Office"
	req_access = list(access_heads, access_cmo)

/area/ship/wolf/command/office/cmo/bedroom
	name = "\improper CMO's Quarters"
	icon_state = "combed"

/area/ship/wolf/command/office/maa
	name = "\improper Ship Security Commander's Office"
	req_access = list(access_heads, access_hos)

/area/ship/wolf/command/office/maa/bedroom
	name = "\improper Ship Security Commander's Quarters"
	icon_state = "combed"

/area/ship/wolf/command/office/xo/bedroom
	name = "\improper Executive Officer's Quarters"
	icon_state = "combed"

/area/ship/wolf/command/office/bosun
	name = "Bosun's Office"
	icon_state = "bosunoffice"
	req_access = list(access_heads, access_qm)

/area/ship/wolf/command/office/bosun/bed
	name = "Bosun's Quarters"
	icon_state = "bosunbed"

/area/ship/wolf/command/office/rd
	name = "Technology Director's Office"
	icon_state = "rdoffice"
	req_access = list(access_heads, access_rd)

/area/ship/wolf/command/office/rd/bed
	name = "Technology Director's Quarters"
	icon_state = "rdoffice"

/area/ship/wolf/command/bathroom
	name = "Officer Bathroom"
	icon_state = "headbath"
	req_access = list(access_heads)

/area/ship/wolf/command/meetingroom
	name = "Meeting Room"
	icon_state = "meetingroom"
	req_access = list(access_bridge)

/area/ship/wolf/command/vault
	name = "Vault"
	icon_state = "vault"
	req_access = list(access_heads_vault)

/area/ship/wolf/command/sensitive_storage
	name = "Sensitive Storage"
	icon_state = "selfdestruct"
	req_access = list(access_heads_vault)

/area/ship/wolf/command/ofd
	name = "OFD Bay"
	icon_state = "ofd"
	req_access = list(access_bridge)

/area/ship/wolf/command/ofdstorage
	name = "OFD Charge Storage"
	icon_state = "ofdammo"
	req_access = list(access_bridge)



//Cargo

/area/ship/wolf/cargo
	icon_state = "cargo"
	req_access = list(access_cargo)

/area/ship/wolf/cargo/general
	name = "Cargo Bay"

/area/ship/wolf/cargo/lobby
	name = "Cargo Lobby"
	icon_state = "cargolobby"
	req_access = null

/area/ship/wolf/cargo/disposals
	name = "Disposals Bay"
	icon_state = "disposal"

/area/ship/wolf/cargo/salvage
	name = "Salvage Technician Bay"
	icon_state = "salvageprep"
	req_access = list(access_mining, access_cargo)

/area/ship/wolf/cargo/lockers
	name = "Cargo Locker Room"
	icon_state = "cargolocker"

/area/ship/wolf/cargo/comissary
	name = "Comissary"
	icon_state = "commiss"

//Science

/area/ship/wolf/science
	icon_state = "science"
	req_access = list(access_research)

/area/ship/wolf/science/robotics
	icon_state = "robotics"
	name = "Robotics Bay"
	req_access = list(access_robotics, access_research)

/area/ship/wolf/science/science_hall
	name = "Science Hallway"
	icon_state = "sciencehall"

/area/ship/wolf/science/materials_lab
	name = "Materials Laboratory"
	icon_state = "matlab"

/area/ship/wolf/science/circuit_lab
	name = "Electrical Engineering"
	icon_state = "science"

/area/ship/wolf/science/xenobio
	name = "Xenobioflora Laboratory"
	icon_state = "science"
	req_access = list(access_xenobiology)

/area/ship/wolf/science/xenoarch
	name = "Xenoarcheology"
	icon_state = "science"
	req_access = list(access_research, access_xenoarch)

/area/ship/wolf/science/xenoarch/storage
	name = "Xenoarcheology Storage"
	icon_state = "science"

/area/ship/wolf/science/xenoarch/lab
	name = "Xenoarcheology Lab"
	icon_state = "science"

/area/ship/wolf/science/server_room
	name = "Server Room"
	icon_state = "server"
	req_access = list(access_tcomsat)

/area/ship/wolf/science/network_closet
	req_access = list(access_tcomsat)
	icon_state = "netcloset"

/area/ship/wolf/science/network_closet/third_deck
	name = "Third Deck Network Node"

/area/ship/wolf/science/network_closet/bridge_deck
	name = "Bridge Deck Network Node"

//Hallways.

/area/ship/wolf/hallway
	icon_state = "hallway"

/area/ship/wolf/hallway/first_deck
	name = "First Deck Hallway"

/area/ship/wolf/hallway/second_deck
	name = "\improper Second Deck Hallway"

/area/ship/wolf/hallway/third_deck/fore
	name = "\improper Third Deck Hallway"

//Escape pod bays

/area/ship/wolf/escape_pod
	icon_state = "escpod"

/area/ship/wolf/escape_pod/one
	name = "Escape Pod Bay One"

/area/ship/wolf/escape_pod/two
	name = "Escape Pod Bay Two"

/area/ship/wolf/escape_pod/three
	name = "Escape Pod Bay Three"

/area/ship/wolf/escape_pod/four
	name = "Escape Pod Bay Four"

//Maintenance

/area/ship/wolf/maintenance
	icon_state = "maint"
	area_flags = AREA_FLAG_RAD_SHIELDED
	turf_initializer = /decl/turf_initializer/maintenance
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg')

/area/ship/wolf/maintenance/deckone/aft
	name = "First Deck Aft Maintenance"

/area/ship/wolf/maintenance/deckone/aft/port
	name = "First Deck Aft Port Maintenance"

/area/ship/wolf/maintenance/deckone/aft/starboard
	name = "First Deck Aft Starboard Maintenance"

/area/ship/wolf/maintenance/deckone/fore/starboard
	name = "First Deck Fore Starboard Maintenance"

/area/ship/wolf/maintenance/deckone/fore/port
	name = "First Deck Fore Port Maintenance"

/area/ship/wolf/maintenance/deckone/amidships/port
	name = "First Deck Amidships Port Maintenance"

//Second Deck Maint

/area/ship/wolf/maintenance/decktwo/fore/port
	name = "Second Deck Fore Port Maintenance"

/area/ship/wolf/maintenance/decktwo/fore/starboard
	name = "Second Deck Fore Starboard Maintenance"

/area/ship/wolf/maintenance/decktwo/amidship/starboard
	name = "Second Deck Amidships Starboard Maintenance"

/area/ship/wolf/maintenance/decktwo/aft/port
	name = "Second Deck Aft Port Maintenance"

/area/ship/wolf/maintenance/decktwo/aft/starboard
	name = "Second Deck Aft Starboard Maintenance"

//Third Deck Maint

/area/ship/wolf/maintenance/deckthree/aft
	name = "Third Deck Aft Maintenance"

/area/ship/wolf/maintenance/deckthree/aftport
	name = "Third Deck Aft Port Maintenance"

/area/ship/wolf/maintenance/deckthree/foreport
	name = "Third Deck Fore Port Maintenance"

/area/ship/wolf/maintenance/deckthree/fore/starboard
	name = "Third Deck Fore Starboard Maintenance"

/area/ship/wolf/maintenance/deckthree/aft/starboard
	name = "Third Deck Aft Starboard Maintenance"

//Misc areas

/area/ship/wolf/eva
	name = "General EVA Bay"
	icon_state = "gen_eva"
	req_access = list(access_eva)

/area/ship/wolf/hangar
	name = "Hangar Bay"
	icon_state = "hangar"

/area/ship/wolf/ladderwell
	name = "Ladderwell"
	icon_state = "ladder"

/area/ship/wolf/janitorial
	name = "Janitorial Closet"
	icon_state = "janitor"
	req_access = list(access_janitor)

//Shuttles

/area/ship/wolf/shuttle/gnat
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/wolf/shuttle/gnat/cockpit
	name = "Gnat - Cockpit"
	icon_state = "gnatpilot"

/area/ship/wolf/shuttle/gnat/passenger
	name = "Gnat - Passenger Bay"
	icon_state = "gnatpass"

/area/ship/wolf/shuttle/gnat/cargo
	name = "Gnat - Cargo Bay"
	icon_state = "gnatcargo"

/area/ship/wolf/shuttle/gnat/maint
	name = "Gnat - Atmos Compartment"
	icon_state = "gnatmaint"

/area/supply
	requires_power = 0

/area/supply_station/supply_dock
	name = "Supply Shuttle Dock"
	icon_state = "shuttle3"
	base_turf = /turf/space

//Supply station stuff.

#if !defined(USING_MAP_DATUM)
	#include "../../mods/general_content/GeneralContent.dme"
	#include "../../mods/ship_combat2/_spacebattles.dme"


	#include "nekopirate-1.dmm"
	#include "nekopirate-2.dmm"
	#include "nekopirate-3.dmm"
	#include "nekopirate_areas.dm"
	#include "machines\smes.dm"
	#include "machines\atmos_machinery.dm"
	#include "turfs\fuel_tank.dm"

	#define USING_MAP_DATUM /datum/map/nekopirate

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Nekopirate

#endif

#if !defined(USING_MAP_DATUM)
	#include "../../mods/general_content/GeneralContent.dme"
	#include "../../mods/ship_combat2/_spacebattles.dme"


	#include "wolf-1.dmm"
	#include "wolf-2.dmm"
	#include "wolf-3.dmm"
	#include "wolf-4.dmm"
	#include "decals\floor_decals.dm"
	#include "wolf_areas.dm"
	#include "machines\smes.dm"
	#include "machines\atmos_machinery.dm"
	#include "turfs\fuel_tank.dm"

	#define USING_MAP_DATUM /datum/map/wolf

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Wolf

#endif

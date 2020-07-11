#if !defined(USING_MAP_DATUM)
	#include "../../mods/general_content/GeneralContent.dme"


	#include "wolf-1.dmm"
	#include "wolf-2.dmm"
	#include "wolf-3.dmm"
	#include "wolf-4.dmm"
	#include "decals\floor_decals.dm"

	#define USING_MAP_DATUM /datum/map/wolf

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Wolf

#endif

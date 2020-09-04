#if !defined(USING_MAP_DATUM)
	#include "../../mods/general_content/GeneralContent.dme"
	#include "../../mods/ship_combat2/_spacebattles.dme"

	#include "wolf-1.dmm"
	#include "wolf-2.dmm"
	#include "wolf-3.dmm"
	#include "wolf-4.dmm"
	#include "wolf_overmap.dm"
	#include "wolf_jobs.dm"
	#include "wolf_evac.dm"
	#include "wolf_areas.dm"
	#include "wolf_presets.dm"
	#include "wolf_spawns.dm"
	#include "wolf_shuttles.dm"
	#include "wolf_uniforms.dm"
	#include "wolf_outfits.dm"
	#include "wolf_misc.dm"

	#include "decals\floor_decals.dm"

	#include "machines\smes.dm"
	#include "machines\atmos_machinery.dm"
	#include "machines\autoset_doors.dm"
	#include "machines\celltimers.dm"
	#include "machines/coffeemachine.dm"
	#include "machines/morgue_machines.dm"
	#include "machines/consoles.dm"
	#include "machines/telecomms.dm"

	#include "turfs\fuel_tank.dm"

//	#include "wolf_security_state.dm"

	#define USING_MAP_DATUM /datum/map/wolf

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Wolf

#endif

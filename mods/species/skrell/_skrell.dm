#define SPECIES_SKRELL "Skrell"
#define IS_SKRELL "skrell"

#define LANGUAGE_SKRELLIAN "Skrellian"

#define CULTURE_SKRELL_QERR     "Qerr-Katish"
#define CULTURE_SKRELL_MALISH   "Malish-Katish"
#define CULTURE_SKRELL_KANIN    "Kanin-Katish"
#define CULTURE_SKRELL_TALUM    "Talum-Katish"
#define CULTURE_SKRELL_RASKINTA "Raskinta-Katish"

#define HOME_SYSTEM_QERRBALAK "Qerrbalak"
#define HOME_SYSTEM_TALAMIRA "Talamira"
#define HOME_SYSTEM_ROASORA "Roa'sora"
#define HOME_SYSTEM_MITORQI "Mi'tor'qi"
#define HOME_SYSTEM_SKRELLSPACE "Skrell Space"

#define FACTION_SKRELL_QERRVOAL "Qerr'voal"
#define FACTION_SKRELL_QALAOA "Qala'oa"
#define FACTION_SKRELL_YIITALANA "Yii'talana"
#define FACTION_SKRELL_KRRIGLI "Krri'gli"
#define FACTION_SKRELL_QONPRRI "Qon'prri"

/decl/modpack/skrell
	name = "Skrell"

/mob/living/carbon/human/skrell/Initialize(mapload)
	..(mapload, SPECIES_SKRELL)

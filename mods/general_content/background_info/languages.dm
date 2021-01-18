/decl/language/spacer
	name = LANGUAGE_SPACER
	desc = "A rough, informal language used infrequently by humans as a last resort when attempts to establish dialogue in more proper languages fail and no autotranslators are available."
	key = "j"
	shorthand = "Spc"
	partial_understanding = list(
		"Common" = 25,
		LANGUAGE_GUTTER = 35
	)
	syllables = list(
		"ada", "zir", "bian", "ach", "usk", "ado", "ich", "cuan", "iga", "qing", "le", "que", "ki", "qaf", "dei", "eta"
	)
	colour = "spacer"

/decl/language/gutter
	name = LANGUAGE_GUTTER
	desc = "This crude pidgin tongue developed on Pluto during its busier days. It is common among the lower classes of Pluto. It is a common language among Plutonians. It is considered a crude language by many that are 'upper class'."
	speech_verb = "growls"
	colour = "rough"
	key = "t"
	space_chance = 70
	partial_understanding = list(
		"Common" = 75,
		LANGUAGE_SPACER = 35,
	)
	syllables = list (
		"yayo", "aiya", "chiksa", "tikat", "bazar","oi", "yo", "meit", "grok", "ken", "berk", "cohon", "pendeo"
	)
	shorthand = "GT"
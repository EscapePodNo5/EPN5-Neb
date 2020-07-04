/* This is just some random code file to show how this works. It contains nothing but useful information.
With code files included in the .dme, you only need to go from the modpack folder down, ie. if the file is in the base folder, it's just #include "file.dm",
but if it's a folder down, then, #include "somefolder/file.dm"

Setting an obj's icon requires the full path. This starts with the MOD folder and goes downwards until you hit the icon, like so:
	icon = 'mods/ship_combat2/icons/bigmissile.dmi'

Please, for the love of god, organize your code into a module.

**AND REMEMBER THAT IF YOU NEED TO MAKE ANY CHANGES TO THE BASE CODE THAT CAN'T BE DONE VIA OVERWRITES OR A NEW OBJECT, SEND THOSE CHANGES UPSTREAM TO NEBULA**
 */
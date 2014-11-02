
	call compile preProcessFile "loot\positions.sqf";
	call compile preProcessFile "loot\wepArrays.sqf";
	hrn_fnc_loot = compile preProcessFile "loot\hrn_loot.sqf";
	[] spawn hrn_fnc_loot;

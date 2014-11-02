//UnitTags initialize
_script = [] spawn compile preprocessFileLineNumbers "easyNameTags\ENT_unitTags.sqf";
waitUntil{scriptDone _script};

//For all in map
{_x call ENT_addTag} foreach (allUnits - [player]);

//For dynamic and other
//_unit call ENT_addTag;
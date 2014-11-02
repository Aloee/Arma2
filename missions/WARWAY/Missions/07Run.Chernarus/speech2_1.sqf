[spec1, spec2] join (group player);
task3 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task3, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
Savegame;
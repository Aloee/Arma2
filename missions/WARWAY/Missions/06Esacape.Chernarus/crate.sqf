crate removeaction mine;
disableUserInput true;
sleep 1;
player playmove "AmovPknlMstpSrasWpstDnon_gear";
sleep 5;
disableUserInput false;
player addmagazine "Mine";
task5 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task5, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
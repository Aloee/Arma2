disableuserinput true;
player removeaction transfer;
sleep 1;
aerial = true;
allow = false;
player playmove "AidlPknlMstpSnonWnonDnon_idleSteady01";
sleep 6;
put hideobject false;
disableuserinput false;
task1 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 4;
task2 = player createSimpleTask [localize "STRD_Task2"];
task2 setSimpleTaskDescription[localize "STRD_Task2_1", localize "STRD_Task2", localize "STRD_Task2"];
sleep 1;
pioneer=[objNull, ObjNull, task2, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
player setCurrentTask task2;
sleep 120;
Bo="Bo_GBU12_LGB" createVehicle getPos aeria; 
[aeria,5,time,false,false] spawn bis_effects_burn;
go = false;
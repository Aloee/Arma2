task4 = player createSimpleTask [localize "STRD_Task4"];
task4 setSimpleTaskDescription[localize "STRD_Task4_1", localize "STRD_Task4", localize "STRD_Task4"];
sleep 1;
pioneer=[objNull, ObjNull, task4, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
waitUntil {player kbWasSaid [man, "briefing", "STRD_PIO36", 3]};
0 fadesound 0.5;
man kbTell [player, "briefing", "STRD_PIO37"];
waitUntil {player kbWasSaid [man, "briefing", "STRD_PIO38", 3]};
man kbTell [player, "briefing", "STRD_PIO39"];
waitUntil {player kbWasSaid [man, "briefing", "STRD_PIO40", 3]};
man kbTell [player, "briefing", "STRD_PIO41"];
waitUntil {player kbWasSaid [man, "briefing", "STRD_PIO42", 3]};
man kbTell [player, "briefing", "STRD_PIO43"];
waitUntil {player kbWasSaid [man, "briefing", "STRD_PIO44", 3]};
task2 = player createSimpleTask [localize "STRD_Task2"];
task2 setSimpleTaskDescription[localize "STRD_Task2_1", localize "STRD_Task2", localize "STRD_Task2"];
sleep 1;
pioneer=[objNull, ObjNull, task2, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 3;
task4 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task4, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 4;
truck hideObject false;
"accident" setMarkerSize [1, 1];
car hideObject false;
sol1 hideObject false;
sol2 hideObject false;
tractor lock false;
man switchmove "";
accident = true;
0 fadesound 1;
sleep 500;
_group2 = group hammer1;
_wp2 = _group2 addWaypoint [position car, 5];
_wp2  setWaypointType "TR UNLOAD";
_wp2 setWaypointCombatMode "RED";
_group3 = group hammer2;
_wp3 = _group3 addWaypoint [position car, 5];
_wp3  setWaypointType "TR UNLOAD";
_wp3 setWaypointCombatMode "RED";





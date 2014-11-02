waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO15", 3]};
locwoman disableAI "MOVE";
locwoman kbTell [player, "briefing", "STRD_PIO16"];

waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO17", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO18"];

waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO19", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO20"];

waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO21", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO22"];

waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO23", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO24"];

waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO25", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO26"];

waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO27", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO28_1"];
sleep 3;
locwoman kbTell [player, "briefing", "STRD_PIO28"];


waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO29", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO30"];


waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO31", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO32"];

task5 = player createSimpleTask [localize "STRD_Task5"];
task5 setSimpleTaskDescription[localize "STRD_Task5_1", localize "STRD_Task5", localize "STRD_Task5"];
sleep 1;
pioneer=[objNull, ObjNull, task5, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
"marker4" setMarkerSize [1,1];
"marker4" setMarkerText "Лесничий";

waitUntil {player kbWasSaid [locwoman, "briefing", "STRD_PIO33", 3]};

locwoman kbTell [player, "briefing", "STRD_PIO34"];

locwoman enableAI "MOVE";
sleep 2;

if (go) then {
task3 = player createSimpleTask [localize "STRD_Task3"];
task3 setSimpleTaskDescription[localize "STRD_Task3_1", localize "STRD_Task3", localize "STRD_Task3"];
sleep 1;
pioneer=[objNull, ObjNull, task3, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
"marker1" setMarkerSize [1,1];
"marker1" setMarkerText "Американский лагерь";
sleep 3;
"marker2" setMarkerSize [1,1];
"marker2" setMarkerText "Заложники";
sleep 1;
task4 = player createSimpleTask [localize "STRD_Task4"];
task4 setSimpleTaskDescription[localize "STRD_Task4_1", localize "STRD_Task4", localize "STRD_Task4"];
sleep 1;
pioneer=[objNull, ObjNull, task4, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 3;
task2 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task2, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 3;
playsound "STRD_PIO43";
sleep 4;
playsound  "STRD_PIO44";
[e1] join group objNull;
e1 domove (getMarkerPos "Marker10"); 
}

else {
go=true;
}


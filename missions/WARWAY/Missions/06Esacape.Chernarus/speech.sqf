
waitUntil {player kbWasSaid [locman, "briefing", "STRD_PIO1", 3]};
locman disableAI "MOVE";
locman kbTell [player, "briefing", "STRD_PIO2"];

waitUntil {player kbWasSaid [locman, "briefing", "STRD_PIO3", 3]};

locman kbTell [player, "briefing", "STRD_PIO4"];

waitUntil {player kbWasSaid [locman, "briefing", "STRD_PIO5", 3]};

locman kbTell [player, "briefing", "STRD_PIO6"];

waitUntil {player kbWasSaid [locman, "briefing", "STRD_PIO7", 3]};

locman kbTell [player, "briefing", "STRD_PIO8"];

waitUntil {player kbWasSaid [locman, "briefing", "STRD_PIO9", 3]};

locman kbTell [player, "briefing", "STRD_PIO10"];

waitUntil {player kbWasSaid [locman, "briefing", "STRD_PIO11", 3]};

locman kbTell [player, "briefing", "STRD_PIO12"];

waitUntil {player kbWasSaid [locman, "briefing", "STRD_PIO13", 3]};

locman kbTell [player, "briefing", "STRD_PIO14"];
locman enableAI "MOVE";
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
TitleText [localize "STRD_PIO43","PLAIN DOWN"];
sleep 3;
TitleText [localize "STRD_PIO44","PLAIN DOWN"];
[e1] join group objNull;
e1 domove (getMarkerPos "Marker10"); 
}

else {
go=true;
}



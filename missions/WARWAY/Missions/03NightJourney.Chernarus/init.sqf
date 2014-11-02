p=[] execvm "capture.sqf";
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title", localize "STRD_Plan"]];
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title1", localize "STRD_Plan1"]];
task1 = player createSimpleTask [localize "STRD_Task1"];
task1 setSimpleTaskDescription[localize "STRD_Task1_1", localize "STRD_Task1", localize "STRD_Task1"];
player setCurrentTask task1;
_array2 = [m3, m4, m5, m6];
w1 switchmove "AidlPsqtMstpSnonDnon";
{removeallweapons _x; _x addmagazine ["30Rnd_762x39_AK47",1]; _x addweapon "AK_47_S";} foreach _array2;
titleCut ["","Black faded",7];
go=false;
go2=false;
player removeWeapon "ItemCompass";
go3=false;
[sp,true] exec "scripts\fire.sqs"; 
player kbAddTopic ["briefing", "briefing.bikb", ""];
lisa kbAddTopic ["briefing", "briefing.bikb", ""];
0 fadesound 0;
1 fademusic 0.6;
setAccTime 1;
sleep 7;
2 fadesound 1;
titleCut ["","Black in",4];
sleep 4;
playmusic "Escape";
lisa kbTell [player, "briefing", "STRD_PIO10"];
waitUntil {lisa kbWasSaid [player, "briefing", "STRD_PIO10", 1]};

player kbTell [lisa, "briefing", "STRD_PIO11"];
waitUntil {player kbWasSaid [lisa, "briefing", "STRD_PIO11", 1]};
sleep 4;
"Marker1" setMarkerSize [1,1];
task2 = player createSimpleTask [localize "STRD_Task2"];
task2 setSimpleTaskDescription[localize "STRD_Task2_1", localize "STRD_Task2", localize "STRD_Task2"];
player setCurrentTask task2;
sleep 1;
pioneer=[objNull, ObjNull, task2, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 15;
{_x switchLight "OFF"} forEach ((getPos player) nearObjects ["StreetLamp",1000]);
playsound "STRD_PIO12";
sleep 15;
Bo="Bo_GBU12_LGB" createVehicle getPos s1;




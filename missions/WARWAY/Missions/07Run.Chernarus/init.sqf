_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title", localize "STRD_Plan"]];
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title1", localize "STRD_Plan1"]];
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title2", localize "STRD_Plan2"]];
task1 = player createSimpleTask [localize "STRD_Task1"];
task1 setSimpleTaskDescription[localize "STRD_Task1_1", localize "STRD_Task1", localize "STRD_Task1"];
player setCurrentTask task1;
task3 = player createSimpleTask [localize "STRD_Task3"];
task3 setSimpleTaskDescription[localize "STRD_Task3_1", localize "STRD_Task3", localize "STRD_Task3"];
titleCut ["","Black faded",7];
playmusic "Break";
0 fademusic 1;
accident = false;
vehicle_1 = true;
vehicle_2 = true;
_array = [s1, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, e1];
{removeallweapons _x} forEach _array;
sleep 1;
player loadStatus "juriy_status_mik4"; 
e1 loadStatus "sergant_status_mik1"; 
s1 loadStatus "units1_status_mik1"; 
s1_1 loadStatus "units11_status_mik1"; 
s1_2 loadStatus "units12_status_mik1";
s1_3 loadStatus "units13_status_mik1"; 
s1_4 loadStatus "units14_status_mik1";
s1_5 loadStatus "units15_status_mik1";
s1_6 loadStatus "units16_status_mik1";
s1_7 loadStatus "units17_status_mik1";
sleep 1;
p=[] execvm "eraser.sqf";
score = 1;
man kbAddTopic ["briefing", "kb\briefing.bikb", ""];
spec1 kbAddTopic ["briefing", "kb\briefing.bikb", ""];
player kbAddTopic ["briefing", "kb\briefing.bikb", "", {call compile preprocessFileLineNumbers "kb\briefing_cooper.sqf"}];
p=[] execvm "health.sqf";
man switchmove "RepairingKneel";
_array = [spec1, spec2];
{_x addweapon "G36_C_SD_eotech"} forEach _array;
{_x addMagazine "30Rnd_556x45_G36SD"} forEach _array;
{_x addMagazine "PipeBomb"} forEach _array;
{_x addMagazine "30Rnd_556x45_G36SD"} forEach _array;
{_x addMagazine "30Rnd_556x45_G36SD"} forEach _array;
{_x addMagazine "30Rnd_556x45_G36SD"} forEach _array;
{_x addMagazine "30Rnd_556x45_G36SD"} forEach _array;
{_x addMagazine "30Rnd_556x45_G36SD"} forEach _array;
{_x addMagazine "30Rnd_556x45_G36SD"} forEach _array;
titleCut ["","Black in",3];
[] exec "time.sqs";
sleep 185;
playmusic "Fog";
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title", localize "STRD_Plan"]];
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title1", localize "STRD_Plan1"]];
titleCut ["","Black faded",7];
playmusic "Visitors";
0 fademusic 1;
go = false;
alarm = false;
shoot = true;
prevention = true;
sabotage = true;
score = 1;
player loadStatus "juriy_status_mik3";
sleep 1; 
eh1=s1 addEventHandler ["AnimDone", {s1 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
eh2=s1_1 addEventHandler ["AnimDone", {s1_1 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
eh3=s1_2 addEventHandler ["AnimDone", {s1_2 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
eh4=s1_3 addEventHandler ["AnimDone", {s1_3 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
eh5=s1_4 addEventHandler ["AnimDone", {s1_4 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
eh6=s1_5 addEventHandler ["AnimDone", {s1_5 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
eh7=s1_6 addEventHandler ["AnimDone", {s1_6 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
eh8=s1_7 addEventHandler ["AnimDone", {s1_7 switchmove "ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"}];
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title", localize "STRD_Plan"]];
_log_briefing = player createDiaryRecord ["Diary", [localize "STRD_Plan_title1", localize "STRD_Plan1"]];
crate addweaponcargo ["huntingrifle", 1];
crate addmagazinecargo ["5x_22_LR_17_HMR", 5];
locman kbAddTopic ["briefing", "kb\briefing.bikb", ""];
c1 kbAddTopic ["briefing", "kb\briefing.bikb", ""];
forester kbAddTopic ["briefing", "kb\briefing.bikb", ""];
locwoman kbAddTopic ["briefing", "kb\briefing.bikb", ""];
player kbAddTopic ["briefing", "kb\briefing.bikb", "", {call compile preprocessFileLineNumbers "kb\briefing_cooper.sqf"}];
task1 = player createSimpleTask [localize "STRD_Task1"];
task1 setSimpleTaskDescription[localize "STRD_Task1_1", localize "STRD_Task1", localize "STRD_Task1"];
player setCurrentTask task1;
p = createVehicle ["Land_HouseV_1I4", [0, 0, 0], [], 0, "NONE"]; 
p setPos [10387.97,5939.03,0.06];
p setDir 40;
p=[] execvm "speech.sqf";
p=[] execvm "speech2.sqf";
p=[] execvm "speech3.sqf";
p=[] execvm "prevention.sqf";
p=[] execvm "health.sqf";
titleCut ["","Black in",4];
sleep 6;
task2 = player createSimpleTask [localize "STRD_Task2"];
task2 setSimpleTaskDescription[localize "STRD_Task2_1", localize "STRD_Task2", localize "STRD_Task2"];
sleep 1;
pioneer=[objNull, ObjNull, task2, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
waituntil {not alive btr};
task4 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task4, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";

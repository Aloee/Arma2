proval = false;
Task1 setTaskState "SUCCEEDED";
pioneer=[objNull, ObjNull, task1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 10;
go4=true;
lisa kbTell [player, "briefing", "STRD_PIO16"];
waitUntil {lisa kbWasSaid [player, "briefing", "STRD_PIO16", 1]};
sleep 1;
task2 = player createSimpleTask [localize "STRD_Task2"];
task2 setSimpleTaskDescription[localize "STRD_Task2_1", localize "STRD_Task2", localize "STRD_Task2"];
player setCurrentTask task2;
sleep 1;
pioneer=[objNull, ObjNull, task2, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
btr_1 hideobject false;
btr_2 hideobject false;
"07" setMarkerSize [1,1];
"07" setMarkerText "Точка эвакуации";
btr_1 allowdammage false;
btr_2 allowdammage false;
waituntil {go5};
Task2 setTaskState "SUCCEEDED";
pioneer=[objNull, ObjNull, task2, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
playmusic "Lost";
sleep 10;
titlecut ["","BLACK out",3];
sleep 5;
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
_camera camPrepareFocus [-1,-1];

_camera camPrepareTarget [-47622.97,90569.77,-111.44];
_camera camPreparePos [7473.09,7226.64,17.14];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

titleCut ["","Black in",4];


_camera camPrepareTarget [-47394.24,90223.62,-10147.31];
_camera camPreparePos [7463.46,7216.74,40.30];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 13;
sleep 8;
titlecut ["","BLACK out",3];
sleep 4; 


_camera camPrepareTarget [-16033.38,104962.54,-132.60];
_camera camPreparePos [7081.91,7675.41,3.42];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

titleCut ["","Black in",4];

_camera camPrepareTarget [-16005.55,104844.89,6029.01];
_camera camPreparePos [7064.59,7744.80,4.38];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 13;
sleep 13;
;comment "17:51:28";
_camera camPrepareTarget [10095.87,107513.77,6232.48];
_camera camPreparePos [7063.15,7748.86,17.36];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 12;
sleep 8; 
titlecut ["","BLACK out",3];
sleep 4; 
_camera camPrepareTarget [106390.80,8301.94,-6371.23];
_camera camPreparePos [6615.60,7992.84,0.86];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
titleCut ["","Black in",4];
_camera camPrepareTarget [-63669.63,-47166.39,-44570.83];
_camera camPreparePos [6667.19,8001.25,4.61];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 13;
sleep 13;
_camera camPrepareTarget [-63669.63,-47166.39,-44570.83];
_camera camPreparePos [6667.19,8001.25,504.61];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 13;
sleep 5;



titlecut ["","BLACK out",3];
3 fadeMusic 0;
3 fadesound 0;
sleep 3;
endMission "END1";





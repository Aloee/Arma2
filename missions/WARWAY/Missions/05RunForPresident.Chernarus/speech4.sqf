player saveStatus "juriy_status_mik3"; 
titleCut ["","Black out",4];
setacctime 1;
0 fadesound 1;
sleep 4;
disableUserInput true;
sleep 1;
player setpos [8342.46,5972.14,1.55];
player setvectordir[-13854.29,-91527.55,293.78];
player setunitpos "UP";
e1 setvectordir[56591.17,93560.29,206.83];
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
_camera camPrepareFocus [-1,-1];
showcinemaborder false;
_camera camPrepareTarget [-83316.31,-34004.03,189.48];
_camera camPreparePos [8347.78,5973.04,1.66];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
sleep 2;
titleCut ["","Black in",4];
sleep 2;
e1 kbTell [player, "briefing", "STRD_PIO14"];
waitUntil {e1 kbWasSaid [player, "briefing", "STRD_PIO14", 3]};
player kbTell [e1, "briefing", "STRD_PIO15"];
waitUntil {player kbWasSaid [e1, "briefing", "STRD_PIO15", 3]};
task1 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
e1 kbTell [player, "briefing", "STRD_PIO16"];
waitUntil {e1 kbWasSaid [player, "briefing", "STRD_PIO16", 3]};
player kbTell [e1, "briefing", "STRD_PIO17"];
waitUntil {player kbWasSaid [e1, "briefing", "STRD_PIO17", 3]};
e1 kbTell [player, "briefing", "STRD_PIO18"];
waitUntil {e1 kbWasSaid [player, "briefing", "STRD_PIO18", 3]};
player kbTell [e1, "briefing", "STRD_PIO19"];
waitUntil {player kbWasSaid [e1, "briefing", "STRD_PIO19", 3]};
titleCut ["","Black out",4];
sleep 4;
fir hideobject false;
_camera camPrepareTarget [-46581.46,-76031.44,-16754.04];
_camera camPreparePos [8074.62,5959.27,2.14];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
player setvectordir[-91927.81,5954.99,-47.80];
player setpos  [8072.41,5955.03,1.84];
e1 setvectordir [107059.47,20128.25,280.99];
e1 setpos  [8069.03,5954.55,1.31];
skiptime 4;
0 setRain 0;
player playmove "AmovPsitMstpSnonWnonDnon_ground";
e1 playmove "AmovPsitMstpSnonWnonDnon_ground";
sleep 2;
titleCut ["","Black in",4];
playmusic "ambient_morn_1";
sleep 3;
e1 kbTell [player, "briefing", "STRD_PIO20"];
waitUntil {e1 kbWasSaid [player, "briefing", "STRD_PIO20", 3]};
e1 kbTell [player, "briefing", "STRD_PIO21"];
waitUntil {e1 kbWasSaid [player, "briefing", "STRD_PIO21", 3]};
player  kbTell [e1, "briefing", "STRD_PIO22"];
waitUntil {player kbWasSaid [e1, "briefing", "STRD_PIO22", 3]};
e1 kbTell [player, "briefing", "STRD_PIO23"];
waitUntil {e1 kbWasSaid [player, "briefing", "STRD_PIO23", 3]};
player kbTell [e1, "briefing", "STRD_PIO24"];
waitUntil {player kbWasSaid [e1, "briefing", "STRD_PIO24", 3]};
sleep 1;
titlecut ["","BLACK out",3];
3 fadeMusic 0;
3 fadesound 0;
sleep 3;
_camera cameraeffect ["terminate", "Back"]; 
camdestroy _camera; 
endMission "END1";

disableUserInput false;



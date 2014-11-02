setAccTime 1;
lisa kbTell [player, "briefing", "STRD_PIO13"];
waitUntil {lisa kbWasSaid [player, "briefing", "STRD_PIO13", 1]};
btr move [6960.35,2508.76,2.12];
btr setSpeedMode "LIMITED";
sleep 30;
lisa kbTell [player, "briefing", "STRD_PIO14"];
waitUntil {lisa kbWasSaid [player, "briefing", "STRD_PIO14", 1]};
sleep 4;
"Marker2" setMarkerSize [1,1];
sleep 7;
Bo="Bo_GBU12_LGB" createVehicle getPos s2;
[sp2,true] exec "scripts\fire.sqs"; 
if (not alive m2) then {jeep setdammage 1;}

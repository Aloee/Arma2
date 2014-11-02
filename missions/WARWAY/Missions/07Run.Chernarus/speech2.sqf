vehicle_1 = false;
titleCut ["","Black out",2];
setacctime 1;
sleep 4;
disableuserinput true;
spec1 hideobject false;
spec2 hideobject false;
player setpos [9121.67,4105.13,1.66];
player setvectordir[104398.67,-26263.79,259.04];
sleep 2;
titleCut ["","Black in",4];
disableuserinput false;
0 fademusic 0.5;
sleep 2;
spec1 kbTell [player, "briefing", "STRD_PIO18"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO18", 3]};
player kbTell [spec1, "briefing", "STRD_PIO19"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO19", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO20"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO20", 3]};
player kbTell [spec1, "briefing", "STRD_PIO21"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO21", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO22"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO22", 3]};
player kbTell [spec1, "briefing", "STRD_PIO23"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO23", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO24"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO24", 3]};
player kbTell [spec1, "briefing", "STRD_PIO25"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO25", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO26"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO26", 3]};
player kbTell [spec1, "briefing", "STRD_PIO27"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO27", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO28"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO28", 3]};
player kbTell [spec1, "briefing", "STRD_PIO29"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO29", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO30"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO30", 3]};

truck2 lock false;
_group3 = group spec1;
_wp3 = _group3 addWaypoint [position truck2, 5];
sleep 4;
spec1 kbTell [player, "briefing", "STRD_PIO31"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO31", 3]};

player kbTell [spec1, "briefing", "STRD_PIO32"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO32", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO33"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO33", 3]};

player kbTell [spec1, "briefing", "STRD_PIO34"];
waitUntil {player kbWasSaid [spec1, "briefing", "STRD_PIO34", 3]};

spec1 kbTell [player, "briefing", "STRD_PIO35"];
waitUntil {spec1 kbWasSaid [player, "briefing", "STRD_PIO35", 3]};
0 fademusic 1;



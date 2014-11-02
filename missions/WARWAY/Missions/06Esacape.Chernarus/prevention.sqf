waitUntil {player kbWasSaid [c1, "briefing", "STRD_PIO45", 3]};

c1 kbTell [player, "briefing", "STRD_PIO46"];

waitUntil {player kbWasSaid [c1, "briefing", "STRD_PIO47", 3]};

c1 kbTell [player, "briefing", "STRD_PIO48"];

sleep 4;
prevention = false;
Grp_c = group c1;
[c1,c2,c3] join Grp_c; 
{_x doMove (getMarkerPos "marker4")} foreach units Grp_c;

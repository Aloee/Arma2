setAccTime 1;
lisa kbTell [player, "briefing", "STRD_PIO15"];
waitUntil {lisa kbWasSaid [player, "briefing", "STRD_PIO15", 1]};
car move [6423.54,2697.91,2.00];
sleep 30;
lisa kbTell [player, "briefing", "STRD_PIO16"];
waitUntil {lisa kbWasSaid [player, "briefing", "STRD_PIO16", 1]};
sleep 4;
"Marker3" setMarkerSize [1,1];

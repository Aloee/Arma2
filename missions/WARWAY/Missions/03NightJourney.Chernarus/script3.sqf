setAccTime 1;
sleep 3;
lisa kbTell [player, "briefing", "STRD_PIO17"];
waitUntil {lisa kbWasSaid [player, "briefing", "STRD_PIO17", 1]};
sleep 3;
playsound "STRD_PIO18";
sleep 3;
Savegame;

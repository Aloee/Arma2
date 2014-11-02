_menuSettings = [
	[localize "STRD_gui_settings", true],
	[localize "STRD_gui_fixDisplay", [2], "",-5, [["expression", "call fx_backgroundDynamicBlur"]],"1","1"],
	[if(attackSay)then{localize "STRD_gui_attackSayOff"}else{localize "STRD_gui_attackSayOn"}, [3], "",-5, [["expression", "attackSay=if(attackSay)then{false}else{true};if(attackSay)then{hint localize ""STRD_gui_attackSayOn""}else{hint localize ""STRD_gui_attackSayOff""}"]],"1","1"],
	[if(resPlace==1)then{localize "STRD_gui_resPlace2"}else{localize "STRD_gui_resPlace1"}, [4], "",-5, [["expression", "resPlace=if(resPlace==1)then{2}else{1};if(resPlace==1)then{hint localize ""STRD_gui_resPlace1""}else{hint localize ""STRD_gui_resPlace2""}"]],"1","1"],
	[localize "STRD_gui_servStat", [5], "",-5, [["expression", "if(isMultiplayer)then{ZONA_serverexec_stat = [player];publicVariable ""ZONA_serverexec_stat""}else{[player] call sfx_infoServerStatistic}"]],"1","1"]
];

showCommandingMenu "#USER:_menuSettings"; 
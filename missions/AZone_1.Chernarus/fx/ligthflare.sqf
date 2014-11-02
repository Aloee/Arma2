while{true}do{
		
	if(date select 3 >= 18 or date select 3 < 6)then{
		{
			[group (_x select 0), random 800] call BIS_ARTY_F_SetDispersion;
			[group (_x select 0), getMarkerPos (_x select 1), ["IMMEDIATE", "ILLUM", 120, 30]] call BIS_ARTY_F_ExecuteTemplateMission;
			sleep random 15;
		}foreach [
			[m0, "mil"],
			[m1, "city4"],
			[m2, "city5"],
			[m3, "city14"],
			[m4, "city15"]
		];
		
		sleep ((60 * 60) + random (900));
	};

sleep 60;
};
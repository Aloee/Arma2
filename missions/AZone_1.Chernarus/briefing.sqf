player createDiarySubject ["Grps",localize "STRD_briefing_grps"];
	player createDiaryRecord ["Grps",[localize "STRD_briefing_grps_duty",localize "STRD_briefing_grps_duty_desc"]];
	player createDiaryRecord ["Grps",[localize "STRD_briefing_grps_free",localize "STRD_briefing_grps_free_desc"]];

player createDiarySubject ["Missions",localize "STRD_briefing_missions"];
switch(side player)do{
	case east :{
		player createDiaryRecord ["Missions",[localize "STRD_gui_tasks_hunting",localize "STRD_briefing_missions_hunting_description"]];
	};
	case resistance :{
		player createDiaryRecord ["Missions",[localize "STRD_gui_tasks_penetration",localize "STRD_briefing_missions_penetration_description"]];
		player createDiaryRecord ["Missions",[localize "STRD_gui_tasks_sabotage",localize "STRD_briefing_missions_sabotage_description"]];
	};
};

player createDiarySubject ["Surge",localize "STRD_briefing_surge"];
	
	switch(side player)do{
		case east : {
			player createDiaryRecord ["Surge",[localize "STRD_briefing_surge_artefacts",localize "STRD_briefing_surge_artefacts_description_duty"]];
		};
		case resistance : {
			player createDiaryRecord ["Surge",[localize "STRD_briefing_surge_artefacts",localize "STRD_briefing_surge_artefacts_description_freedom"]];
		};
	};
	
	player createDiaryRecord ["Surge",[localize "STRD_briefing_surge_anomalies",localize "STRD_briefing_surge_anomalies_description"]];
	player createDiaryRecord ["Surge",[localize "STRD_briefing_surge",localize "STRD_briefing_surge_description"]];

player createDiarySubject ["Camp",localize "STRD_briefing_camp"];
	player createDiaryRecord ["Camp",[localize "STRD_briefing_camp",localize "STRD_briefing_camp_description"]];
	
player createDiarySubject ["Keys",localize "STRD_briefing_keys"];
	player createDiaryRecord ["Keys",[localize "STRD_briefing_keys",localize "STRD_briefing_keys_description"]];
	
player createDiarySubject ["About",localize "STRD_briefing_about"];
	player createDiaryRecord ["About",[localize "STRD_briefing_contact",localize "STRD_briefing_contact_desc"]];
if(local player)then{
	player kbAddTopic ["knowledge", "kbs\knowledge.bikb", "", {call compile preprocessFileLineNumbers "kbs\react.sqf"}];

	negative_replics = ["STR_nounderstand", "STR_no", "STR_not"];
	negative_tasks =  negative_replics+["STR_tasks_comeonesidor", "STR_tasks_nopresent", "STR_tasks_comeonesidor", "STR_tasks_comeonecommandor"];
	negative_news =  negative_replics+["STR_news_no", "STR_news_no2", "STR_news_no3"];
	 
};
waitUntil{!(isNil "BIS_MPF_InitDone")};

CNV_DELAY_SPAWN = 1800;
CNV_CONTROLPOINTS =["convoywp1", "convoywp2", "convoywp3", "convoywp4", "convoywp5", "convoywp6"];

execVM "cnv\cycle.sqf";
fz_fx_setIdentityNpc = {
	_varName = vehicleVarName _this;
	_this setIdentity _varName;

	switch(_varName)do{
		case "sidorch" :{
			_this setVariable ["nameDisplay", localize "STRD_sidorch_name"];
			group _this setGroupId [localize "STRD_sidorch_grpID", "GroupColor0"];
		};
		case "voronin" :{
			_this setVariable ["nameDisplay", localize "STRD_voronin_name"];
			group _this setGroupId [localize "STRD_voronin_grpID", "GroupColor1"];
		};
		case "luka" :{
			_this setVariable ["nameDisplay", localize "STRD_luka_name"];
			group _this setGroupId [localize "STRD_luka_grpID", "GroupColor2"];
		};
		case "saharov" :{
			_this setVariable ["nameDisplay", localize "STRD_saharov_name"];
			group _this setGroupId [localize "STRD_saharov_grpID", "GroupColor3"];
		};
		
		default { _this setVariable ["nameDisplay", ""]; };
	};
	
	//identity only npc witch public scope
	_this setVariable ["kbs_scope", "public"];
	_this kbAddTopic ["knowledge", "kbs\knowledge.bikb", ""];
};
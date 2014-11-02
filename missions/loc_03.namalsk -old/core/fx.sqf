fx_cl_setvar = {
	private ["_arg", "_val"];
	_arg = _this select 0;
	_val = _this select 1;
	call compile format ["%1 = %2", _arg, _val];
};

fz_fx_setIdentityNpc = {
	private ["_varName"];
	
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
	_this setVariable ["npc", true, true];
	//_this kbAddTopic ["knowledge", "kbs\knowledge.bikb", ""];
};

fz_fx_init_anomali_cli = {
	{
		private ["_pos", "_name"];
		
		_pos = _x select 0;
		_name = _x select 1;
		
		
		switch(_name) do {
			case "Burn":{
				[_pos, 50] execFSM "core\anomalies\Burn.fsm";			
			};
			case "Gravi":{
				[_pos, 50] execFSM "core\anomalies\Gravi.fsm";
			};
			case "Mincer":{
				[_pos, 50] execFSM "core\anomalies\Mincer.fsm";  
			};
			case "Tornado":{
				[_pos, 30] execFSM "core\anomalies\Tornado.fsm";  
			};
			case "Souls":{
				[_pos] execFSM "core\anomalies\Souls.fsm";  
			};
			case "Electro":{
				[_pos, 100, 4] execFSM "core\anomalies\Electro.fsm";  
			};
			case "Radiation":{
				[_pos, 300] execFSM "core\anomalies\Radiation.fsm";  
			};
			case "Psy":{
				[_pos, 200] execFSM "core\anomalies\Psy.fsm";  
			};
		};
	}foreach _this;
};

fz_fx_setEffectArtefact_cli = {
	private ["_artefact", "_artefactArt", "_lightColor", "_art", "_artefactPos", "_PSl"];
	
	_artefact = _this select 0;
	_artefactArt = _this select 1;

	_lightColor = _artefactArt select 0;
	_art = _artefactArt select 1;
	
	_artefactPos = getPosATL _artefact;
	
	_PSl = "#particlesource" createVehicleLocal _artefactPos;
	_PSl setParticleCircle [0, [0, 0, 0]];
	_PSl setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.5, [0, 0, 0, 0], 0, 0];
	_PSl setParticleParams ["ca\Data\kouleSvetlo", "", "billboard", 1, 1, [0, 0, 0], [0, 0, 0], 0, 1.27, 1, 0, [0.3], _art, [0, 1], 1, 0, "", "", _artefact];
	_PSl setDropInterval 1;
};

fz_fx_backgroundDynamicBlur = {
	if(FZ_DYNAMIC_BLUR_BACKGROUND)then{
		"dynamicBlur" ppEffectEnable true;"filmGrain" ppEffectEnable true;"filmGrain" ppEffectCommit 0.5;
		"dynamicBlur" ppEffectAdjust [0.3]; 
		"dynamicBlur" ppEffectCommit 0.1;
		"filmGrain" ppEffectAdjust [0.1, 0.3, 0.1, 0.05, 2, false];
		"colorCorrections" ppEffectEnable false;
	}else{
		"dynamicBlur" ppEffectEnable false;
		"filmGrain" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
	};
	//cutRsc ["Hud","PLAIN"];
};

fz_fx_showDetector = {
	private ["_dist", "_range"];
	
	_dist = _this select 0;
	_range = _this select 1;
	
	if (player hasWeapon "DAP_DETECTOR" and alive player)then{
		disableSerialization;
		16 cutRsc ["DETECTOR_PIC", "PLAIN", 0];
		((uiNamespace getVariable "DETECTOR_PIC") displayCtrl 764522) ctrlSetText format ["%1", _dist];
		PlaySound "dap_beep_geiger";
	};
};
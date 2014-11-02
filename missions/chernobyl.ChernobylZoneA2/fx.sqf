fx_cl_setvar = {	
	_arg = _this select 0;
	_val = _this select 1;
	call compile format ["%1 = %2", _arg, _val];
};

fz_fx_init_anomali_cli = {
	{
		_pos = _x select 0;
		_name = _x select 1;
		
		
		switch(_name) do {
			case "Burn":{
				[_pos, 50] execFSM "DAPANOMALIES\Burn.fsm";  
			};
			case "Gravi":{
				[_pos, 50] execFSM "DAPANOMALIES\Gravi.fsm";
			};
			case "Mincer":{
				[_pos, 50] execFSM "DAPANOMALIES\Mincer.fsm";  
			};
			case "Electro":{
				[_pos, 100, 4] execFSM "DAPANOMALIES\Electro.fsm";  
			};
			case "Radiation":{
				[_pos, 300] execFSM "DAPANOMALIES\Radiation.fsm";  
			};
			case "Psy":{
				[_pos, 200] execFSM "DAPANOMALIES\Psy.fsm";  
			};
		};
	}foreach _this;
};

fz_fx_showDetector = {
	_dist = _this select 0;
	_range = _this select 1;
	_beepcount=_range;
	
	if (player hasWeapon "DAP_DETECTOR")then{
		disableSerialization;
		16 cutRsc ["DETECTOR_PIC", "PLAIN", 0];
		((uiNamespace getVariable "DETECTOR_PIC") displayCtrl 764522) ctrlSetText format ["%1", _dist];
		PlaySound "dap_beep_geiger";
	};
};
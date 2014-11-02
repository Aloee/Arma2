if(!isServer && !isDedicated)exitwith{};

convoys = [];

while{true}do{
	_cnvwys=["convoywp1", "convoywp2", "convoywp3", "convoywp4", "convoywp5", "convoywp6"];
	[nil, nil, "per", rCALLVAR, [_cnvwys], {{_x setMarkerAlpha 0} foreach (_this select 0)}] call RE;
	
	_start = _cnvwys select floor random count _cnvwys;
	_randway = [_start, (_cnvwys-[_start]) select floor random ((count _cnvwys) - 1)];
	_p = _randway execvm "convoy\init_cnv.sqf";
	
	
	[nil, nil, "per", rCALLVAR, [_randway, [format["%1:%2", date select 3, if((date select 4) < 10)then{"0"+ str(date select 4)}else{date select 4}], "End way"]], {
		_randway = _this select 0;
		_stringStart = (_this select 1) select 0;
		_stringEnd = (_this select 1) select 1;

		{_x setMarkerAlpha 1} foreach _randway;
		(_randway select 0) setMarkerType "hd_start";
		(_randway select 1) setMarkerType "mil_destroy";
		(_randway select 0) setMarkerText _stringStart;
		(_randway select 1) setMarkerText _stringEnd;
		
	}] call RE;
	//[nil, nil, rCALLVAR, [], {[INFORM, "side", localize "STRD_title_convoyStart"] call fx_sayradio}] call RE;
	
	sleep CONVOYS_DELAY_SPAWN;
};
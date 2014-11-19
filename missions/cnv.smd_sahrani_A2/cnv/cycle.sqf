if(!isServer && !isDedicated)exitwith{};

while{true}do{
	
	//Hide all markers
	[nil, nil, "per", rCALLVAR, [CNV_CONTROLPOINTS], {{_x setMarkerAlpha 0} foreach (_this select 0)}] call RE;
	
	//Start convoy
	_start = CNV_CONTROLPOINTS select floor random count CNV_CONTROLPOINTS;
	_randway = [_start, (CNV_CONTROLPOINTS-[_start]) select floor random ((count CNV_CONTROLPOINTS) - 1)];
	_p = _randway execvm "cnv\init.sqf";
	
	//Convoy way markers
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
	
sleep CNV_DELAY_SPAWN;
};
if (isMultiplayer) then
	{
		if (param1 == 0) then {skiptime 0};
		if (param1 == 1) then {skiptime 3};
		if (param1 == 2) then {skiptime 11.5};
		if (param1 == 3) then {skiptime 14.5};
	};

setViewDistance 2500;
BriefedUnits = [];
execVM "briefing.sqf";

if (isMultiplayer) then {10 setRadioMsg "Null"};
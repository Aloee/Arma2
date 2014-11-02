if(!isServer && !isDedicated)exitwith{};

_killed = _this select 0;
_group = group _killed;

waitUntil {(behaviour leader _group != "COMBAT")};

_grp_vehs_drvs = _group getVariable "grp_vehs_drvs";
_reservers = _group getVariable "CargoSquad"; 

private ["_vehicle"];

{
	if(_x select 1 == _killed)then{_vehicle = _x select 0}
}foreach _grp_vehs_drvs;

if(!isNil "_vehicle" && !isNil "_reservers")then{
	if(alive _vehicle && canmove _vehicle)then{
		if(count _reservers != 0)then{		
			_new_driver = _reservers select (count _reservers - 1);

			_new_driver assignAsDriver _vehicle;
			[_new_driver] ordergetin true;
			[_new_driver] allowGetIn true;
			
			_ind = 0;
			{
				if((_x select 1) == _killed)exitwith{};
				_ind = _ind + 1;
			}foreach _grp_vehs_drvs;
			
			_grp_vehs_drvs set [_ind, [((_grp_vehs_drvs select _ind) select 0), _new_driver]];
							
			_reservers = _reservers - [_new_driver];
			_group setVariable ["CargoSquad", _reservers];
			_new_driver addEventHandler ["killed", {_xu = _this execVM "convoy\act\way_drrplc_cnv.sqf"}];
			
		};
	};
};
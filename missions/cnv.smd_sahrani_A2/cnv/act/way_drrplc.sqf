/*
	Author: aloe itfruit@mail.ru
	Copyright (C) 2014 Aloe

	Convoy script: way_drrplc.sqf
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
*/

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
			_new_driver addEventHandler ["killed", {_xu = _this execVM "cnv\act\way_drrplc.sqf"}];
			
		};
	};
};
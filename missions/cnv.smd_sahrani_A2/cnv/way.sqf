/*
	Author: aloe itfruit@mail.ru
	Copyright (C) 2014 Aloe

	Convoy script: way.sqf
	
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

_group = _this select 0;
_waypoints = _group getVariable "Convoy_way";

if(!isNil "_group")then{
	_grp_vehs_drivers = _group getVariable "grp_vehs_drvs";

		for "_indw" from 0 to ((count _waypoints)-1) do{
			_wp = _group addWaypoint [getmarkerpos (_waypoints select _indw), 0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointFormation "STAG COLUMN";
			_wp setWaypointCompletionRadius 30;
			_wp setWaypointSpeed "FULL";

			if(_indw == (count _waypoints)-1)then{
				_done_way = "_group = group this;_vehs = (group this) getVariable ""grp_vehs_drvs"";{deleteVehicle _x} foreach (units group this);{deleteVehicle (_x select 0)}foreach _vehs;deleteGroup _group";
				_wp setWaypointStatements ["true", _done_way];
			};
		};

	//Correct distances
	_abortWay = false;
	while {count _grp_vehs_drivers > 1 && !_abortWay && !isNil "_group"} do {
		_grp_vehs_drivers = _group getVariable "grp_vehs_drvs";

				 private ["_checkveh"];
				_abortWay = false;	
				{
					_checkveh = _x select 0;
					_checkvehpr = _checkveh getVariable "priority";
					if( (!canmove _checkveh)&&(_checkvehpr == 1) )exitwith{
						_abortWay = true;
					};
				}foreach _grp_vehs_drivers;
				
				if(_abortWay)then{
					[_group, _checkveh] execVM "cnv\act\way_guardBrok.sqf";
				};

		_closer_vehicl = ( (_grp_vehs_drivers select (count _grp_vehs_drivers - 1)) select 0 );
		_max_dist = (count _grp_vehs_drivers) * 50;
		
		_dist = _closer_vehicl distance (leader _group);
		if(_dist > _max_dist)then{(leader _group) forcespeed 1}else{(leader _group) forcespeed -1};
		
		sleep 5;	
	};
};
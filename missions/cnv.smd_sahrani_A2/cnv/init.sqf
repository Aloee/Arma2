/*
	Author: aloe itfruit@mail.ru
	Copyright (C) 2014 Aloe

	Convoy script: init.sqf
	
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

=======================
Convoys array structure
[side, spawn, [[[type, priority],[[crews],[cargo]]]], [way]]
	side (side)- side convoy
	spawn (array)- position create convoy 
	
	elements convoy (array) - contains the elements of the convoy
		type (string) - type of vehicle
		priority (number): 1 or 0
		If vehicle priority 1 is damaged and can not move. Convoy stops until transport is repaired (automatically).
		If vehicle with priority 0 is damaged, and can not move. Waypoints convoy will remain the same
		crews (array) - the crew of the current element
		cargo (array) - the units in cargo of the current element
		way (array)- contain markernames of way
	
If driver same vehicle will be killed his place will be a unit of any unit of the cargo compartment
and the convoy will continue the path.
Upon reaching the destination of the convoy - the convoy will be deleted
*/

if(!isServer && !isDedicated)exitwith{};

_randway = _this;

_cnvs = [
[east,
	 getMarkerPos (_randway select 0),
	 [
	 [["BTR90", 0],[["CDF_Soldier_Crew","CDF_Soldier_Crew","CDF_Soldier_Crew"],[]]],
	 [["UralReammo_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],
	 [["UralReammo_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],	 
	 [["Ural_CDF", 0],[["CDF_Soldier_Light",nil,nil],["CDF_Soldier_Medic","CDF_Soldier_MG","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Strela","CDF_Soldier_Officer"]]]
	 ],
	 _randway
],
[east,
	getMarkerPos (_randway select 0),
	 [
	 [["T90", 0],[["CDF_Soldier_Crew","CDF_Soldier_Crew","CDF_Soldier_Crew"],[]]],
	 [["UralRepair_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],
	 [["KamazRepair", 1],[["CDF_Soldier_Light",nil,nil],[]]],	 
	 [["Ural_CDF", 0],[["CDF_Soldier_Light",nil,nil],["CDF_Soldier_Medic","CDF_Soldier_MG","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Strela","CDF_Soldier_Officer"]]]
	 ],
	 _randway
],
[east,
	getMarkerPos (_randway select 0),
	 [
	 [["BRDM2_GUE", 0],[["CDF_Soldier_Crew","CDF_Soldier_Crew",nil],[]]],
	 [["UralRefuel_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],
	 [["KamazRepair", 1],[["CDF_Soldier_Light",nil,nil],[]]],	 
	 [["Ural_CDF", 0],[["CDF_Soldier_Light",nil,nil],["CDF_Soldier_Medic","CDF_Soldier_MG","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Strela","CDF_Soldier_Officer"]]]
	 ],
	 _randway
]
];

//execute
_null = (_cnvs select floor(random count _cnvs)) execvm "cnv\create.sqf";
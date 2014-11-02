/*
	Author: Horner
	Description: Code for the loot system
*/

// Does not work if you host locally, if you want to host locally just comment this next line out
if (!isServer) exitWith {};


// Do not edit anything below here

hrn_worldCenter = (getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"));

hrn_fnc_setLoot =
{
	private["_holder","_random","_arr","_subArr","_wep","_mag","_modifiers","_magAmount"];
	_holder = _this select 0;
	_random = round (random 100);
	_arr = hrn_commonWepArray;
	if (_random > 60) then
	{
		_arr = hrn_semiCommonWepArray;
	};
	if (_random > 85) then
	{
		_arr = hrn_semiRareWepArray;
	};
	if (_random > 95) then
	{
		_arr = hrn_rareWepArray;
	};
	if (_random > 99) then
	{
		_arr = hrn_veryRareWepArray;
	};
	_subArr = _arr select (floor (random (count _arr)));
	_wep = _subArr select 0;
	_mag = _subArr select 1;
	_modifiers = _subArr select 2;
	_magAmount = round ((random (_modifiers select 1)) + (_modifiers select 0));
	if (_wep != "") then
	{
		_holder addWeaponCargo [_wep, 1];
	};
	if (_mag != "" && _magAmount > 0) then
	{
		_holder addMagazineCargo [_mag, _magAmount];
	};
};

hrn_fnc_spawnLoot =
{
	private["_a","_pos","_wepHolder","_mrk","_nearHolders"];
	_pos = hrn_allPositionsArray select (floor (random (count hrn_allPositionsArray)));
	_nearHolders = nearestObjects [_pos, ["weaponholder"], 1];
	if (count _nearHolders < 1) then
	{
		_wepHolder = "weaponholder" createVehicle _pos;
		_wepHolder setPosATL [_pos select 0, _pos select 1, (_pos select 2) - 0.3];
	} else {
		_wepHolder = _nearHolders select 0;
	};
	_loot = [_wepHolder] spawn hrn_fnc_setLoot;
	if (hrn_lootDebug) then
	{
		_mrk = createMarker [format["%1_Marker", floor (random 100000)], _pos];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "mil_dot";
		_mrk setMarkerColor "ColorYellow";
		_mrk setMarkerSize [0.5, 0.5];
	};
};

for [{_i = 0},{_i <= hrn_initialLootSpawns},{_i = _i + 1}] do
{
	[] call hrn_fnc_spawnLoot;
	sleep 0.05;
};

//while {true} do
//{
	//[] call hrn_fnc_spawnLoot;
	//sleep hrn_lootSpawnPeriod;
//};
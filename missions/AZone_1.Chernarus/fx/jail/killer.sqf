_killer = _this select 0;
_causeStr = _this select 1;

_veh = (vehicle _killer);
loadout_b4_jail = [magazines _killer, weapons _killer];

if (!alive _killer) exitWith {isKiller=false;};
inJail=true;

[nil, nil, rCALLVAR, [_causeStr, name _killer], {debug globalChat format[localize (_this select 0), (_this select 1)]}] call RE;

removeAllWeapons _killer;
removeAllItems _killer;

_killer addWeapon "ItemRadio"; //This is added so jailed player can still see radio side chat messages while in jail.

if (_veh != _killer) then {
	doGetOut _killer;
	sleep 0.5;
};

_killer switchMove "";

//You can adjust this, it set the direction that the player faces when teleported into jail. It will also set the cut scene camera angle when it pans in.
_killer setDir 240;

//Do not adjust this. The -2 setting acts more like a 6 meter radius. Any larger and players might teleport outside of the jail cell instead of inside it.
_killer SetPos [(getPosATL jail_center_H select 0)-2*sin(round(random 359)),(getPosATL jail_center_H select 1)-2*cos(round(random 359))];

_killer switchCamera "EXTERNAL";

playSound "jail";

3 cutRsc ["jail_pic", "PLAIN", 4];

_dir1 = getDir _killer;
_dir2 = getDir jail_center_H;

_x_axis = (getPosATL _killer select 0) + 5*sin _dir1;
_y_axis = (getPosATL _killer select 1) + 5*cos _dir1;
_cam = "camera" camCreate  [_x_axis, _y_axis ,1];
showCinemaBorder false;
_cam camSetFov 0.1;

_cam camSetTarget _killer;
_cam cameraEffect ["internal", "BACK"];
_cam camCommit 0;

_x_axis = (getPosATL _killer select 0) + 30*sin _dir1;
_y_axis = (getPosATL _killer select 1) + 30*cos _dir1;
_cam camSetPos [_x_axis, _y_axis ,7];
_cam camSetFov 0.5;
_cam camCommit 5;
waitUntil {camcommitted _cam};

_killer playActionNow "sitdown";

_x_axis = (getPosATL jail_center_H select 0) + 30*sin _dir2;
_y_axis = (getPosATL jail_center_H select 1) + 30*cos _dir2; 
_cam camSetPos [_x_axis, _y_axis, 7];
_cam camSetFov 0.5;
_cam camCommit 5;
waitUntil {camcommitted _cam};

_cam cameraEffect ["terminate","TOP"];
camDestroy _cam;

if (!alive _killer) exitWith {};

hint composeText [parsetext format[localize "STRD_title_hellojail"]];

sleep 6;

if (!alive _killer) exitWith {};

jailCountdownActive=true;

timer = [_killer] execVM "fx\jail\jail_timer.sqf";

waitUntil {not jailCountdownActive};








// << SENT TO JAIL
// ------------------------
// RELEASED FROM JAIL >>









inJail=false;
isKiller=false;

_killer switchMove "";

//if you uncomment one of the following other methods, remember to then block the method that you will no longer be using anymore.

//============== Use this if you want the player to be released from jail within random radius of the "respawn_west" marker. The "-8" actually acts more like a 16 radius. This can be adjusted.
_killer setDir 65; //You can adjust this, this will set the direction that the player faces when teleported back to the respawn marker.

_respawnPos = switch(side _killer)do{case east : {"respawn_east"};case resistance : {"respawn_guerrila"};default {"kardon_area"}};
_killer SetPos [(getMarkerPos _respawnPos select 0)-8*sin(round(random 359)),(getMarkerPos _respawnPos select 1)-8*cos(round(random 359))];

//============== Use this for 1 "respawn_west" marker. Player will be released from Jail at this exact position.
//_killer setDir 65; //You can adjust this, this will set the direction that the player faces when teleported back to the respawn marker.
//_killer setPos [(getMarkerPos "respawn_west" select 0)+0,(getMarkerPos "respawn_west" select 1)+0,(getMarkerPos "respawn_west" select 2)+0];

//============== Use this if you want to have multiple "respawn_west" markers. Player will be released from Jail at one of these random positions. Works when respawning too.
//_killer setDir 65; //You can adjust this, this will set the direction that the player faces when teleported back to the respawn marker.
//_respawn_markers = ["respawn_west", "respawn_west_1", "respawn_west_2", "respawn_west_3", "respawn_west_4"];
//_killer setpos (getMarkerPos (_respawn_markers select (floor(random(count _respawn_markers)))));

removeAllWeapons _killer; // This removes the radio that was added to the jailed player

_mags = loadout_b4_jail select 0;
_weps = loadout_b4_jail select 1;

{_killer addMagazine _x} foreach _mags;
{_killer addWeapon _x} foreach _weps;

_killer selectWeapon (primaryWeapon _killer);
_muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon _killer >> "muzzles");
_killer selectWeapon (_muzzles select 0);

hint composeText [parsetext format[localize "STRD_title_buyjail"]];
[debug, nil, rglobalChat,  format[localize "STRD_title_relaisedjail",name _killer]] call RE;
_killer = _this select 0;

if (!alive _killer) exitWith {isKiller=false;};

waitUntil {inJail};

sleep 1;

waitUntil {((!inJail) OR (!alive _killer) OR (!isPlayer _killer))};

inJail=false;
isKiller=false;

terminate escapee;
terminate jail;
terminate timer;

if (!isPlayer _killer) then {
	_killer setDammage 1;
};

//This will terminate any camera "cutscene" that might have been running, but it probably isn't really needed.
_cam = "camera" camCreate position _killer;
_cam camSetFov 0.1;

_cam camSetTarget _killer;
_cam cameraEffect ["internal", "BACK"];
_cam camCommit 0;

_cam cameraEffect ["terminate","TOP"];
camDestroy _cam;
showCinemaBorder false;
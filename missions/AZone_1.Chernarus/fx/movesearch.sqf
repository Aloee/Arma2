_unit = _this select 0;
_deg  = _this select 1;

_face = getdir _unit;
_gman = (gunner (vehicle _unit));

while {alive _gman &&  alive _unit} do {
	_newDir = _face+(random -(_deg)+(_deg/2));
	_gman setFormDir _newDir;
	sleep (random 6)+2;
};
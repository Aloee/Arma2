private ["_pos", "_PS"];

_pos = _this select 0;
_pos setpos [(getpos _pos) select 0, (getpos _pos) select 1, 2];

_PS = "#particlesource" createVehicle getpos _pos;
_PS setParticleCircle [0, [0, 0, 0]];
_PS setParticleRandom [0, [5, 5, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
_PS setParticleParams ["ca\Data\kouleSvetlo", "", "billboard", 1, 10, [0,0,0], [0, 0, 0], 5, 0.05, 0.04, 0, [0.5,1,2], [[1,1,1,0.3],[0.5,0.46,0.81,0.4],[1,0,0,0]], [0.2], 0.2, 0.25, "Souls_act.sqf", "", _pos];
_PS setDropInterval 1;
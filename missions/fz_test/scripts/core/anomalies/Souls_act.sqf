_victims = nearestObjects [[(_this select 0),(_this select 1), 0], ["Man"], 1];
if({alive _x} count _victims != 0)then{
	_pos = [(_this select 0),(_this select 1), 0];
	
	_PS = "#particlesource" createVehicle _pos;
	_PS setParticleCircle [0, [0, 0, 0]];
	_PS setParticleRandom [0, [2, 2, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
	_PS setParticleParams ["ca\Data\kouleSvetlo", "", "billboard", 1, 1, [0,0,1.7], [0, 0, 0], 5, 0.05, 0.04, 0, [0.5,5,15], [[1,0,0,1],[0,0,1,0.5],[1,1,1,0]], [0.2], 0.2, 0.25, "", "", _victims select 0];
	_PS setDropInterval 3;
	sleep 1;
	deleteVehicle _PS;
	(_victims select 0) setdammage 1;
};
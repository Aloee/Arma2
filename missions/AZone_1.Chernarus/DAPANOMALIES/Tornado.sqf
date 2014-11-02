if(local player)then{

	_logic = _this select 0;
	_victim = _this select 1;
	_range = _this select 2;

	_pos = _victim modelToWorld [0,0,0];
	_h = _pos select 2;
	_maxh = ((_pos select 2)+15);
	_state=0;
	_d=0;
	_dx=0;
	_n=0.25;
	private ["_n"];
	//if (!(_victim isKindOf "MAN")) then {_victim enableSimulation false;};

	/* 
	while {(_h<_maxh) and (_d<75)} do {
		_pos = _victim modelToWorld [0,0,0];
		_h = _pos select 2;
		_d=_d+0.25;
		_dx=_dx+_n;
		if ((_d>=15)and (_victim isKindOf "AIR")) then {_n=0;};
		if (_d>=45) then {_n=0;};
		_victim setVelocity [((random 5)-(random 1)),((random 5)-(random 1)), 0];
		_victim setPosASL [getPosASL _victim select 0,getPosASL _victim select 1,(getPosASL _victim select 2)+0.025];
		_victim setDir ((getDir _victim)+_dx);
		if ((_d>=25) and (_state==0) and (_victim isKindOf "MAN")) then {_logic say "dap_mincer_wind"; removeAllweapons _victim ;_victim setPos [getPosATL _victim select 0, getPosATL _victim select 1, (getPosATL _victim select 2)+1];_victim switchMove "HaloFreeFall_non";_state=1;};
		if ((_d>=25) and (_state==0)) then {_logic say "dap_mincer_wind";_state=1;};
		sleep 0.001;
	};
	_victim enableSimulation true;
	*/

	_positionC = _victim modelToWorld [0, 0, 0];

	if (_victim == vehicle _victim) then {
		
		_victim setVelocity [((random 20)-(random 20)),((random 20)-(random 20)),(random 15)];
		_victim setDammage 1;

		_positionB = _victim modelToWorld [0, 0, 0];
		deleteVehicle _victim;
		
		_positionB spawn{
			_particleSourceB = "#particlesource" createVehicleLocal _this;
			_particleSourceB setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal",16,13,1,0],"","Billboard",0.005,0.25,[0,0,0],[0,0,0],1,10.1,7.9,0.05,[1,0.25],[[0.2,0.2,0.2,0.6],[0.2,0.2,0.2,0]],[1,0],0,0,"","",""];
			_particleSourceB setParticleRandom [0.1,[0,0,0],[15,15,15],5,0.5,[0,0,0,0.2],0,0];
			_particleSourceB setParticleCircle [0,[1,1,1]];
			_particleSourceB setDropInterval 0.0005;
			sleep 0.05;
			deleteVehicle _particleSourceB;
		};		
	}else{
		vehicle _victim setVelocity [(random 100)-(random 50),(random 20)-(random 20), random 15];
	};

	/*
	_particleSourceC = "#particlesource" createVehicleLocal _positionC;
	_particleSourceC setParticleParams [["\Ca\Data\ParticleEffects\Hit_Leaves\Leaves_Green.p3d",1,0,1,0],"","SpaceObject",1,10,[0,0,0],[0,0,0],1,1.5,1,0.2,[1.5],[[1,1,1,1]],[1],0.1,0.1,"","",""];
	_particleSourceC setParticleRandom [0.1,[0,0,1],[4,4,5],0,0.5,[0.05,0.05,0.05,0],0,0];
	_particleSourceC setParticleCircle [0,[0,0,0]];
	_particleSourceC setDropInterval 0.005;
	sleep 0.25;
	deleteVehicle _particleSourceC;
	*/
};
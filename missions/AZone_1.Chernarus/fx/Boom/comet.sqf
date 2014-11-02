if(local player)then{

	private ["_xpos", "_ypos", "_zpos", "_light1", "_lightg1", "_scl", "_sclg"];

	_xpos = _this select 0;
	_ypos = _this select 1;
	_zpos = 500;
	_inEarch =false;
	_pos = [_xpos, _ypos, _zpos];
	_velocity = [0,800,-100];

	_cameraWait = "camera" camCreate [(getPosATL initcam select 0)-0.75, (getPosATL initcam select 1)-0.75, 1.7];
	_cameraWait cameraEffect ["internal","back"];
	_cameraWait camSetFOV 1;
	_cameraWait camSetTarget initcamfocus;
	_cameraWait camCommit 5;
	[localize "STRD_title_waitServer"] spawn fx_infoText;

	sleep 30;
	0 setFog 0;	

	_commet = "Bo_GBU12_LGB" createvehicle _pos;
	_commet setVelocity _velocity;

	3 cutText ["","BLACK OUT",3];
	player cameraEffect ["terminate","back"];
	_cameraWait camCommit 0;
	camDestroy _cameraWait;
	[_commet] execvm "fx\commetcam.sqf";



	While {!_inEarch} do {
		
		_PS = "#particlesource" createVehicleLocal getPosATL _commet;
		_PS setParticleCircle [0, [0, 0, 0]];
		_PS setParticleRandom [0, [5, 5, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
		_PS setParticleParams ["ca\Data\kouleSvetlo", "", "billboard", 1, 0.5, [0,0,0], [0, 0, 0], 5, 0.05, 0.04, 0, [10,5,3], [[1,0.6,0.6,1],[0.8,0.8,1,0.5],[1,1,1,1]], [0.2], 0.2, 0.25, "", "", _commet];
		_PS setDropInterval 0.1;


		drop ["Ca\Data\cl_basic", "", "Billboard", 5, 60, [0, 0, 1], [0, 0,1], 1, 1, 1, 0, [50, 70], [[0.7,0.7,0.7,1]], [0,1], 1, 1, "", "", _commet];
		if(getPosATL _commet select 2 < 10 or !alive _commet)then{_inEarch = true};
		sleep 0.01;
		
		deleteVehicle _PS;
	};
	/* */

	argt_nuclear_radius = 1500;
	argt_nuclear_blow_speed = 100;
	argt_nuclear_half_life = 10 * 60;
	argt_nuclear_radiation_damage = 0.03;
	argt_nuclear_car_armour = 1 / 4;

	[_commet] execvm "fx\boom\blast.sqf";
};
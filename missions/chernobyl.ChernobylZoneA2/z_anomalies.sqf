	
	FZ_BREAK_ANOMALIES = false;
	FZ_MIN_DIST_ACTIVATE_ANOMALIE = 300;
	FZ_MARKED_ANOMALIES_AFTERHIDE = 0; //sec or 0

if(isDedicated || isServer)then{

	FZ_ANOMALIES_NAME = ["Burn", "Gravi", "Electro", "Mincer", "Psy", "Radiation"]; 
	FZ_ANOMALI_ARTEFACTS = [];
	FZ_ISSETANOMALIES = true;
	FZ_ANOMALIES_COUNT = 100;
	FZ_MIN_RESPAWNS_DISTANCE_ANOMALIES = 500;
	FZ_NO_ANOMALIES_MARKERS = [];
	FZ_MARKED_ANOMALIES = true;
};

if(local player)then{
	
	PRECMPL_ARTEFACT_SPAWN = compile preprocessFileLineNumbers "DAPANOMALIES\ArtefactSpawn.sqf";
	PRECMPL_ANOMALI_WAVE = compile preprocessFileLineNumbers "DAPANOMALIES\Wave.sqf";
	PRECMPL_ANOMALI_MINCERWAVE = compile preprocessFileLineNumbers "DAPANOMALIES\MincerWave.sqf";
	PRECMPL_ANOMALI_TORNADO = compile preprocessFileLineNumbers "DAPANOMALIES\Tornado.sqf";
	PRECMPL_ANOMALI_ACTELECTRO = compile preprocessFileLineNumbers "DAPANOMALIES\ActElectro.sqf";

};

if(!isDedicated && !isServer)exitWith{};

private ["_inparams"];

if(!isNil "anomalies_trg" && FZ_ISSETANOMALIES)then{

	anomali_poses = [];
	anomali_marks = [];
	
	_area = triggerArea anomalies_trg;
	_positions = [getPosATL anomalies_trg, _area select 1, _area select 0, FZ_ANOMALIES_COUNT] call fz_sfx_get_random_positions;

	
	_colors = ["ColorBlack", "ColorRed", "ColorRedAlpha","ColorGreen", "ColorGreenAlpha", "ColorBlue", "ColorYellow", "ColorOrange", "ColorWhite", "ColorPink", "ColorBrown","ColorKhaki"];
	_color = _colors select floor random count _colors;

	
		for [{_i=0}, {_i< count _positions}, {_i=_i+1}] do {
			
			_radius = floor random 100;
			_pos = [(_positions select _i) select 0, (_positions select _i) select 1, 0];
			_artpos = [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2)];
			
			
			_anomaliname = FZ_ANOMALIES_NAME select floor random count FZ_ANOMALIES_NAME;
			_anomaliRandName = format["artefact_%1_%2",_anomaliname, floor random(999999)];
	
			anomali_poses set [count anomali_poses, [_pos, _anomaliname]];

			if(FZ_MARKED_ANOMALIES)then{
				
				_iterid = floor random(999999);
				_markerParams = [format ["marker_%2_%1",_iterid, _anomaliname], [_pos select 0, _pos select 1], 0.5, _color, _anomaliname + "_" + str _i, "ICON", "DOT"];
				_markerParams call fz_sfx_create_public_marker;
				
				anomali_marks set [count anomali_marks, _markerParams];	
			};			
		};

	[nil, nil, rCALLVAR, anomali_poses, "fz_fx_init_anomali_cli"] call RE;
	[nil, nil, "per", rCALLVAR, ["anomali_marks", anomali_marks],"fx_cl_setvar"] call RE;
};
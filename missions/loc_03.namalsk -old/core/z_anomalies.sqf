	
	FZ_BREAK_ANOMALIES = false;
	FZ_MIN_DIST_ACTIVATE_ANOMALIE = 300;
	FZ_MARKED_ANOMALIES_AFTERHIDE = 0; //sec or 0

//Local
if(local player)then{
	
	PRECMPL_ANOMALI_WAVE = compile preprocessFileLineNumbers "core\anomalies\Wave.sqf";
	PRECMPL_ANOMALI_MINCERWAVE = compile preprocessFileLineNumbers "core\anomalies\MincerWave.sqf";
	PRECMPL_ANOMALI_MINCERTORNADO = compile preprocessFileLineNumbers "core\anomalies\MincerTornado.sqf";
	PRECMPL_ANOMALI_ACTELECTRO = compile preprocessFileLineNumbers "core\anomalies\ActElectro.sqf";

};

//Server
if(!isDedicated && !isServer)exitWith{};
	
	FZ_ANOMALI_ARTEFACTS = [];
/*
	FZ_ANOMALIES_NAME = ["Burn", "Gravi", "Electro", "Mincer", "Psy", "Radiation", "Tornado", "Souls"]; 
	FZ_ISSETANOMALIES = true;
	FZ_ANOMALIES_COUNT = 100;
	FZ_MIN_RESPAWNS_DISTANCE_ANOMALIES = 300;
	FZ_NO_ANOMALIES_LOCATIONS = [];
	FZ_MARKED_ANOMALIES = true;
*/
if(!isNil "anomalies_trg" && FZ_ISSETANOMALIES)then{

	anomali_poses = [];
	anomali_marks = [];
	
	_area = triggerArea anomalies_trg;
	_positions = [getPosATL anomalies_trg, _area select 1, _area select 0, FZ_ANOMALIES_COUNT] call fz_sfx_get_random_positions;

	
	_colors = ["ColorBlack", "ColorRed", "ColorRedAlpha","ColorGreen", "ColorGreenAlpha", "ColorBlue", "ColorYellow", "ColorOrange", "ColorWhite", "ColorPink", "ColorBrown","ColorKhaki"];
	_color = _colors select floor random count _colors;

	
		for [{_i=0}, {_i< count _positions}, {_i=_i+1}] do {
			
			_radius = floor random 80;
			_pos = [(_positions select _i) select 0, (_positions select _i) select 1, 0];
			
			
			_anomaliname = FZ_ANOMALIES_NAME select floor random count FZ_ANOMALIES_NAME;
			_artefactRandName = format["artefact_%1_%2",_anomaliname, floor random(999999)];
	
			anomali_poses set [count anomali_poses, [_pos, _anomaliname]];

			if(FZ_MARKED_ANOMALIES)then{
				
				_iterid = floor random(999999);
				_markerParams = [format ["marker_%2_%1",_iterid, _anomaliname], [_pos select 0, _pos select 1], 0.5, _color, _anomaliname + "_" + str _i, "ICON", "DOT"];
				_markerParams spawn fz_sfx_create_public_marker;
				anomali_marks set [count anomali_marks, _markerParams];	
			};
			
			_lightColor = [random 1, random 1, random 1];
			_art = [[random 1,random 1,random 1,random 1],[random 1,random 1,random 1,random 1],[random 1,random 1,random 1,random 1]];
			_artpos = [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2)];
			FZ_ANOMALI_ARTEFACTS set [count FZ_ANOMALI_ARTEFACTS, [_artpos, _anomaliname, _artefactRandName, [_lightColor, _art]]];
		};
	
	FZ_ANOMALI_ARTEFACTS spawn fz_sfx_createArtefacts;
	
	[nil, nil, rCALLVAR, anomali_poses, "fz_fx_init_anomali_cli"] call RE;
	[nil, nil, "per", rCALLVAR, ["anomali_marks", anomali_marks],"fx_cl_setvar"] call RE;
};
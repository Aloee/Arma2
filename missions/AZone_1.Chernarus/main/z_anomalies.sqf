if(!isDedicated && !isServer)exitWith{};

private ["_inparams"];

if(!isNil "anomalies_trg" && ISSETANOMALIES)then{

	anomali_poses = [];
	anomali_marks = [];
	
	_area = triggerArea anomalies_trg;
	_positions = [getPosATL anomalies_trg, _area select 1, _area select 0, ANOMALIES_COUNT] call sfx_get_random_positions;

	
	_colors = ["ColorBlack", "ColorRed", "ColorRedAlpha","ColorGreen", "ColorGreenAlpha", "ColorBlue", "ColorYellow", "ColorOrange", "ColorWhite", "ColorPink", "ColorBrown","ColorKhaki"];
	_color = _colors select floor random count _colors;

	
		for [{_i=0}, {_i< count _positions}, {_i=_i+1}] do {
			
			_radius = floor random 120;
			_pos = [(_positions select _i) select 0, (_positions select _i) select 1, 0];
			_artpos = [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2)];
			
			
			_anomaliname = anomalies_name select floor random count anomalies_name;
			//_anomaliname = "Gravi";
			_anomaliRandName = format["artefact_%1_%2",_anomaliname, floor random(999999)];
			
			
			_lightColor = [random 1, random 1, random 1];
			_art = [[random 1,random 1,random 1,random 1],[random 1,random 1,random 1,random 1],[random 1,random 1,random 1,random 1]];
			
			anomali_poses set [count anomali_poses, [_pos, _anomaliname]];
			anomali_artefacts set [count anomali_artefacts, [_artpos, _anomaliname, _anomaliRandName, [_lightColor, _art]]];
			

			if(MARKED_ANOMALIES)then{
				
				_iterid = floor random(999999);
				_markerParams = [format ["marker_%2_%1",_iterid, _anomaliname], [_pos select 0, _pos select 1], 0.5, "ColorKhaki", _anomaliname + "_" + str _i, "ICON", "DOT"];
				_markerParams call sfx_create_public_marker;
				
				anomali_marks set [count anomali_marks, _markerParams];	
			};
		};

	[nil, nil, rCALLVAR, static_anomalies+anomali_poses, "fx_init_anomali_cli"] call RE;
	[nil, nil, rCALLVAR, anomali_artefacts, "fx_init_artefacts_cli"] call RE;
	[nil, nil, "per", rCALLVAR, ["anomali_marks", anomali_marks],"fx_cl_setvar"] call RE;
};
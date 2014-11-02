//Executed only for JIP clients
if(!isServer) exitWith {};
waitUntil {T_INIT};

_name = _this select 0;
_uid = _this select 1;

	_player_obj = _uid call fx_findUid_pl_body;
	
	//Sych client/server time
	[_player_obj, _player_obj, "loc", rCALLVAR, [date], {setDate (_this select 0)}] call RE;
	
	if(_player_obj != objNull)then{
		//[nil, nil,  rHINT, str _player_obj] call RE;
		//request anomalies and activation
		if(count anomali_poses > 0)then{
			sleep 0.1;
			[nil, _player_obj, "loc", rCALLVAR, static_anomalies+anomali_poses, "fx_init_anomali_cli"] call RE;
		};
		if(!isNil "anomali_artefacts" && count anomali_artefacts > 0)then{
			sleep 0.1;
			[nil, _player_obj, "loc", rCALLVAR, anomali_artefacts, "fx_init_artefacts_cli"] call RE;
		};
		
		if(!isNil "anomali_marks" && count anomali_marks > 0 && MARKED_ANOMALIES_AFTERHIDE == 0)then{
			sleep 0.1;
			[nil, _player_obj, "loc", rCALLVAR, anomali_marks, "fx_create_local_markers"] call RE;
		};
		
		[_uid] spawn PRECMPL_PLAYERCONNECT;
		[[_player_obj, [toDay select 0, toDay select 1, toDay select 2]]] call sfx_updateVisitDates;

	}else{
		format["onconnect.sqf: cant find player object (%3) name %1 uid %2", _name, _uid, _player_obj] call sfx_addlog;
		[nil,nil,rHINT,["RED", format [localize "STR_umessage_error_onload", _name]] call fx_getformat_string] call RE;
	};
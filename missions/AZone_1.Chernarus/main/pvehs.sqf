"ZONA_serverexec_campaction" addPublicVariableEventHandler {	
	//Server Side
	if(!isDedicated && !isServer)exitWith{};
		
	_pl = (_this select 1) select 0;
	_art = (_this select 1) select 1;

	_key = _pl getVariable "camp_key";
		
	switch (_art) do{
		case "creat":{
			
			if(alive _pl)then{
				_searh_box = nearestObjects [getPosATL _pl, [HABAR_STYLE], 5];
				if(count _searh_box == 0 and (getPosATL _pl) select 2 < 1)then{
					_dist = 3;
					_plPos = getPosATL _pl;_plDir = getDir _pl;
					_cPos = [(_plPos select 0)+_dist * sin(_plDir),(_plPos select 1)+_dist * cos(_plDir), _plPos select 2];
					_habar = [_key, _cPos, _plDir, true] call sfx_create_habar;

					if(typeName _habar == "OBJECT")then{
					
						[_key, _habar] spawn {
							[(_this select 0),(_this select 1)] call sfx_load_habar;
						};
						_pos = getPosATL _habar;
						
						//[nil,nil,rHINT,format ["%1,%2, %3",_box_cnt,_habar,_key]] call RE;
						
						if(isNil "_key")then{_key = "player"};	
						
						private ["_index"];
						_i = 0;
						{
							if((_x select 1) == _key)exitwith{ _index = _i }; _i = _i + 1;
						}foreach allhabars;
						_index = if(!isNil "_index")then{_index}else{count allhabars};
						
						allhabars set [_index, [getPosATL _habar, _key, getdir _habar, toDay]];
						
						[nil, _pl, "loc", rCALLVAR, [], {hint parsetext format ["%1<br /><br />%2", ["Blue", localize "STR_hint"] call fx_getformat_string, localize "STR_hint_camp"]}] call RE;	
						[nil, _pl, "loc", rCALLVAR, [_pos], {HQMARKERNAME setMarkerPosLocal [(_this select 0) select 0, (_this select 0) select 1]}] call RE;
					
						//Clients
						[nil, nil, "per", rCALLVAR, ["habars", _pos], "fx_cl_setarr"] call RE;
						
						[nil, _pl, "loc", rCALLVAR, ["habar", _pos], "fx_cl_setvar"] call RE;
						[nil, _pl, "loc", rCALLVAR, ["camped", true], "fx_cl_setvar"] call RE;
						
						[nil, _pl, "loc", rCALLVAR, ["saveact", false], "fx_cl_setvar"] call RE;
						[nil, _pl, "loc", rCALLVAR, ["saveact", true, DELAY_CREATEHABAR], "fx_cl_sleepsetvar"] call RE;
						
					};
				}else{
					[nil,_pl,"loc",rCALLVAR,[],{hint parseText (["Red", localize "STR_hint_wpcamp"] call fx_getformat_string)}] call RE;
				};;
			};	
		};
		case "remove":{
			_pos = getposATL _pl;
			_searh_box = nearestObjects [_pos, [HABAR_STYLE], 3];
			if(count _searh_box != 0)then{
				//Delete objects
				_hp = getposATL (_searh_box select 0);
				deleteVehicle (_searh_box select 0);
				//Update server habs memory
				private ["_index"];
				_i = 0;
				{
					if((_x select 1) == _key)exitwith{ _index = _i };
					_i = _i + 1;
				}foreach allhabars;
				
				allhabars set [_index, objNull];
				allhabars = allhabars - [objNull];
				
				//Client
				[nil, _pl, "loc", rCALLVAR, ["habar", [0,0]], "fx_cl_setvar"] call RE;
				[nil, _pl, "loc", rCALLVAR, ["camped", false], "fx_cl_setvar"] call RE;
				[nil, _pl, "per", rCALLVAR, ["habars", _hp], "fx_cl_removehb"] call RE;
				[nil, _pl, "loc", rCALLVAR, [], {HQMARKERNAME setMarkerPosLocal [0,0]}] call RE;
			};
			
		};
		case "save":{
			
			_searh_box = nearestObjects [getposATL _pl, [HABAR_STYLE], 3];
			if( (count _searh_box != 0) && (typeName _key == "STRING") )then{
			
				_habar = _searh_box select 0;
				_actor_key = _habar getVariable "camp_key";
				
				if(isNil "_actor_key")then{ _actor_key = format ["%1_%2", 1, side _pl] };
				
				private ["_index", "_save"];
		
				_weapons = _habar getVariable "box_weapons";
				_magazines = _habar getVariable "box_mags";
				_money = _habar getVariable "box_items";

				_save = [_actor_key, [_weapons,_magazines,_money]] call sfx_save_habar;
							
				if(!_save)then{
					[nil,_pl,"loc",rCALLVAR,[],{hint parseText (["Red", localize "STR_umessage_error_ser"] call fx_getformat_string)}] call RE;
					format ["Can`t save habar (%1)", _actor_key] call sfx_addlog;
				};
			};
		};
	};
};

"ZONA_serverCreateVehicle" addPublicVariableEventHandler {
	//Server Side
	if(!isDedicated && !isServer)exitWith{};
	
	_type = (_this select 1) select 0;
	_pers = (_this select 1) select 1;
	_pos = getPosATL _pers;

	_vehicle = [_type, _pos] call sfx_createVehicle;

	_vehicle setVariable ["owner", getPlayerUID _pers, true];
	_vehicle execVM "fx\actions\locks.sqf";

};

/*
"ZONA_serverDeadUserSpawnItems" addPublicVariableEventHandler {
	//Server Side
	if(!isDedicated && !isServer)exitWith{};

	_itemType = (_this select 1) select 0;
	_itemParams = (_this select 1) select 1;
	_radius = 5;
	
	switch(_itemType)do{
	
		case "money":{
	
			_type = _itemParams select 0;
			_count = _itemParams select 1;
			_pos = _itemParams select 2;
			
			if(_count != 0)then{
				_object = _type createVehicle [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2), 0];
				[nil, _object, "per", raddaction, format [localize "STR_action_pickupmoney", _count], "fx\actions\pickup_item.sqf",[_itemType,_itemParams],0,true,true,"","player distance _target < 5"] call RE;
			};
		};
		
		case "inv":{
			
			_type = _itemParams select 0;
			_invs = _itemParams select 1;
			_pos = _itemParams select 2;
			
			if(count _invs != 0)then{
				_object = _type createVehicle [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2), 0];
				[nil, _object, "per", raddaction, localize "STR_action_pickupinv", "fx\actions\pickup_item.sqf",[_itemType,_itemParams],0,true,true,"","player distance _target < 5"] call RE;
			};
		};
	};
};
*/
/*
"ZONA_killedPlayerEH" addPublicVariableEventHandler {
	//Server Side
	if(!isDedicated && !isServer)exitWith{};
	
	_hundler =  _this select 1;	
	_killed = _hundler select 0;
	_killer = _hundler select 1;
	
	if (vehicleVarName _killed != vehicleVarName _killer) then {
		_killFriend = (vehicleVarName _killed in s_players && vehicleVarName _killer in s_players)or(vehicleVarName _killed in d_players && vehicleVarName _killer in d_players);	

		if({_killed in list _x}count NO_TK_ZONES > 0 && _killFriend)then{
			[nil, _killer, "loc", rEXECVM, "fx\jail\start_punish.sqf", [_killer, "STRD_title_jailedCauseTK"]] call RE;
		}else{
			if({_killed in list _x}count NEUTRAL_ZONES > 0)then{
				[nil, _killer, "loc", rEXECVM, "fx\jail\start_punish.sqf", [_killer, "STRD_title_jailedCauseNZ"]] call RE;
			};
		};
	};

};
*/
"ZONA_createNewTask" addPublicVariableEventHandler {
	//Server Side
	if(!isDedicated && !isServer)exitWith{};

	_hundler =  _this select 1;
	
	_plUid = _hundler select 0;
	_ownerName = _hundler select 1;
	_taskType = _hundler select 2;
	
	_taskScript = format ["tasks\%1.sqf", _taskType];
	_taskName = format ["Task%1_%2", _taskType, floor random 999999];
	_plObject = _plUid call fx_findUid_pl_body;

	private ["_inProcessWorks"];
	
	_owner = call compile _ownerName;
	if(!isNil "_owner")then{
		_ownerWorks = _owner getVariable "works";
		_collective = true;
		for "_j" from 0 to (count _ownerWorks)-1 do{
			if((_ownerWorks select _j) select 0 == _taskType)exitWith{_collective=(_ownerWorks select _j) select 2};
		};
		
		_inProcessWorks = _owner getVariable "inProcessWorks";
		if(isNil "_inProcessWorks")then{_inProcessWorks = []};

		_taskInProcess = false;
		_i = 0;
		if(_collective)then{
			if(count _inProcessWorks > 0)then{
				//search task in list (clearing performers list)
				{
					(_x select 2) call fx_noPlayerinArrayToObjNull;
					if(_x select 1 == _taskType)then{_taskInProcess = true}else{if(!_taskInProcess)then{_i = _i + 1}};
				}foreach _inProcessWorks;
			};
		};
		
		//[debug, nil, rglobalChat,  format ["%1", _inProcessWorks]] call RE;
	
		if(!_taskInProcess)then{
			//first start
			_params = [_ownerName, _taskName, _taskType] call compile preprocessFile _taskScript; //exec on server
			
			if(typeName _params == "ARRAY")then{
				[nil, _plObject, "loc", rexecVM, _taskScript, _params] call RE;
				_inProcessWorks set [count _inProcessWorks, [_taskName, _taskType, [_plUid], _params]];
			}else{
				[nil, _plObject, "loc", rCALLVAR, [_owner, _params], {(_this select 0) sideChat localize (_this select 1)}] call RE; 
			};
		}else{
			//add playerUID to list performers
			if(!(_plUid in ((_inProcessWorks select _i) select 2)))then{
				((_inProcessWorks select _i) select 2) set [count ((_inProcessWorks select _i) select 2), _plUid];
				[nil, _plObject, "loc", rexecVM, _taskScript, (_inProcessWorks select _i) select 3] call RE;
			}else{
				[nil, _plObject, "loc", rHint, localize "STRD_tasks_doingWork"] call RE;
			};
		};

		_owner setVariable ["inProcessWorks", _inProcessWorks, true];
	};
};

"ZONA_removeTask" addPublicVariableEventHandler {
	_hundler =  _this select 1;
	_hundler call sfx_ZONA_removeTask;
};

"ZONA_cancelTask" addPublicVariableEventHandler {
	_hundler =  _this select 1;
	_npc = call compile (_hundler select 1);

	[getPlayerUID (_hundler select 0), [_npc], [_hundler select 2]] call sfx_clearUserTasks;
	[nil, (_hundler select 0), "loc", rCALLVAR, [_hundler select 2, "Canceled", ""], "fx_removeSimpleTask"] call RE;
};
	
"ZONA_playerConnect" addPublicVariableEventHandler {
	_hundler = _this select 1;
	_hundler execVM "storage\onconnect.sqf";
};

"ZONA_serverexec_stat" addPublicVariableEventHandler {
	[(_this select 1) select 0] call sfx_infoServerStatistic;
};

"ZONA_serverexec_pAttackSay" addPublicVariableEventHandler {
	_pl = (_this select 1) select 0;
	_ds = [_pl, "attack"] call PRECMPL_ATTACKSAY;
};

"ZONA_killedVictim" addPublicVariableEventHandler {
	_hundler = _this select 1;
	
};
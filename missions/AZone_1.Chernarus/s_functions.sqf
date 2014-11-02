//Server
if(isServer or isDedicated) then {
	sfx_setCurrentDate = {
		[nil ,nil, rsetDate, (toDay+_this)] call RE;
	};
	
	sfx_notkzone_add = {
		waitUntil{!isNil "NO_TK_ZONES"};
		NO_TK_ZONES set [count NO_TK_ZONES, _this];
	};
	
	sfx_neutralzone_add = {
		waitUntil{!isNil "NEUTRAL_ZONES"};
		NEUTRAL_ZONES set [count NEUTRAL_ZONES, _this];
	};
	
	sfx_staticanomaly_add = {
		_name = _this select 0;
		_pos = _this select 1;
		waitUntil{!isNil "static_anomalies"};
		static_anomalies set [count static_anomalies, [_pos, _name]];
	};
	
	sfx_location_add = {
		waitUntil{!isNil "locations"};
		_trg = _this select 0;
		_localize = _this select 1;
		_count = _this select 2;
		_wave =  _this select 3;
		
		_pos = getPos _trg;
		_markerParams = [format ["locationA_%1", floor random 9999], [_pos select 0, _pos select 1], (triggerArea _trg) select 0, "Default", "", "ELLIPSE", "Faction_CDF"];
		_marker = _markerParams call sfx_create_public_marker;

		_trg setVariable ["locationProp", [civilian, _marker, true, 0, _localize, civilian, _count, true, false, _wave, _wave], true];
		locations set [count locations, _trg];
	};
	
	sfx_zoneImpact = {
		_units = list _this;

		_sides = [east, west, resistance, sideEnemy];
		_cnt = [];
		_imp = [0, civilian];
		{
			_side = _x;
			_listCnt = {_x isKindOf "CAManBase"} count _units;
			_sideCnt = {_side == side _x and _x isKindOf "CAManBase"} count _units;
			_percent = if(_listCnt > 0 && _sideCnt > 0)then{_sideCnt / _listCnt}else{0};
			_cnt set [count _cnt, [_percent, _side]];
		}foreach _sides;

		{
			if(_imp select 0 < _x select 0)then{_imp = _x};
		}foreach _cnt;
		
	_imp
	};
	
	sfx_infoServerStatistic = {
		
		_pl = _this select 0;
		_dc = 0;_sc = 0;_cc = 0;_mc = 0;
		
		{
			_dc = _dc + ({side _x == east} count units _x);
			_sc = _sc + ({side _x == resistance} count units _x);
			_cc = _cc + ({side _x == civilian} count units _x);
			_mc = _mc + ({side _x == west} count units _x);
		}foreach (patrols+defenses+convoys);
		
	[_pl, _pl, "loc", rHint,  parseText format ["FPS: %8 (%11 percent) <br /> TOTAL UNITS: %6 (%7 groups) <br /><br /> D: %1 <br /> F: %2 <br /> M: %3 <br /> C: %4 <br /> Z: %5 <br /> <br /> Anomalies: %9 <br /> Artefacts: %10<br /> Loot: %12", _dc, _sc, _mc, _cc, count zombies, (_dc+_sc+_mc+_cc+count zombies), count allGroups, diag_fps, count anomali_poses, count anomali_artefacts, floor (diag_fps * 100 / 50), hrn_initialLootSpawns]] call RE;
	};
	
	sfx_load_habar = {
		_key = _this select 0;
		_c_ammo = _this select 1;

		_sdata = [];
		if(!isNil "dataStorage")then{
			for "_i" from 0 to (count dataStorage)-1 do {
				_x = dataStorage select _i;
				if(_x select 0 == _key)exitwith{ _sdata = _x select 1 };
			};
			
			if(count _sdata != 0)then{
				_w = _sdata select 0;
				_m = _sdata select 1;
				_i = _sdata select 2;
				
				//Attach list
				_c_ammo setVariable ["box_weapons",_w,true];
				_c_ammo setVariable ["box_mags",_m,true];
				_c_ammo setVariable ["box_items",_i,true];

			};
		};
		
	_sdata			
	};
	
	sfx_save_habar = {
		_key = _this select 0;
		_data = _this select 1;
		
		private ["_index"];
		for "_i" from 0 to (count dataStorage)-1 do {
			_x = dataStorage select _i;
			if(_x select 0 == _key)exitwith{ _index = _i };
		};
		_index = if(!isNil "_index")then{_index}else{count dataStorage};
		dataStorage set [_index, [_key, _data]];
	};
	sfx_create_habar = {
		
		_key = _this select 0;
		_pos = _this select 1;
		_dir = _this select 2;
		_collision = _this select 3;
		
		_camp =  createVehicle [HABAR_STYLE, _pos, [], 0, "NONE"];
		
		if(!_collision)then{_camp setposatl _pos};
		_camp setDir _dir;
		_camp allowDammage false;
		_camp addEventHandler ["HandleDamage", {false}];

		[nil, nil, "per", rCALLVAR, [getPosATL _camp, "camp_key", _key], "fx_cl_setlist"] call RE;
			
	_camp
	};
	
	sfx_deleteEmptyCamps = {
	
		_emptyCamps = [];
		{
			_key = _x select 1;
			
			private ["_sdata"];			
				for "_i" from 0 to (count dataStorage)-1 do {
					_x = dataStorage select _i;
					if(_x select 0 == _key)exitwith{ _sdata = _x select 1 };
				};
			if(!isNil "_sdata")then{
				if({count _x > 0} count _sdata == 0)then{
					_emptyCamps set [count _emptyCamps, _key];
				};
			};
		}foreach allhabars;

		if(count _emptyCamps > 0)then{
			{
				for "_i" from 0 to (count allhabars)-1 do{
					if((allhabars select _i) select 1 == _x)exitWith{
						allhabars set [_i, objNull]; allhabars = allhabars - [objNull];
					};
				};
				for "_i" from 0 to (count dataStorage)-1 do{
					if((dataStorage select _i) select 0 == _x)exitWith{
						dataStorage set [_i, objNull]; dataStorage = dataStorage - [objNull];
					};
				};
			}foreach _emptyCamps;
			
			["HABAR", allhabars] spawn AOS_SERIALIZE;
			["DATA", dataStorage] spawn AOS_SERIALIZE;
		};
		
	};
	
	sfx_deleteOverdueCamps = {
		_dayslater = ((30 * ((toDay select 1)-1)) + (toDay select 2)); //mounth = 30 days
		_deleteAccs = [];
		
		{
			_year = (_x select 3) select 0;
			_mounth = ((_x select 3) select 1)-1;
			_day = (_x select 3) select 2;

			_absenceDays = if(_year >= toDay select 0)then{_dayslater - (30 * _mounth + _day)}else{_dayslater + (360 - (30 * _mounth + _day))};
			
			if(_absenceDays > OVERDUEACCOUNTDAYS)then{
				_deleteAccs set [count _deleteAccs, _x select 1];
			};
		}foreach allhabars;
		
		if(count _deleteAccs > 0)then{
			{
				for "_i" from 0 to (count allhabars)-1 do{
					if((allhabars select _i) select 1 == _x)exitWith{
						allhabars set [_i, objNull]; allhabars = allhabars - [objNull];
					};
				};
				for "_i" from 0 to (count dataStorage)-1 do{
					if((dataStorage select _i) select 0 == _x)exitWith{
						dataStorage set [_i, objNull]; dataStorage = dataStorage - [objNull];
					};
				};
			}foreach _deleteAccs;
			
			["HABAR", allhabars] spawn AOS_SERIALIZE;
			["DATA", dataStorage] spawn AOS_SERIALIZE;
		};
	};
	
	sfx_updateVisitDates = {
		{
			_key = format ["%1_%2", getPlayerUid (_x select 0), side (_x select 0)];
			_date = _x select 1;
			
			for "_index" from 0 to (count allhabars)-1 do {
				_x = allhabars select _index;
				if((_x select 1) == _key)exitwith{
					allhabars set [_index, [_x select 0, _x select 1, _x select 2, _date]]; 
				};
			};
		}foreach _this;
		
		_save = ["Habar", allhabars] spawn AOS_SERIALIZE;
	};
	
	sfx_firstPlConnect = {
		if(count playableUnits != 0)then{
			_toDUpdate = [];
			_date = [toDay select 0, toDay select 1, toDay select 2];
			
			{
				if( isPlayer _x )then{
					[getPlayerUid _x] spawn PRECMPL_PLAYERCONNECT;
					_toDUpdate set [count _toDUpdate, [_x, _date]];
				};
			}foreach playableUnits;
			
			_toDUpdate call sfx_updateVisitDates;
		};
	};
	
	sfx_create_public_marker = {

		_name = _this select 0;
		_pos = _this select 1;
		_size = _this select 2;
		_color = _this select 3;
		_anomaliname = _this select 4;
		_shape = _this select 5;
		_type = _this select 6;

		_markerstr = createMarker[_name,_pos];
		_markerstr setMarkerShape _shape;
		_name setMarkerType _type;
		_name setMarkerSize [_size, _size];
		_name setMarkerColor _color;
		_name setMarkerText  format ["%1", _anomaliname];
		//publicVariable "markerstr";
	
	_markerstr;
	};
	
	sfx_check_spawnDistance = {
		_result = true;
		{
			if( (_this distance (getmarkerpos _x)) < MIN_RESPAWNS_DISTANCE_ANOMALIES )then{ _result = false;};
		}foreach NO_ANOMALIES_MARKERS;
	_result
	};
	
	//get random count positions at pos and area
	sfx_get_random_positions = {

		_pos = _this select 0;
		_x = _this select 1;
		_y = _this select 2;
		_count = _this select 3;

		_positions = [];

		for [{_i=0}, {_i< _count}, {_i=_i+1}] do {
			_valid = false;
			while{!_valid}do{
				_position = [((_pos select 0)-_x)+floor random (_x*2), ((_pos select 1)-_y)+ floor random (_y*2), 0];
				if(_position call sfx_check_spawnDistance)then{
					_positions set [count _positions, _position];
					_valid = true;
				};
			};
		};

	_positions
	};

	sfx_update_array_emptygroups = {

		{
			_cnt = {alive _x} count (units _x);
			if(_cnt == 0)then{
				_this = _this - [_x]; [_x] call PRECMPL_DEADGROUPS;
			};
		}foreach _this;
		
	_this
	};
	
	sfx_create_crews = {
		_group = _this select 0;
		_vehicle = _this select 1;
		
		if(!isNil "_group")then{
			private ["_ammo","_skin"];
			
			switch (side _group) do {
				case west : {_ammo = "military"};
				case east : {_ammo = "easy_stalker"};
				case resistance : {_ammo = "easy_stalker"};
				case civilian : {_ammo = "easy_stalker"};
			};
			_skin = switch(side _group)do{
				case west : {
					if (_vehicle isKindOf "Air")then{"CDF_Soldier_Pilot"}else{
						if (_vehicle isKindOf "Tank" or _vehicle isKindOf "Wheeled_APC")then{"CDF_Soldier_Crew"}else{"CDF_Soldier_Light"};
					};
				};
				case east : {NPC_DOLG_STYLE select floor random count NPC_DOLG_STYLE};
				case resistance : {NPC_SVOB_STYLE select floor random count NPC_SVOB_STYLE};
				case civilian : {NPC_CIVS_STYLE select floor random count NPC_CIVS_STYLE};
			};

			
			_driver = _group createUnit [_skin, [0,0,0], [], 10, "FORM"];
			_driver moveinDriver _vehicle; _driver assignAsDriver _vehicle;
			[_driver] orderGetIn true; [_driver, _ammo] spawn PRECMPL_PATROLWEAPLOAD; _driver addEventHandler ["killed", { dead_bodys set [count dead_bodys, (_this select 0)] }];
			
			_gunner = _group createUnit [_skin, [0,0,0], [], 10, "FORM"];
			_gunner moveinGunner _vehicle; _gunner assignAsGunner _vehicle;
			[_gunner] orderGetIn true; [_gunner, _ammo] spawn PRECMPL_PATROLWEAPLOAD; _gunner addEventHandler ["killed", { dead_bodys set [count dead_bodys, (_this select 0)] }];
			
			_commander = _group createUnit [_skin, [0,0,0], [], 10, "FORM"];
			_commander moveinCommander _vehicle; _commander assignAsCommander _vehicle;
			[_commander] orderGetIn true; [_commander, _ammo] spawn PRECMPL_PATROLWEAPLOAD; _commander addEventHandler ["killed", { dead_bodys set [count dead_bodys, (_this select 0)] }];
			
			
			if(driver _vehicle != _driver)then{deleteVehicle _driver};
			if(gunner _vehicle != _gunner)then{deleteVehicle _gunner};
			if(commander _vehicle != _commander)then{deleteVehicle _commander};
			
		};
	};
	
	sfx_createVehicle = {
		_type = _this select 0;
		_pos = _this select 1;
		
		_vehicle = createVehicle [_type, _pos, [], 0, "NONE"];
		
		_varname = format["%1_%2", typeof _vehicle, floor (random 99999)];	
		_vehicle SetVehicleVarName _varname;
		_vehicle Call Compile Format ["%1=_This ; PublicVariable ""%1""",_varname];
		
		_vehicle addEventHandler ["killed", {brok_vehicles set [count brok_vehicles, _this select 0]}];
		
		[_vehicle, false, true] execVM "vehicles.sqf";
		
	_vehicle
	};
	
	sfx_protectNpc = {
		_this setBehaviour "CARELESS";
		_this setVariable ["spectating", true];
		_this addEventHandler ["HandleDamage", {(_this select 3) setDammage (getDammage (_this select 3) + (_this select 2));false}];
	};
	
	sfx_clearUserTasks = {
		_uid = _this select 0;
		_persons = _this select 1;
		_works = _this select 2;

		{
			_owner = _x;
			_inProcessWorks = _owner getVariable "inProcessWorks";
			
			if(!isNil "_inProcessWorks")then{
				if(count _inProcessWorks > 0)then{
					{
						_work = _x;
						_commit = false;
						if(count _works>0)then{
							{if(_x == (_work select 0))exitWith{_commit = true}}foreach _works;
						}else{
							_commit = true;
						};
						
						if(_commit)then{
							for "_i" from 0 to (count (_work select 2)) - 1 step 1 do {
								if(_uid in (_work select 2))then{
									(_work select 2) set [_i, ""];
								};
							};
						};
					}foreach _inProcessWorks;
				};
			};
			_owner setVariable ["inProcessWorks", _inProcessWorks];
		}foreach _persons;
	};
	
	sfx_ZONA_removeTask = {

		_taskName = _this select 0; //taskName for owner
		_ownerName = _this select 1; //owner name
		_taskType = _this select 2; //task type
		_taskParams = _this select 3; //[task Localize, ("Canceled" or "Succeeded"), uid player how not hint],
		_taskUnits = _this select 4; // [groups, opjects]

		_owner = call compile _ownerName;
		
		if(!isNil "_owner")then{
			_inProcessWorks = _owner getVariable "inProcessWorks";
			if(count _inProcessWorks > 0)then{
				for "_i" from 0 to (count _inProcessWorks - 1) do {
					if(((_inProcessWorks select _i) select 0) == _taskName)then{
						{
							if(_x != _taskParams select 2)then{
								_obj = _x call fx_findUid_pl_body;
								[nil, _obj, "loc", rCALLVAR, [_taskName, _taskParams select 1, _taskParams select 0], "fx_removeSimpleTask"] call RE;
								
								//next task (queue)
								_ownerWorks = _owner getVariable "works";
								_queue = true;
								for "_j" from 0 to (count _ownerWorks)-1 do{
									if((_ownerWorks select _j) select 0 == _taskType)exitWith{_queue=(_ownerWorks select _j) select 3};
								};
								if((_taskParams select 1) == "Succeeded" && _queue)then{
									[nil, _obj, "loc", rCALLVAR, [_taskType, _ownerName], {
										_taskType = _this select 0;
										_ownerName = _this select 1;
										[getPlayerUID player, _ownerName, _taskType] spawn fx_nextTasks;
									}] call RE;
								};
							};
						}foreach ((_inProcessWorks select _i) select 2);
						
						_inProcessWorks set [_i, objNull];
					};
					
					_i = _i + 1;
				};
				_inProcessWorks = _inProcessWorks - [objNull];
			};
			
			_owner setVariable ["inProcessWorks", _inProcessWorks];
		};
		
		[(_taskUnits select 0),(_taskUnits select 1)] spawn {
			_grps = _this select 0;
			_objs = _this select 1;
			
			if(count _objs > 0)then{
				waitUntil {{_x distance (_objs select 0) < 500} count playableUnits == 0};
				{deleteVehicle _x}foreach _objs;
			};
			
			if(count _grps > 0)then{
				waitUntil {{_x distance (leader (_grps select 0)) < 500} count playableUnits == 0};
				
				for "_i" from 0 to (count _grps - 1) do{
					{if(_x != vehicle _x)then{deleteVehicle vehicle _x};deleteVehicle _x}foreach units (_grps select _i);
					waitUntil{count (_grps select _i) == 0};
					deleteGroup (_grps select _i);
				};			
			};
		};
	};
	
	sfx_selectForCaptureLocation = {
		_side = _this select 0;
		_list = _this select 1;
		
		_enemyLocations = [];
		_emptyLocations = [];
		_location = objNull;
		
		{
			if(triggerText _x in _list or count _list == 0)then{
				_lastImpSide = (_x getVariable "locationProp") select 5;
				if(_lastImpSide == civilian or _lastImpSide == sideEnemy)then{_emptyLocations set [count _emptyLocations, _x]}else{
					if(_side getFriend _lastImpSide == 0)then{_enemyLocations set [count _enemyLocations, _x]};
				};
			};
		}foreach locations;
		
		_owner = switch(_side)do{
			case east : {voronin};
			case resistance : {luka};
			default {objNull};
		};
		
		if(count _emptyLocations > 0)then{
			if(!isNull _owner)then{
				{
					if(_x distance _owner < _owner distance _location)then{_location = _x};
				}foreach _emptyLocations;
			}else{
				_location = _emptyLocations select floor random count _emptyLocations;
			};
		}else{
			if(count _enemyLocations > 0)then{
				if(!isNull _owner)then{
					{
						if(_x distance _owner < _owner distance _location)then{_location = _x};
					}foreach _enemyLocations;
				}else{
					_location = _enemyLocations select floor random count _enemyLocations;
				};
			};
		};
		
	_location
	};
	
	sfx_addlog = {
		_datetime = format ["%3.%2.%1 %4:%5", date select 0, date select 1, date select 2, date select 3, if(date select 4<10)then{"0"+str(date select 4)}];
		diag_log text format ["******** %1 %2", _datetime, _this];
	};
};
if(!isServer && !isDedicated)exitwith{};

_side = _this select 0;
_pos = _this select 1; //start pos
_vehicles_data = _this select 2; //[[veh1, priority], [[crews],[cargo]]], [veh2, [cargo]]]
_waypoints = _this select 3; //[wp1,wp2,wp3] marks

if(count _vehicles_data != 0)then{
		
	//group
	_group = createGroup _side;
		
	if(!isNil "_group")then{
	
		_group setVariable ["uid", format["cnv_%1", floor random(999999)]];
		_group setVariable ["Convoy_way", _waypoints];	
		
		{
			_type = ((_x select 0) select 0);
			_priority = ((_x select 0) select 1);
			_crews_data = _x select 1;

			_veh = _type createVehicle [(_pos select 0)+ random 25,(_pos select 1)+ random 25, 0];
			_veh setVariable ["session", sessionkey];
			if(!isNil "_veh" && count _crews_data != 0)then{
				
				//vehicle
				_veh addEventHandler ["killed", {brok_vehicles set [count brok_vehicles, _this select 0]}];
				
				//_group addVehicle _veh;

				[_veh] execVM "convoy\ammo_cnv.sqf";
				_veh setVariable ["priority", _priority];

					private ["_ammo"];
			
					switch (_side) do {
						case west: { _ammo = "military"};
					};
			
					_o_init = "[this] orderGetIn true; [this, _ammo] spawn PRECMPL_PATROLWEAPLOAD; this addEventHandler [""killed"", { dead_bodys set [count dead_bodys, (_this select 0)];}];";
				
					_crews = _crews_data select 0;
					_cargo = _crews_data select 1;
				//crews
					_d = _crews select 0;
					if(!isNil "_d")then{
						_driver = _d createUnit [getPosATL _veh, _group,"this moveinDriver _veh; this assignAsDriver _veh; "+_o_init, 0.7, "LIEUTENANT"];	
						sleep 0.1;
					};
					_g = _crews select 1;
					if(!isNil "_g")then{
						_gunner = _g createUnit [getPosATL _veh, _group,"this moveinGunner _veh; this assignAsGunner _veh;"+_o_init, 0.7, "SERGEANT"];	
						sleep 0.1;
					};
					_c = _crews select 2;
					if(!isNil "_c")then{
						_commander = _c createUnit [getPosATL _veh, _group,"this moveinCommander _veh; this assignAsCommander _veh;"+_o_init, 1, "LIEUTENANT"];	
						sleep 0.1;
					};
				//cargo
					if(count _cargo != 0)then{
						_sols = [];
						{
							_sol = _group createUnit [_x, getPosATL _veh, [], 0, "FORM"];
							_sol setVehicleInit "[this] orderGetIn true;[this] allowGetIn true;this moveinCargo _veh; this assignAsCargo (vehicle this);"+_o_init;
							processInitCommands;
							
							_sols set [count _sols, _sol];				
						} foreach _cargo;
						_group setVariable ["CargoSquad", _sols];
					};
			};
		}foreach _vehicles_data;
		
		_grp_vehs_drivers = [];	
		{
			if(driver vehicle _x == _x)then{
				_grp_vehs_drivers set [count _grp_vehs_drivers, [vehicle _x, _x]];
			
				_EHkilleddriver = _x addEventHandler ["killed", {_xu = _this execVM "convoy\act\way_drrplc_cnv.sqf"}];
				_EHkilledvehicle = (vehicle _x) addEventHandler ["killed", {
					_grp_vehs_drvs = ((group (_this select 0)) getVariable "grp_vehs_drvs");
					_ind = 0;
					{
						if(_x select 0 == _this select 0)exitWith{};
						_ind = _ind + 1;
					}foreach _grp_vehs_drvs;
					_grp_vehs_drvs set [_ind, objNull];
					_grp_vehs_drvs = _grp_vehs_drvs - [objNull];
				
					group (_this select 0) setVariable ["grp_vehs_drvs", _grp_vehs_drvs];
				}];
			};
		}foreach (units _group);
		
		_group setVariable ["grp_vehs_drvs", _grp_vehs_drivers];
		[_group,_waypoints] execVM "convoy\way_cnv.sqf";
		convoys set [count convoys, _group];
	};
};
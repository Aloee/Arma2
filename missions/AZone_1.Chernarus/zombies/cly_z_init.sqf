if (!isServer) exitWith {};
	waitUntil {!isNil "CLY_zombievictims"};

	_zombie = _this select 0;
	_pos = _this select 1;
	_zombietype = _this select 2;
	_trigger = if(count _this < 4)then{objNull}else{_this select 3};

	removeAllWeapons _zombie;
	removeAllItems _zombie;
	_zombie addRating -10000;
	_zombie setBehaviour "CARELESS";
	_zombie setSpeedMode "LIMITED";
	_zombie allowFleeing 0;
	_zombie setSkill 1;
	_zombie disableAI "TARGET";
	_zombie disableAI "AUTOTARGET";
	_zombie disableAI "FSM";
	_zombie switchMove "amovpercmstpsnonwnondnon";
	_zombie setFaceAnimation 4;
	_zombie setUnitPos "UP";
	if (_zombietype in ["crawler","sneaker","ambusher","passive crawler"])then{_zombie setUnitPos "DOWN"};
	_zombie setDir random 360;
	_zombie setVariable ["BIS_noCoreConversations",true,true];
	_zombie setVariable ["victim",objNull];
	_zombie setVariable ["zombietype",_zombietype];
	_zombie setVariable ["homeZone",_trigger];
	_zombie setVariable ["homePos",_pos];
	_zombie setPosATL _pos;
	
	_zombie addEventHandler [
	"Killed",
	{
		_zombie=_this select 0;
		_zombie setDammage 0;
		
		_sound=CLY_noises_die select floor random count CLY_noises_die;
		[_zombie,_sound] call CLY_z_attackpv;
		
		zombies = zombies - [_this select 0];
		dead_bodys set[count dead_bodys, (_this select 0)];
		
		//(_this select 1) addRating (-rating(_this select 1)-(rating _zombie));
		(_this select 1) addRating -(rating (_this select 1));
		(_this select 1) addScore  -(score (_this select 1));
	}
	];
	_zombie addEventHandler [
		"Dammaged",
		{
			_zombie =_this select 0;
			_part =_this select 1;
			_level =_this select 2;

			switch (_part)do{
				case "legs":{
					_zombie playmove (CLY_zombieanim_tofoot select (floor random (count CLY_zombieanim_tofoot)));
				};
			};
		}
	];
	/**/
	_zombie addEventHandler [
		"HandleDamage",{
			_zombie=_this select 0;
			_damage=_this select 2;
			if (_this select 3!=_zombie) then {
				_zombie setVariable ["victim",_this select 3];
			};
			
			switch (_this select 1) do {
				case "":{(getDammage _zombie)+_damage*0.02};
				case "head_hit":{(getDammage _zombie)+_damage*0.25};
				case "body":{(getDammage _zombie)+_damage*0.05};
				case "hands":{(getDammage _zombie)+_damage*0.03};
				case "legs":{(getDammage _zombie)+_damage*0.03};
			}
		}
	];
	
	//Debug markers
	if(CLY_debug)then{
		_marker=createMarker [format ["zmarker%1",random 100000],getPosATL _zombie];
		_marker setMarkerType "Dot";
		_marker setMarkerSize [0.3,0.3];
		
		[_zombie,_marker,_trigger] spawn {
			while{alive (_this select 0)}do{
				(_this select 1) setMarkerPosLocal getPosATL (_this select 0);
				_color = if((_this select 0) in list (_this select 2))then{"ColorBrown"}else{"ColorRed"};(_this select 1) setMarkerColor _color;
				sleep 1;
			};
			deleteMarker (_this select 1);
		};
	};
	
	//Set Face
	_face="";
	_faces=[];
	if (typeOf _zombie in CLY_zombieclasses_a)then{_faces=_faces+CLY_faces_a};
	if (typeOf _zombie in CLY_zombieclasses_b)then{_faces=_faces+CLY_faces_b};
	if (typeOf _zombie in CLY_zombieclasses_c)then{_faces=_faces+CLY_faces_c};
	if (typeOf _zombie in CLY_zombieclasses_d)then{_faces=_faces+CLY_faces_d};
	if(count _faces==0)then{_faces=CLY_faces};
	
	_face=_faces select floor random count _faces;
	
	_texture="";
	_model=getText (configFile/"CfgVehicles"/(typeOf _zombie)/"model");
	if(_model in CLY_z_alttexturemodels)then{
		_textures = CLY_z_alttextures select (CLY_z_alttexturemodels find _model);
		_texture=_textures select floor random count _textures;
	};

	_zombie setFace _face;
	_zombie setVariable ["face", _face, true];
	
	if(_texture!="")then{ _zombie setObjectTexture [0,_texture]; _zombie setVariable ["texture",_texture,true] };

	
	//Activate Brain
	_zombie execFSM "zombies\zombieLogic.fsm";
	//_zombie call PRECMPL_CLYZOMBIEROUT;

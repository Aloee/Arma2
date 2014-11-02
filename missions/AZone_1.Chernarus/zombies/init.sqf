
//Init variables
if (isNil "CLY_deadcharacters")then{CLY_deadcharacters=[]};

//Determine game version (important for excluding non-supported commands and classes)
CLY_game="A2";


if(isServer)then{
	//Zombie aggro radius (random between min and max)
	CLY_minaggroradius=30;
	CLY_maxaggroradius=300;

	//At what range from a player zombies can spawn and despawn
	//Minimum's function is mostly protecting players at start
	CLY_minspawndist=100;
	CLY_maxspawndist=500;
	CLY_despawndist=CLY_maxspawndist+50;

	//Distance from victim at which a non-horde zombie gives up the chase
	CLY_chasegiveupdist=400;

	//Zombie will pick a random victim within this radius from the nearest target
	//Value of 1 or below is multiplier of aggro radius, 0 disables randomization
	CLY_randomvictimradius=0.333;

	//Motorized vehicle aggro radius multiplier
	CLY_vehicleaggromultiplier=2;

	//Unarmed aggro radius multiplier
	CLY_unarmedaggromultiplier=0.2;

	//Default zombies per km^2
	CLY_defaultdensity=100;

	//Zombie types and their % of automatically generated zombies (must total 100)
	//normal		makes noise when idle, runs to victim when one is spotted
	//surprise		runs to victim when one is spotted, silent until close
	//passive		runs to victim when one is spotted, silent until close, waits still
	//crawler		crawls, silent until very close, aggro radius always maximum
	//passive crawler	crawls, silent until very close, waits still
	//sneaker		crawls, silent until very close, starts running when close, aggro radius always maximum
	//ambusher		crawls, silent until very close, waits still, starts running when victim is in aggro range
	//armored		runs to victim when one is spotted, silent until close, withstands lots of damage
	//slow armored	walks to victim when one is spotted, silent until close, withstands lots of damage
	CLY_zombietypes=[["normal",62],["surprise",30],["passive",0],["crawler",6],["passive crawler",0],["sneaker",2],["ambusher",0],["armored",0],["slow armored",2]];

	//Chance of zombie dropping a random magazine
	CLY_zombiemagazinechance=0.1;

	//Magazines that a zombie can drop
	CLY_zombiemagazines=["30Rnd_9x19_MP5","8Rnd_B_Beneli_74Slug","15Rnd_9x19_M9","7Rnd_45ACP_1911","8Rnd_9x18_Makarov","FlareWhite_M203","30Rnd_545x39_AK","5x_22_LR_17_HMR","8Rnd_B_Saiga12_74Slug","64Rnd_9x19_Bizon","30Rnd_556x45_Stanag","100Rnd_762x54_PK","HandGrenade"];

	//Debug mode - show markers for prepared positions and active zombies
	//CLY_debug=true

	//Sound arrays
	CLY_noises_idle=["idle1","idle2","idle3","idle4","idle5","idle6","idle7","idle8"];
	CLY_noises_chase=["chase1","chase2","chase3","chase4","chase5","chase6","chase7","chase8"];
	CLY_noises_attack=["attack1","attack2","attack3","attack4"];
	CLY_beast_attack =["psidogattack"];
	CLY_noises_die=["die1","die2"];
	CLY_noises_scream=["scream1","scream2","scream3"];
	DYS_attack_phrases=["attack_phrase_2","attack_phrase_3","attack_phrase_4","attack_phrase_5","attack_phrase_6","attack_phrase_7","attack_phrase_8","attack_phrase_9","attack_phrase_10","attack_phrase_11","attack_phrase_12","attack_phrase_13","attack_phrase_14","attack_phrase_15","attack_phrase_18","attack_phrase_19","attack_phrase_20","attack_phrase_21","attack_phrase_22","attack_phrase_23"];
	DYS_attack_phrases_military=["attack_phrase_17","attack_phrase_16"];
	DYS_dead_phrases=["hero_down_1","hero_down_2","hero_down_3","hero_down_4","hero_down_5","hero_down_6"];

	//Unit classes that can be used as zombies - civilian units are not recommended due to AI problems
	//Make subarrays for a group of similar units to make the whole group have the same chance to appear as a single unit
	CLY_zombieclasses=[["Fin","Pastor"],"Ins_Villager3","Ins_Woodlander3","Ins_Woodlander2","Ins_Worker2","Ins_Villager4","Ins_Woodlander1","Ins_Lopotev",["Ins_Soldier_1","Ins_Soldier_Crew","Ins_Soldier_CO","Ins_Bardak"],["CDF_Soldier","CDF_Soldier_Militia","CDF_Soldier_Crew","CDF_Soldier_Light"],["USMC_Soldier","USMC_SoldierM_Marksman","USMC_Soldier_Officer","USMC_Soldier_TL","USMC_Soldier_Crew","USMC_Soldier_Light","FR_TL","FR_Marksman","FR_GL","FR_Sapper","FR_Light"],["RU_Soldier","RU_Soldier_Officer","RU_Soldier_Crew","RU_Soldier_Light","RUS_Soldier3","RUS_Commander"]];
	//CLY_zombieclasses = ["Fin","Pastor"]
	//Armored zombie classes
	CLY_armoredzombieclasses=["MVD_Soldier"];

	//What classes can have which faces (a = Asian, b = African, c = European, d = Arab/Persian)
	//Classes not in any array can have any face
	CLY_zombieclasses_a=[];
	CLY_zombieclasses_b=["Soldier_PMC","Soldier_MG_PMC","Soldier_Engineer_PMC","Ins_Soldier_Pilot","USMC_Soldier","USMC_SoldierM_Marksman","USMC_Soldier_Officer","USMC_Soldier_TL","USMC_Soldier_Crew","USMC_Soldier_Light","FR_TL","FR_Marksman","FR_GL","FR_Sapper","FR_Light","BAF_Soldier_W","BAF_Soldier_L_W"];
	CLY_zombieclasses_c=["Ins_Villager3","Ins_Woodlander3","Ins_Woodlander2","Ins_Worker2","Ins_Villager4","Ins_Woodlander1","Ins_Lopotev","Soldier_PMC","Soldier_MG_PMC","Soldier_Engineer_PMC","Ins_Soldier_Pilot","Ins_Soldier_1","Ins_Soldier_Crew","Ins_Soldier_CO","Ins_Bardak","GUE_Soldier_1","GUE_Soldier_2","GUE_Soldier_3","CDF_Soldier","CDF_Soldier_Militia","CDF_Soldier_TL","CDF_Soldier_Crew","CDF_Soldier_Light","CDF_Soldier_Pilot","USMC_Soldier","USMC_SoldierM_Marksman","USMC_Soldier_Officer","USMC_Soldier_TL","USMC_Soldier_Crew","USMC_Soldier_Light","FR_TL","FR_Marksman","FR_GL","FR_Sapper","FR_Light","BAF_Soldier_W","BAF_Soldier_Officer_W","BAF_crewman_W","BAF_Soldier_AR_W","BAF_Soldier_TL_W","BAF_Soldier_L_W","RU_Soldier","RU_Soldier_Officer","RU_Soldier_Crew","RU_Soldier_Light","RUS_Soldier3","RUS_Commander","MVD_Soldier"];
	CLY_zombieclasses_d=[];

	//ReAnimatons
	CLY_zombieanim_return = ["AwopPpneMstpSgthWnonDnon_end","AmovPpneMstpSnonWnonDnon_AmovPercMsprSnonWnonDf"];
	CLY_zombieanim_tofoot = ["AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon"];

	//Zombie faces
	CLY_faces=[];
	CLY_faces_a=["Face58_camo1"];
	CLY_faces_b=[];
	CLY_faces_c=[];
	CLY_faces_d=[];
	for "_x" from 1 to 107 do {_0=if (_x<10) then {"0"} else {""};_face=format ["Face%1%2_camo1",_0,_x];CLY_faces set [count CLY_faces, _face]};
	for "_x" from 1 to 21 do {_0=if (_x<10) then {"0"} else {""};_face=format ["Face%1%2_camo1_EP1",_0,_x];CLY_faces set [count CLY_faces, _face];CLY_faces_d set [count CLY_faces_d, _face]};
	for "_x" from 108 to 124 do {_face=format ["Face%1_camo1_PMC",_x];CLY_faces set [count CLY_faces, _face];CLY_faces_a set [count CLY_faces_a, _face];};
	for "_x" from 26 to 40 do {_face=format ["Face%1_camo1",_x];CLY_faces_b set [count CLY_faces_b, _face]};
	for "_x" from 78 to 86 do {_face=format ["Face%1_camo1",_x];if (_face!="Face85_camo1") then {CLY_faces_b set [count CLY_faces_b, _face]}};
	for "_x" from 1 to 107 do {_0=if (_x<10) then {"0"} else {""};_face=format ["Face%1%2_camo1",_0,_x];if (_face!="Face58_camo1" and !(_face in CLY_faces_b)) then {CLY_faces_c set [count CLY_faces_c, _face]}};

	//Alternate textures
	CLY_z_alttexturemodels=["\ca\characters2\civil\Worker\Worker","\ca\characters2\civil\Woodlander\Woodlander","\ca\characters2\civil\Villager\Villager"];
	CLY_z_alttextures=[["\ca\characters2\civil\worker\data\worker_co.paa","\ca\characters2\civil\worker\data\Worker_v2_CO.paa","\ca\characters2\civil\worker\data\Worker_v3_CO.paa","\ca\characters2\civil\worker\data\Worker_v4_CO.paa"],["\ca\characters2\civil\woodlander\data\woodlander_co.paa","\ca\characters2\civil\woodlander\data\woodlander_v2_co.paa","\ca\characters2\civil\woodlander\data\woodlander_v3_co.paa","\ca\characters2\civil\woodlander\data\woodlander_v4_co.paa"],["\ca\characters2\civil\villager\data\villager_co.paa","\ca\characters2\civil\villager\data\villager_v2_co.paa","\ca\characters2\civil\villager\data\villager_v3_co.paa","\ca\characters2\civil\villager\data\villager_v4_co.paa"]];

	
	[] execvm "zombies\cly_z_unitupdate.sqf";
	
	
	
	//***********************************CLY_Functions
	//Random zombie classname
	CLY_randomzombie={
		_selected=false;
		_zombie=CLY_zombieclasses select floor random count CLY_zombieclasses;
		while {typeName _zombie=="ARRAY"} do {
			_zombie=_zombie select floor random count _zombie;
		};
		_zombie;
	};

	//Random armored zombie classname
	CLY_randomarmoredzombie={
		_zombie=CLY_armoredzombieclasses select floor random count CLY_armoredzombieclasses;
		while {typeName _zombie=="ARRAY"} do {
			_zombie=_zombie select floor random count _zombie;
		};
		_zombie;
	};
	
	CLY_z_noisepv={
		[nil, nil, rCALLVAR, _this, {(_this select 0) say (_this select 1)}] call RE;
	};
	
	CLY_z_attackpv={
		_zombie=_this select 0;
		_sound=_this select 1;
		_anim=if (count _this>2) then {_this select 2} else {""};
		
		if (_anim!="") then {_zombie switchMove _anim};
		[nil, nil, rCALLVAR, [_zombie, _sound], {(_this select 0) say (_this select 1)}] call RE;
	};

	CLY_z_victimpv={
	
		[nil, _victim, "loc", rCALLVAR, _this, {
			_victim = _this select 0;
			_sound = _this select 1;
			_claw = _this select 2;
			
			format ["CLY_z_victimpv: %1", _this] call sfx_addlog;
			
			if (_sound!="") then {_victim say3D _sound};
			if (_claw>0) then {[_victim,_claw] call CLY_z_claw};
		}] call RE;
		
	};
	
};


if(local player)then{
	
	CLY_z_claw={
		_victim=_this select 0;
		_claw=_this select 1;
		if (player==_victim) then {
			titleRsc [format ["claw%1",_claw],"PLAIN"];
		};
	};
	
	//Zombie face update for clients
	[] execvm "zombies\cly_z_textures.sqf";
};

CLY_cutscene=false;
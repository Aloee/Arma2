if(!isDedicated && !isServer)exitWith{};

//Zombie aggro radius (random between min and max)
	CLY_minaggroradius=30;
	CLY_maxaggroradius=300;

	//At what range from a player FZ_ZOMBIES can spawn and despawn
	//Minimum's function is mostly protecting players at start
	CLY_minspawndist=100;
	CLY_maxspawndist=500;
	CLY_despawndist=CLY_maxspawndist+50;

	//Distance from victim at which a non-horde zombie gives up the chase
	CLY_chasegiveupdist=150;

	//Zombie will pick a random victim within this radius from the nearest target
	//Value of 1 or below is multiplier of aggro radius, 0 disables randomization
	CLY_randomvictimradius=0.333;

	//Motorized vehicle aggro radius multiplier
	CLY_vehicleaggromultiplier=2;

	//Unarmed aggro radius multiplier
	CLY_unarmedaggromultiplier=0.2;

	//Default FZ_ZOMBIES per km^2
	CLY_defaultdensity=100;

	//Magazines that a zombie can drop
	CLY_zombiemagazines=["30Rnd_9x19_MP5","8Rnd_B_Beneli_74Slug","15Rnd_9x19_M9","7Rnd_45ACP_1911","8Rnd_9x18_Makarov","FlareWhite_M203","30Rnd_545x39_AK","5x_22_LR_17_HMR","8Rnd_B_Saiga12_74Slug","64Rnd_9x19_Bizon","30Rnd_556x45_Stanag","100Rnd_762x54_PK","HandGrenade"];

	//Debug mode - show markers for prepared positions and active FZ_ZOMBIES
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

	//Unit classes that can be used as FZ_ZOMBIES - civilian units are not recommended due to AI problems
	//Make subarrays for a group of similar units to make the whole group have the same chance to appear as a single unit
	CLY_zombieclasses=["gsc_eco_stalker_head_duty_z","MVD_Soldier_z","Doctor_z","Citizen4_z","Citizen1_z","Citizen3_z",["Citizen2_z","Villager3_z","Villager2_z","Villager1_z","Villager4_z"],["Woodlander4_z","Woodlander3_z","Woodlander2_z","Woodlander1_z","Policeman_z"],["RU_Soldier_Officer_z","Pilot_z","Assistant_z","Worker2_z","Worker4_z","Worker1_z","Worker3_z","RUS_Soldier_z","Rocker4_z","Rocker2_z","Rocker3_z","Rocker1_z"],["Priest_z","gsc_eco_stalker_head_duty_z","gsc_eco_stalker_mask_fred_z","gsc_eco_stalker_mask_camo_z"]];
	CLY_dogclasses=["DAP_WILDDOG_A", "DAP_WILDDOG_B"];
	CLY_bloodsuckerclasses=["bloodsucker"];

	
	//***********************************CLY_Functions
	//Random zombie classname
	CLY_randomzombie={
		private ["_monstr"];
		
		switch(_this)do{
			case "zombies" :{_monstr=CLY_zombieclasses select floor random count CLY_zombieclasses};
			case "dogs" :{_monstr=CLY_dogclasses select floor random count CLY_dogclasses};
			case "bloodsuckers" :{_monstr=CLY_bloodsuckerclasses select floor random count CLY_bloodsuckerclasses};
		};
		
		if(typeName _monstr=="ARRAY")then{
			_monstr=_monstr select floor random count _monstr;
		};
	_monstr;
	};
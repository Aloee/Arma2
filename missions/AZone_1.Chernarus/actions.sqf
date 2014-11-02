while {true} do{

	waituntil { sleep 0.1; alive player };

	//[nil,player,"loc", raddaction, "Camp","storage\creat_camp.sqf",[_pl],1,false,false,"","_target == player"] call RE;
	//player addaction ["test", "test.sqf", [], 0, false, false, "", ""];
	//camp
	player addaction [["Aqua",localize "STR_action_camp"] call fx_getformat_string,"storage\creat_camp.sqf",["creat"],0,false,false,"","!camped && saveact && speed player < 1"];
	player addaction [["Red",localize "STR_action_remove"] call fx_getformat_string,"storage\creat_camp.sqf",["remove"],0,false,false,"","camped && (_target distance habar < 3)"];

		//dialogue
		player addaction [["Orange",localize "STR_action_box"] call fx_getformat_string,"dialog\box\showmnecontent.sqf",[player],6,false,false,"","({_target distance _x < 3} count habars) != 0"];
	
	//weaponDealer
	player addaction [["Aqua", localize "STR_action_weapDealerBuy"] call fx_getformat_string, "dialog\wDealer\show.sqf",[weaponsDealerSvo,partsWeaponsDealerSvo], 6, false, false, "", "side player == resistance && _target distance weaponDealerSvo < 3"];
	player addaction [["Aqua", localize "STR_action_weapDealerBuy"] call fx_getformat_string, "dialog\wDealer\show.sqf",[weaponsDealerDolg,partsWeaponsDealerDolg], 6, false, false, "", "side player == east && _target distance weaponDealerDolg < 3"];
	player addaction [["Aqua", localize "STR_action_weapDealerBuy"] call fx_getformat_string, "dialog\wDealer\show.sqf",[weaponsDealerMil,partsWeaponsDealerMil], 6, false, false, "", "_target distance sidorch < 3"];
	player addaction [["Aqua", localize "STR_action_weapDealerBuy"] call fx_getformat_string, "dialog\wDealer\show.sqf",[weaponsDealerBar,partsWeaponsDealerBar], 6, false, false, "", "_target distance barmen < 3"];
	
	//carDealer
	player addaction [["Aqua", localize "STR_action_carDealerBuy"] call fx_getformat_string, "dialog\cDealer\show.sqf",[carsDealerSvo], 6, false, false, "", "side player == resistance && _target distance carDealerSvo < 20"];
	player addaction [["Aqua", localize "STR_action_carDealerBuy"] call fx_getformat_string, "dialog\cDealer\show.sqf",[carsDealerDolg], 6, false, false, "", "side player == east && _target distance carDealerDolg < 20"];
	
	//artefactsDealer
	player addaction [["Aqua", localize "STR_action_artDealerBuy"] call fx_getformat_string, "dialog\aDealer\show.sqf",[artsDealers, artDealer1], 6, false, false, "", "_target distance artDealer1 < 3 && side _target != east"];
	player addaction [["Aqua", localize "STR_action_artDealerBuy"] call fx_getformat_string, "dialog\aDealer\show.sqf",[artsDealers, sidorch], 6, false, false, "", "_target distance sidorch < 3  && side _target != east"];
	player addaction [["Aqua", localize "STR_action_artDealerBuy"] call fx_getformat_string, "dialog\aDealer\show.sqf",[artsDealers, saharov], 6, false, false, "", "_target distance saharov < 3"];
	player addaction [["Aqua", localize "STR_action_artDealerBuy"] call fx_getformat_string, "dialog\aDealer\show.sqf",[artsDealers, barmen], 6, false, false, "", "_target distance barmen < 3 && side _target != east"];
	
	//taskDealer
	//player addaction [["Aqua", localize "STR_action_task"] call fx_getformat_string, "dialog\tasks\buildDialog.sqf",[sidorch], 6, false, false, "", "_target distance sidorch < 3  && side _target != east"];
	player addaction [["Aqua", localize "STR_action_task"] call fx_getformat_string, "dialog\tasks\buildDialog.sqf",[saharov], 6, false, false, "", "_target distance saharov < 3"];
	player addaction [["Aqua", localize "STR_action_task"] call fx_getformat_string, "dialog\tasks\buildDialog.sqf",[luka], 6, false, false, "", "_target distance luka < 200  && side _target == resistance"];
	player addaction [["Aqua", localize "STR_action_task"] call fx_getformat_string, "dialog\tasks\buildDialog.sqf",[voronin], 6, false, false, "", "_target distance voronin < 200  && side _target == east"];
	
	waituntil { sleep 0.1; !alive player };
};
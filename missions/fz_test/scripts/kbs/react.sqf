if(local player)then{
	BIS_convMenu = [];

	_scope = _from getVariable "kbs_scope";
	if(isNil "_scope")then{ _scope = "private"; };
	if(_scope == "public")then{
		//All
		if (_sentenceId == "") then {
			BIS_convMenu = BIS_convMenu + [[localize "STR_tasks", _topic, "STR_tasks", []]];
			BIS_convMenu = BIS_convMenu + [[localize "STR_news", _topic, "STR_news", []]];
			if(count stuff != 0)then{
				BIS_convMenu = BIS_convMenu + [[localize "STR_taskStuff", _topic, "STR_taskStuff", []]];
			};
			//BIS_convMenu = BIS_convMenu + [[localize "STR_bargain", _topic, "STR_bargain", []]];
		};

		//Tasks
		if (_this kbWasSaid [_from, _topic, "STR_tasks", 3]) then {
			_tasksList = call compile (_from getVariable "work");
			if(!isNil "_tasksList")then{
				if( count _tasksList > 1 )then{
						showCommandingMenu "#USER:_tasksList";
				}else{
					[_from, _this, _topic, ["STR_tasks_nopresent"], "STR_tasks", 10] call fx_kbTellOneSayResponse;
				};
			}else{
				if(side _from == east or side _from == resistance)then{
					[_from, _this, _topic, negative_tasks, "STR_tasks", 10] call fx_kbTellOneSayResponse;
				}else{
					[_from, _this, _topic, negative_replics, "STR_tasks", 10] call fx_kbTellOneSayResponse;
				};
			};
		};
		
		//Tasks stuff
		if (_this kbWasSaid [_from, _topic, "STR_taskStuff", 1]) then {
			if(count stuff > 0)then{
				if(isNil {_this getVariable "PROCESSSTUFFDIALOGFIX"})then{
					_this setVariable ["PROCESSSTUFFDIALOGFIX", true];
					0 = _from execVM "dialog\stuff\build_dialog.sqf";
					_this spawn {
						waitUntil {!(ctrlShown ((findDisplay 70001) displayCtrl 70002))};
						_this setVariable ["PROCESSSTUFFDIALOGFIX", nil];
					};
				};
			};
		};
		

		//News
		if (_this kbWasSaid [_from, _topic, "STR_news", 3]) then {
			_newsList = call compile (_from getVariable "news");
			if(!isNil "_newsList")then{
			
			}else{
				[_from, _this, _topic, negative_news, "STR_news", 10] call fx_kbTellOneSayResponse;
			};
		};
	};

	BIS_convMenu
};

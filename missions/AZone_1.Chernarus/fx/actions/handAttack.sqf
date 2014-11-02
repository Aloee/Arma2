
if(local player)then{	
	private ["_damVal", "_handAttack", "_slopeAnim"];

	_hand_attackL = ["AmelPercMstpSnonWnonDnon_amaterUder2"];
	_hand_attackR = ["AmelPercMstpSnonWnonDnon_amaterUder1", "AmelPercMstpSnonWnonDnon_amaterUder3"];
	_slope_attackL = ["AmelPercMstpSnonWnonDnon_zasah2","AmelPercMstpSnonWnonDnon_zasah5hard"];
	_slope_attackR = ["AmelPercMstpSnonWnonDnon_zasah1","AmelPercMstpSnonWnonDnon_zasah4"];
	
	player setVariable ["handAttack", true];
	
	if(primaryWeapon player == "")then{
		_handAttack = (_hand_attackR+_hand_attackL) select floor random count (_hand_attackR+_hand_attackL);
		[nil, player, rswitchmove, _handAttack] call RE; _damVal = 0.05
	}else{
		[nil, player, rswitchmove, "AmelPercMstpSlowWrflDnon_StrokeGun"] call RE; _damVal = 0.1
	};

	sleep 1;
	if(!isNil {_this} && player distance _this < 1.5)then{
		if(alive _this && _this isKindof "Man")then{
			if(!isNil "_handAttack")then{
				if(_handAttack in _hand_attackL)then{
					_slopeAnim = _slope_attackL select floor random count _slope_attackL;
				}else{
					_slopeAnim = _slope_attackR select floor random count _slope_attackR;
				};
			}else{_slopeAnim = "AmelPercMstpSnonWnonDnon_zasah3hard"};
			
			[nil, _this, rswitchmove, _slopeAnim] call RE;
			_this setDammage (getDammage _this + _damVal);
		};
	};
	
	sleep 1;
	player setVariable ["handAttack", nil];
};

_victims = nearestObjects [[(_this select 0),(_this select 1), 0], ["Land"], 20];
if({alive _x} count _victims != 0)then{
	_pos = [(_this select 0),(_this select 1), 0];
	_victim = (_victims select 0);
	_sound = if(isNil {_victim getVariable "zombietype"})then{"hero_call"}else{"die2"};_victim say _sound;
	_flyers = ["AidlPpneMstpSnonWnonDnon_SleepA_layDown","AcinPercMrunSrasWrflDf_agony","AinjPfalMstpSnonWrflDf_carried_fall","AinjPfalMstpSnonWrflDnon_AmovPpneMstpSrasWrflDnon_injured","AcinPercMrunSnonWnonDf_agony"];
	_victim switchmove (_flyers  select (floor random count _flyers));
	_tyaga = 1;
	for "_xs" to 100 do {
		_height = (getpos _victim) select 2;
		_victim setpos [(getpos _victim) select 0, (getpos _victim) select 1, _height+_tyaga];
		_victim setdir ((getdir _victim)+20);
		sleep 0.015;
		if(_xs > 60 && _tyaga > 0)then{_tyaga = _tyaga - 0.05; _victim setVelocity [random 10, random 10, 0];};
	};
	//while{(getpos _victim) select 2 > 1}do{_victim setdir ((getdir _victim)+10);sleep 0.015};
	
};
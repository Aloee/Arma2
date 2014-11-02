//This script updates the player units, the universal victim list and cleans up unitless groups
if(!isServer && !isDedicated)exitwith{};

waitUntil {!isNil "CLY_deadcharacters"};

		
while{true}do{

	CLY_zombievictims=[];
	CLY_players=playableUnits;
	{
		if (!isPlayer _x or !isNil {_x getVariable "spectating"} or typeOf _x in CLY_deadcharacters) then {
			CLY_players=CLY_players-[_x]
		}
	} forEach CLY_players;
	if(!isMultiplayer)then{CLY_players=[player]};
	//publicVariable "CLY_players";
	
	//Determine viable zombie victims
	if(isNil "CLY_cutscene")then{CLY_cutscene = false};
	if(!CLY_cutscene)then{
		{
			if (alive _x and _x isKindOf "Man" and !(vehicle _x isKindOf "Air" and getPosATL vehicle _x select 2>10) and isNil {_x getVariable "victim"} and isNil {_x getVariable "spectating"}) then {
				CLY_zombievictims set [count CLY_zombievictims,_x];
			};
		} forEach allUnits;
	};

sleep 30;
};
if(!isDedicated && !isServer)exitWith{};
waitUntil {!isNil "sessionkey"};

while{true}do{

	defenses = defenses call sfx_update_array_emptygroups;
	patrols = patrols call sfx_update_array_emptygroups;

sleep 60;
};
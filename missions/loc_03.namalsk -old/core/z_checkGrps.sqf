while{true}do{
	{if(count units _x == 0 && isNil{_x getVariable "used"})then{deleteGroup _x}} foreach allGroups;
sleep 15;
};

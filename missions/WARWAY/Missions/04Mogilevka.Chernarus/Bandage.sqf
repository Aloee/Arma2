player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 2;
player setDamage 0;
player removeaction health;
sleep 3;
p=[] execvm "health.sqf";

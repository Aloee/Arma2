car removeaction fire;
disableUserInput true;
sleep 1;
player playmove "AmovPknlMstpSrasWpstDnon_gear";
sleep 5;
disableUserInput false;
deleteWaypoint [Grp_6, 4];
deleteWaypoint [Grp_6, 3];
deleteWaypoint [Grp_6, 2];
deleteWaypoint [Grp_6, 1];
_wp = Grp_6 addWaypoint [position car, 1];
sleep 5;
[car,4,time,false,false] spawn bis_effects_burn;
task3 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task3, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 10;
{_x doMove (position car)} foreach units Grp_4;
{_x doMove (position car)} foreach units Grp_5;
{_x doMove (position car)} foreach units Grp_6;
if (prevention) then {
Grp_c = group c1;
[c1,c2,c3] join Grp_c; 
{_x doMove (position car)} foreach units Grp_c;
sleep 100;
Bo="Bo_GBU12_LGB" createVehicle getPos car;
shoot = false;
sabotage = false;
sleep 30;
sabotage = true;
shoot = true;}
else {
sleep 100;
Bo="Bo_GBU12_LGB" createVehicle getPos car;
shoot = false;
sabotage = false;
sleep 50;
sabotage = true;
shoot = true;
}




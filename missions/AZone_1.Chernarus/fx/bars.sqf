//Server Side
if(!isServer && !isDedicated) exitWith {};
//KORDON_BAR**********************************************************************
//build_bar
myb_1 setpos [(getPos myb_1) select 0, (getPos myb_1) select 1, ((getPos myb_1) select 2)+0.3];
sleep 0.5;
//bar npcs
sidorch setpos [(getPos sidorch) select 0, (getPos sidorch) select 1, ((getPos sidorch) select 2)+1];
//sidorch switchmove "AmovPercMstpSnonWnonDnon_nocollision";
//sidorch_styl setpos [(getPos sidorch) select 0, (getPos sidorch) select 1, (getPos sidorch) select 2];
artDealer2 setpos [(getPos artDealer2) select 0, (getPos artDealer2) select 1, ((getPos artDealer2) select 2)+1];

//garbagecollector
dbb1 setpos [(getPos dbb1) select 0, (getPos dbb1) select 1, ((getPos dbb1) select 2)+1.3];
//bar stone
{_x setpos [(getPos _x) select 0, (getPos _x) select 1, ((getPos _x) select 2)+0.5]}foreach [dbt1_1, sidorch_gen];
//radio
cordon_radio setpos [(getPos dbt1_1) select 0, (getPos dbt1_1) select 1, ((getPos dbt1_1) select 2)+1.5];
_satPhone = createVehicle ["SatPhone", [0,0,0], [], 0, "NONE"];
_satPhone setpos [(getPos dbt1_2) select 0, (getPos dbt1_2) select 1, ((getPos dbt1_2) select 2)+1.9];
_satPhone setdir 180;
_tele = createVehicle ["SmallTV", [0,0,0], [], 0, "NONE"];
_tele setpos [(getPos dbt1_3) select 0, (getPos dbt1_3) select 1, ((getPos dbt1_3) select 2)+1.9];
_tele setdir -30;

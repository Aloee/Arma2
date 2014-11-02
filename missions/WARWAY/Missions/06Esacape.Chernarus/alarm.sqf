alarm = true;
player setCaptive false;
e1 setCaptive false;
Grp_3 = group m1;
[m2, m3] join Grp_3; 
{_x setBehaviour "COMBAT"; _x setCombatMode "RED"; _x switchmove "";_x setUnitPos "UP";} foreach (units enemy); 
{_x doMove (position player)} foreach units Grp_4;
{_x doMove (position player)} foreach units Grp_5;
{_x doMove (position player)} foreach units Grp_6;



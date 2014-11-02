playsound "STRD_PIO49";
[s1, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, e1] join (group player);
_array = [s1, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7];
{_x removeEventHandler ["AnimDone",0]; _x switchmove "";} foreach _array;


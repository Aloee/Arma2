_array_1 = [ch_1,ch_2, ch_3, ch_4, ch_5, ch_6, ch_7, ch_8, ch_9, ch_10, ch_11, ch_12, ch_13, ch_14, ch_15, ch_16, ch_17, ch_18, ch_19, ch_20, ch_21, ch_22, ch_23, ch_24, ch_25, ch_26, ch_27, ch_28, ch_29, ch_30, ch_31, ch_32];
waituntil {_notalive = {not alive _x} count _array_1; _notalive > 10};
if (proval) then {
sleep 3;
titlecut ["","BLACK out",3];
3 fadeMusic 0;
3 fadesound 0;
sleep 3;
titleText [localize "STR_proval1", "PLAIN"];
sleep 3;
endMission "LOSER";
}



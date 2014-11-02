if (alive player) then {
playsound "STRD_PIO19";
player setcaptive true;
of setcaptive true;
of disableAi "MOVE";
sleep 3;
titlecut ["","BLACK out",2];
sleep 3;
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
_camera camPrepareFocus [-1,-1];
_camera camPrepareTarget [-27405.52,95825.07,-11838.48];
_camera camPreparePos [6676.67,2504.60,2.42];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
player setpos [6675.10,2510.61,1.77];
player setvectordir [-57688.66,79018.54,1411.17];
of setpos [6677.43,2512.90,1.77];
of setvectordir [-57688.66,79018.54,1411.17];
e1 setpos [6675.30,2515.08,1.77];
e1 setvectordir [32925.46,-93302.31,-11384.34];
e2 setpos [6672.33,2512.62,1.77];
e2 setvectordir [89675.20,-52083.52,-11384.99];
sleep 1;
titleCut ["","Black in",2];
player playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
of playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
sleep 1;
e1 doTarget player;
e2 doTarget of;
sleep 5;
titlecut ["","BLACK out",2];
3 fadeMusic 0;
3 fadesound 0;
sleep 3;
titleText [localize "STR_proval4", "PLAIN"];
sleep 3;
endMission "LOSER";
}
else {
exit;}
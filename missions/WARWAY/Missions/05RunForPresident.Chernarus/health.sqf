waituntil {damage player > 0.3};
if (score < 3) then {
health = player addAction [localize "STR_ID1", "Bandage.sqf"];
score = score + 1;
}
else
{
playsound "STRD_PIOBandage";
sleep 1;
exit;
}
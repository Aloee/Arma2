sleep 2;
task1 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 3;
player saveStatus "juriy_status_mik1"; 
if(go3) then 
{
task2 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task2, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
titlecut ["","BLACK out",3];
3 fadeMusic 0;
3 fadesound 0;
sleep 3;
endMission "END1";
}
else {
titlecut ["","BLACK out",3];
3 fadeMusic 0;
3 fadesound 0;
sleep 3;
endMission "END1";}

setAccTime 1;
con=false;
_array3 = [i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, i32, i33, i34, i35, i36, i37, i38, i39, btr1, btr2, btr3];
{_x allowFleeing 1} foreach _array3;
_group1 = group i1;
_group2 = group i14;
_group3 = group i27;
deleteWaypoint [_group1, 4];
deleteWaypoint [_group2, 4];
deleteWaypoint [_group3, 4];
sleep 1;
_w1 = _group1 addWaypoint [position car, 4];
_w2 = _group2 addWaypoint [position car, 4];
_w3 = _group3 addWaypoint [position car, 4];
_w1 setWaypointType "MOVE";
_w2 setWaypointType "MOVE";
_w3 setWaypointType "MOVE";
final=true;
task1 setTaskState "SUCCEEDED";
pioneer=[objNull, objNull, task1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 4;
task2 = player createSimpleTask [localize "STRD_Task2"];
task2 setSimpleTaskDescription[localize "STRD_Task2_1", localize "STRD_Task2", localize "STRD_Task2"];
player setCurrentTask task2;
sleep 1;
pioneer=[objNull, ObjNull, task2, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
playmusic "Run";


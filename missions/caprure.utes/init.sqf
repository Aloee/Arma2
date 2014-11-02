_markerPos = getMarkerPos "point1";
_markerRadius = getMarkerSize "point1";

_trg=createTrigger["EmptyDetector", _markerPos];
_trg setTriggerArea[_markerRadius select 0, _markerRadius select 1, 0, false];
_trg setTriggerActivation["ANY","PRESENT", true];
_trg setTriggerStatements["this", "thisTrigger execVM ""capture.sqf""", ""];

_trg setVariable ["properties", [civilian, 0, false, false]];
_trg setVariable ["assignedMarker", "point1"];

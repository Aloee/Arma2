_arr = [
	[localize "STRD_tactical_stop", "gestureFreeze"],
	[localize "STRD_tactical_go", "gestureGo"],
	[localize "STRD_tactical_cover", "GestureCover"],
	[localize "STRD_tactical_attack", "GestureAttack"],
	[localize "STRD_tactical_ceasefire", "GestureCeaseFire"],
	[localize "STRD_tactical_follow", "GestureFollow"],
	[localize "STRD_tactical_up", "GestureUp"],
	[localize "STRD_tactical_advance", "GestureAdvance"],
	[localize "STRD_tactical_point", "GesturePoint"]
];
_dialogActions = [[localize "STRD_tactical", true]];

	for "_i" from 0 to (count _arr)-1 do {
		_localize = (_arr select _i) select 0; _gesture = (_arr select _i) select 1;
		_dialogActions set [count _dialogActions, [_localize, [_i+2], "",-5, [["expression", "player playactionnow '"+_gesture+"';player groupChat '"+_localize+"'"]],"1","1"]];
	};
	showCommandingMenu "#USER:_dialogActions";
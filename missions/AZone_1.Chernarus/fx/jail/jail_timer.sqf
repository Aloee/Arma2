_killer = _this select 0;

if (!alive _killer) exitWith {jailCountdownActive=false};

_jailTimeLeft=jail_timer * kill_count;

timeFormat2 = {
	private ["_hours", "_minutes", "_seconds"];
	_hours = 0;
	_minutes = 0;
	_seconds = 0;
	_seconds = _this;
	if (_seconds > 59) then {
		_minutes = floor (_seconds / 60);
		_seconds = _seconds - (_minutes * 60);
	};
	if (_minutes > 59) then {
		_hours = floor (_minutes / 60);
		_minutes = _minutes - (_hours * 60);
	};
	if (_seconds < 10) then {
		_seconds = format ["0%1", _seconds];
	};
	if (_minutes < 10) then {
		_minutes = format ["0%1", _minutes];
	};
	[_hours, _minutes, _seconds]
};

while {((alive _killer) && (_jailTimeLeft > 0) && (_jailTimeLeft < 100000))} do {
	_timeRemaining = _jailTimeLeft call timeFormat2;
	_jailTimerMsg = composeText [parsetext format[localize "STRD_title_jailTimer",(_timeRemaining select 0), (_timeRemaining select 1), (_timeRemaining select 2)]];
	_jailTimeLeft = _jailTimeLeft - 1;
	hintsilent _jailtimerMsg;
	sleep 1;
	if (!alive _Killer) exitWith {jailCountdownActive=false;};
};

jailCountdownActive=false;

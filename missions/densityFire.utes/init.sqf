denRadius = 30;
bullets = [];

{
    {
        _ehIndex = _x addEventHandler ["Fired", {
            bullets set [count bullets, _this select 6];
            _this  spawn {
                private ["_last_pos"];

                _unit = _this select 0;
                _bullet = _this select 6;
                
                while{(getPosATL _bullet) select 0 > 0}do{_last_pos = getPosATL _bullet; sleep 0.01};
                
                {
                    {
                        if(_x distance _last_pos <= denRadius)then{
                            if(isNil {_x getVariable "densityFire"})then{_x setVariable ["densityFire", 0]};
                            _x setVariable ["densityFire", (_x getVariable "densityFire") + 1];
                        };
                    } foreach units _x;
                } foreach allGroups;
            };
        }];
    } foreach (units _x);
}foreach allGroups;


t1 allowDamage false;

{_x dofire t1} foreach (units (group a1));

player addaction ["checkDensity", "action.sqf", [], 6, false, false, "", ""];
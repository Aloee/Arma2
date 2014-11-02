if(!local player)exitwith{}

private ["_xpos", "_ypos", "_dis", "_damage"];

_xpos = _this select 0;
_ypos = _this select 1;

for [{_dis = 300}, {_dis <= argt_nuclear_radius}, {_dis = _dis + 100}] do
{
  [_xpos, _ypos, _dis] exec "fx\boom\script\wave.sqs";
  if ( _dis < 800 ) then {[_xpos, _ypos, _dis] execvm "fx\boom\script\noise.sqf"};
  {
    if ( ! (_x iskindof "Land_nav_pier_m_2") ) then
    {
      if ( _x iskindof "Static" ) then {_damage = 0.15 + random 0.1} else
      {
        if ( _x iskindof "Man" || _x iskindof "Air" ) then {_damage = 0.1 + random 0.06}
        else
        {
          {_x setdammage ((getdammage _x) + 0.07)} foreach (crew _x);
          _damage = 0.08 + random 0.04;
        };
      };
      _x setdammage ((getdammage _x) + _damage);
    };
  } foreach ([_xpos, _ypos, 0] nearobjects ["All", _dis]);
};

//[_xpos, _ypos, time] execvm "fx\boom\script\geiger.sqf";
//[_xpos, _ypos, time] execvm "fx\boom\script\radiation.sqf";
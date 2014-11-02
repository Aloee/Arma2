_unit= _this select 0;
_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
sleep 6;
_unit setDir ((getDir _unit)+180);
_dir_th = getDir _unit;
_pos_th =  _unit modelToWorld [0,0,0];
_unit setPos  [(_pos_th select 0) + 1.5*sin _dir_th, (_pos_th select 1) + 1.5*cos _dir_th, _pos_th select 2];
_unit switchMove "ActsPknlMstpSnonWnonDnon_TreatingInjured_NikitinDead";
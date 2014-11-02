if(local player)then{



private ["_next","_cnt","_dis","_height","_agl","_con", "_color"];

_posx = _this select 0;
_posy = _this select 1;
_height = _this select 2;
_rad = _this select 3;
_color = _this select 4;

if(isNil "_color")then{_color = [0.65, 0.65, 0.65, 0];};

_next = 0;
_dis = _rad;

_con = 10;
_sclz = 1;
_cnt=0;
_agl = random 360;

while {_next<5} do 
{
	if (_cnt >89) then {
	_dis = _dis + 5;
	_height = _height - 3;
	_next = _next + 1;
	_cnt = 0;
	_agl = random 360;
	_con = _con + 2;
	};
	
_coef = 0.98 + random 0.04;
_velx = (sin _agl) * _rad * _coef;
_vely = (cos _agl) * _rad * _coef;
_velz = 0.1;
_col = 0.2 - random 0.4;


	drop ["\Ca\Data\Cl_basic","","Billboard", 1, _con + random 0.05,[_posx + _dis * (sin _agl),_posy + _dis * (cos _agl), _height],[_velx+0.7,_vely+0.7,_velz],1,1.360,1.0,0.01,[3,6],[_color,[_col + 0.55, _col + 0.5, _col + 0.45, _sclz],[_col + 0.55, _col + 0.5, _col + 0.45, _sclz * 0.8],[_col + 0.5, _col + 0.45, _col + 0.4, _sclz * 0.6]],[0],0.0,2.0,"","",""];

_agl = _agl + 4;
_cnt = _cnt + 1;
};

};
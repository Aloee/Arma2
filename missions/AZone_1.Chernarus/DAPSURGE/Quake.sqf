_unit = _this select 0;
_ps = _unit modelToWorld [0,0,0];
DAP_SURGE = 1;
While {DAP_SURGE==1} do {
player switchCamera "Internal"; 
_unit SetPos [(_ps select 0) + random 0.15,(_ps select 1) + random 0.15,(_ps select 2) + random 0.15];
Sleep 0.1;
}; 
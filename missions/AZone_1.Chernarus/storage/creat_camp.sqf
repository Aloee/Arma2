_c_pl = (_this select 0);
_campart = ((_this select 3) select 0);

if({(getMarkerPos (_x select 0)) distance getPosATL _c_pl < MIN_DIST_CAMPCITYS} count (citys+[["dolg"],["svoboda"],["markerBar"]]) == 0)then{

	ZONA_serverexec_campaction = [_c_pl, _campart];
	publicVariable "ZONA_serverexec_campaction";

}else{
	hint parseText (["Red", format [localize "STR_hint_cdcamp", MIN_DIST_CAMPCITYS]] call fx_getformat_string);
};
{
	_c = _x select 0;
	_d = _x select 1;
	
	_lampposts = (getMarkerPos _c) nearObjects ["Streetlamp", _d];
	if(count _lampposts != 0)then{
			{  _x setDammage 1; deleteCollection _x }foreach _lampposts;
	};
sleep 1;		
}foreach citys; 
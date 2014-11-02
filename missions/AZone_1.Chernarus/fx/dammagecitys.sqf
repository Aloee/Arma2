_dam = [1, 0.9, 0.9, 0.9];
{
	_c = _x select 0;
	_d = _x select 1;
	
	_houses = (getMarkerPos _c) nearObjects ["House", _d];
	if(count _houses != 0)then{
		{ _x setDammage (_dam select floor random count _dam)  } foreach _houses;
	};
sleep 1;		
}foreach citys; 
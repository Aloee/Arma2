{
	_nearPos = _x select 0;
	_id = _x select 1;
	
	_map_obj = _nearPos nearestObject _id;
	_map_obj setdammage 1;
	deleteCollection _map_obj;
	
}foreach [
	[[5268.8,5508.43,1.11471], 218381],
	[[5267.76,5504.58,0.950406], 218378],
	[[5266.73,5500.72,1.01996], 218377],
	[[5265.69,5496.85,1.01645], 218376]
];
while{true}do{
sleep 600;

	_saveHabar = ["HABAR", allhabars] call AOS_SERIALIZE;
	_saveData = ["DATA", dataStorage] call AOS_SERIALIZE;

	if(_saveHabar && _saveData)then{
		[nil, nil, rCALLVAR, [], {debug globalChat localize "STRD_title_storageSaved"}] call RE;	
	}else{
		[nil, nil, rCALLVAR, [], {debug globalChat localize "STRD_title_storageSavedError"}] call RE;
	};


};
if(local player)then{

	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	
	//check key number
	//hintsilent str _key;
	
	0=switch(_key)do{
		//( TAB )
		case 15:{
			createDialog "TEST_DIALOG";
		};
		default {};
	};
};
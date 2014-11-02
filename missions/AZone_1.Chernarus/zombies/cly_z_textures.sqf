//Zombie Faces for JIP clients
if(local player)then{
	{

		if (!isNil {_x getVariable "face"}) then {
			if (typeName (_x getVariable "face")=="STRING") then {
				_x setFace (_x getVariable "face");
				_x setVariable ["face", nil];
			};
			if (!isNil {_x getVariable "texture"}) then {
				if (typeName (_x getVariable "texture")=="STRING") then {
					_x setObjectTexture [0, _x getVariable "texture"];
					_x setVariable ["texture", nil];
				};
			};
		};
	}forEach zombies;
};
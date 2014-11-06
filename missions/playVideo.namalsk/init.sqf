waitUntil{!isNil "bis_fnc_init"};

while{true}do{
	_video = ["hallowen.ogv", [-0.5, -0.5, 2, 2], [1,1,1,0.2]] spawn bis_fnc_playVideo;
	waitUntil{sleep 0.1; scriptDone _video};
};
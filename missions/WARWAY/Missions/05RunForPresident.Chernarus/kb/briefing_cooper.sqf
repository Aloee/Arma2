BIS_convMenu = [];

if (_from == p1 && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO1", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO1", _topic, "STRD_PIO1", []]]
};

if (p1 kbWasSaid [player, "briefing", "STRD_PIO2", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO3", _topic, "STRD_PIO3", []]];
};

if (_from == p2 && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO5", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO5", _topic, "STRD_PIO5", []]]
};

if (p2 kbWasSaid [player, "briefing", "STRD_PIO6", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO7", _topic, "STRD_PIO7", []]]
};

if (_from == p3 && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO9", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO9", _topic, "STRD_PIO9", []]]
};

if (p3 kbWasSaid [player, "briefing", "STRD_PIO10", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO11", _topic, "STRD_PIO11", []]]
};

BIS_convMenu
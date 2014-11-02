BIS_convMenu = [];

if (_from == man && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO36", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO36", _topic, "STRD_PIO36", []]];
};

if (man kbWasSaid [player, "briefing", "STRD_PIO37", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO38", _topic, "STRD_PIO38", []]];
};

if (man kbWasSaid [player, "briefing", "STRD_PIO39", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO40", _topic, "STRD_PIO40", []]];
};

if (man kbWasSaid [player, "briefing", "STRD_PIO41", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO42", _topic, "STRD_PIO42", []]];
};

if (man kbWasSaid [player, "briefing", "STRD_PIO43", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO44", _topic, "STRD_PIO44", []]];
};


BIS_convMenu
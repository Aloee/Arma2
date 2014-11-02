BIS_convMenu = [];

if (_from == locman && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO1", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO1", _topic, "STRD_PIO1", []]]
};

if (locman kbWasSaid [player, "briefing", "STRD_PIO2", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO3", _topic, "STRD_PIO3", []]];
};

if (locman kbWasSaid [player, "briefing", "STRD_PIO4", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO5", _topic, "STRD_PIO5", []]]
};

if (locman kbWasSaid [player, "briefing", "STRD_PIO6", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO7", _topic, "STRD_PIO7", []]]
};

if (locman kbWasSaid [player, "briefing", "STRD_PIO8", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO9", _topic, "STRD_PIO9", []]]
};

if (locman kbWasSaid [player, "briefing", "STRD_PIO10", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO11", _topic, "STRD_PIO11", []]]
};

if (locman kbWasSaid [player, "briefing", "STRD_PIO12", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO13", _topic, "STRD_PIO13", []]]
};


if (_from == locwoman && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO15", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO15", _topic, "STRD_PIO15", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO16", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO17", _topic, "STRD_PIO17", []]];
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO18", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO19", _topic, "STRD_PIO19", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO20", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO21", _topic, "STRD_PIO21", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO22", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO23", _topic, "STRD_PIO23", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO24", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO25", _topic, "STRD_PIO25", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO26", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO27", _topic, "STRD_PIO27", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO28_1", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO29", _topic, "STRD_PIO29", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO30", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO31", _topic, "STRD_PIO31", []]]
};

if (locwoman kbWasSaid [player, "briefing", "STRD_PIO32", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO33", _topic, "STRD_PIO33", []]]
};

if (_from == forester && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO35", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO35", _topic, "STRD_PIO35", []]]
};


if (forester kbWasSaid [player, "briefing", "STRD_PIO36", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO37", _topic, "STRD_PIO37", []]];
};
if (forester kbWasSaid [player, "briefing", "STRD_PIO38", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO39", _topic, "STRD_PIO39", []]];
};
if (forester kbWasSaid [player, "briefing", "STRD_PIO40", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO41", _topic, "STRD_PIO41", []]];
};


if (_from == c1 && _sentenceId == "" && !(_this kbWasSaid [_from, _topic, "STRD_PIO45", 999999])) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO45", _topic, "STRD_PIO45", []]]
};

if (c1 kbWasSaid [player, "briefing", "STRD_PIO46", 1]) then {
	BIS_convMenu = BIS_convMenu + [[localize "STRD_PIO47", _topic, "STRD_PIO47", []]];
};


BIS_convMenu
while {true} do {
	if !((life_hideout_flag select 0) isEqualTo []) then {
		(life_hideout_flag select 0) setFlagTexture (life_hideout_flag select 1);
		[(life_hideout_flag select 0), 1] spawn BIS_fnc_animateFlag;
	};
	uisleep 5;
};
if(isServer)exitWith{};
private["_msg","_unit"];
_unit = _this select 0;
life_known_Players pushBack _unit;
_msg = _this select 1;
//h/intSilent parseText _msg;
[parseText _msg,"PURPLE",15] spawn life_fnc_notification_system;